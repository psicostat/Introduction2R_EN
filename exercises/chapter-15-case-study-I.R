#===============================#
#====  Analisi Attaccamento ====#
#===============================#

#----    settings -----

rm(list = ls())

# install.packages("readxl") #  pacchetto per importare i dati da excel
# library(readxl)

#==========================#
#----    import-data    ----
#==========================#

my_data <- readxl::read_excel("Data/data-attachment.xls")
my_data <- as.data.frame(my_data)

class(my_data)

# Altre funzioni per importare
# csv_data <- read.csv2("Data/data-attachment.csv", header = TRUE, sep = ",") # per i file .csv
# load("Data/...")  # per i file .rda


# Descrizione dataset

str(my_data)

# Nel presente dataset sono riportati parte dei dati riguardanti un vero proggetto di ricerca.
# In questo studio è stata valutata nei bambini del 3° e 4° anno di scuola primaria la relazione tra:
# 1) attaccamento verso la madre
# 2) status socio-economico
# 3) problemi internalizzanti ed esternaizzanti

# Nel dataset abbiamo le seguenti variabili
# id : codice identificativo  di ogni bambino
# escludere : bambini che per i criteri dello studio non sono da includere nelle analisi finali (1=escludere; 0=includere)
# raccolta : i dati sono stati raccolti in due giornate diverse (1=raccolta A; 2=raccolta B )
# consenso : bambini che hanno ricevuto il consenso dei genitori per il trattamento dei dati (1=si; 0=no)
# presenza : bambini presenti il giorno della raccolta dati (1=si; 0=no)
# classe : classe frequentata dal bambino (3°anno o 4°anno scuole primarie)
# genere : genere del bambino (0=M; 1=F)
# mesi : età del bambio in mesi
# fas* (da 1 a 4): item del questionario sullo status socio-economico
# ssm* (da 1 a 15): item del questionario sicurezza materna
# sdq* (da 1 a 25): idem del questionario problemi internalizzanti e esternalizzanti

#==============================#
#----    munging data    ------
#==============================#

str(my_data)

#---- Codifico le variabili

# Rendo fattori le variabili categoriali
for(i in c("id", "escludere", "raccolta", "consenso", "presenza", "classe", "genere")){
  my_data[, i] <- factor(my_data[ ,i])
}

# ridefinisco i livelli della variabile genere
str(my_data$genere)
levels(my_data$genere) <- c("M", "F")

# creo la variabile eta dove indico l'eta in anni
my_data$eta <- my_data$mesi/12

#----    Selezione Dati

# Selezioni solo i soggetti senza NA
summary(my_data)
my_data$fas1 == "NA" # metodo sbagliato
is.na(my_data$fas1) # metodo corretto

my_data$id[is.na(my_data$fas1)]

?complete.cases # seleziona soggetti che non hanno NA

data_complete <- my_data[complete.cases(my_data), ]
summary(data_complete) # non ci sono più NA

# Seleziono solo i soggetti che hanno il consenso, da includere e che erano presenti
my_test <- data_complete$consenso=="1" & data_complete$escludere=="0" & data_complete$presenza=="1"
data_complete<-data_complete[my_test, ]
nrow(my_data) # numero totale di soggetti considerati nelle analisi

# Salvo il dataset "data_complete" con tutti i soggetti che userò nelle analisi
save(data_complete, file = "Data/data_complete.rda")

#===================================#
#----    Codifica questionari    ----
#===================================#

# Carico il dataset precedentemente creato
load("Data/data_complete.rda")
str(data_complete)

my_data <- data_complete # rinomino per comodità

#---- Codifica FAS

# Per quanto riguarda il FAS abbimao 4 item.
# Le possibili risposte sono
# item 1: 0-1
# item 2: 0-1-2
# item 3: 0-1-2-3
# item 4: 0-1-2-3

paste0("fas", 1:4)
# paste() e paste0() concatenano i valori per creare delle stringhe
# paste() aggiunge uno spazio, paste0() non aggiunge spazio

summary(my_data[ , paste0("fas", 1:4)])

# Purtoppo nella seconda raccolata c'è stata una codifica scorretta
# item 1: 1-2
# item 2: 1-2-3
# item 3: 1-2-3-4
# item 4: 1-2-3-4

# Dobbiamo riportarli alla scala originale (sottrarre 1)

# Divido i due dataset
data_1<-my_data[my_data$raccolta=="1",]
data_2<-my_data[my_data$raccolta=="2",]

for(my_var in paste0("fas", 1:4)){
  data_2[ , my_var] <- data_2[ , my_var] - 1
}

my_data<-rbind(data_1, data_2)  # Unire le i dataset per riga (cbind() è usato per le colonne)

summary(my_data[ , paste0("fas", 1:4)])

# C'è ancora un problema con fas2. Il massimo dovrebbe essere 2

table(my_data$fas2)  # Controllo quanti sono i punteggi sbagliati

my_data[my_data$fas2==3,"id"] # Controllo quale soggetto ha una codifica sbagliata

# Controllando la raccolta dati vadiamo ci sia stato un errore il valore per il soggetto 46 è 2
my_data$fas2[my_data$fas2==3] <- 2 # Correggo

#---- Punteggio FAS (status socio economico)

# Il punteggio tatale è dato dalla somma degli item singoli
# Punteggi alti indicano maggiore benessere
fas_tot<-apply(my_data[ , paste0("fas", 1:4)], MARGIN = 1, sum)

#---- Codifica SSM (Attaccamento verso la madre)

# Questionario con 15 item a risposte su scala likert a 4 punti
# Le risposte sono codificate come 1-2-3-4

# Tuttavia per costruire il punteggio finale è necessario
# invertire i punteggi degli item 1,3,4,9,10,13,15

# Ovvero: 1-->4; 2-->3; 3-->2; 4-->1

head(my_data[ , paste0("ssm", c(1,3,4,9,10,13,15))]) # head() osservo prime osservazioni

# Ricodifico variabili con scoring inverso
for(my_var in paste0("ssm", c(1,3,4,9,10,13,15))){
  my_data[ , my_var] <- abs(my_data[ , my_var] - 5)
}

head(my_data[ , paste0("ssm", c(1,3,4,9,10,13,15))])

#---- Punteggio SSM

# Ora il punteggio totale è dato dalla media degli item
# Punteggi alti indicano un attaccamento sicuro

ssm_tot <- apply(my_data[ , paste0("ssm", 1:15)], MARGIN = 1, mean)


#---- Codifica SDQ (Problemi internalizzanti ed esternalizzanti)

#  Questionario con 25 item a risposte su scala likert a 3 punti
# Le risposte sono codificate come 0-1-2

# Tuttavia per costruire il punteggio finale è necessario
# invertire i punteggi degli item 7,11,14,21,25

# Ovvero: 0-->2; 1-->1; 2-->0;

tail(my_data[ , paste0("sdq", c(7, 11, 14, 21, 25))]) # tail() osservo ultime osservazioni

# Ricodifico variabili con scoring inverso
for(my_var in paste0("sdq", c(7, 11, 14, 21, 25))){
  my_data[ , my_var] <- abs(my_data[ , my_var] - 2)
}

tail(my_data[ , paste0("sdq", c(7, 11, 14, 21, 25))])

#---- Punteggio SDQ

#  I punteggi totali sono dati dalla somma degli item
#  Punteggi più alti indicano maggiori problemi

#  Abbiamo 5 sottoscale formate dagli item:
#  emotion	=	3 8 13 16 24
#  conduct	=	5 7 12 18 22
#  hyper	=	2 10 15 21 25
#  peer	=	6 11 14 19 23
#  prosoc	=	1 4 9 17 20

#  Due punteggi riassuntivi vengono creati unendo le sottoscale

#  internalizing = emotion + peer
#  externalizing = hyper + conduct

item_int = paste0("sdq", c(3,6,8,11,13,14,16,19,23,24))
item_ext = paste0("sdq", c(2,5,7,10,12,15,18,21,22,25))

int_tot<-apply(my_data[ , item_int], MARGIN = 1, sum)
ext_tot<-apply(my_data[ , item_ext], MARGIN = 1, sum)

#---- Selezione Variabili

str(my_data)

# Seleziono solo le variabili di interesse che uso nelle analisi
data_finale<-cbind(my_data[ , c("id", "classe", "genere", "eta")],
                   fas_tot, ssm_tot, int_tot, ext_tot)

# Salvo il dataset finale che uso nelle analisi
save(data_finale, file="Data/data_finale.rda")

#======================================#
#----    Statistiche Descrittive    ----
#======================================#

# Carico il dataset precedentemente creato
load("Data/data_finale.rda")

my_data <- data_finale # rinomino per comodità

str(my_data)

# Valutiamo a livello descrittivo i problemi esternalizzanti
# a seconda del genere e della classe

#---- Variabili Qualitative

# table() per ottenere le tabelle di frequenza

table(my_data$genere)
table(my_data$classe)

table(my_data$genere, my_data$classe) # Tabella incrociata

#---- Variabili Quantitative

# summary() valuto alcune informazioni di interesse
summary(my_data$ext_tot)

# sd() valuto la deviazione standard
sd(my_data$ext_tot)

# tapply() applica la stessa funzione su una variabile per ogni gruppo definito nell'argometo INDEX
# nota che INDEX deve essere una lista
tapply(my_data$ext_tot, INDEX = list(my_data$genere, my_data$classe), FUN = mean)
tapply(my_data$ext_tot, INDEX = list(my_data$genere, my_data$classe), FUN = sd)

#---- Rappresentazione Grafica

# Densità
plot(density(my_data$ext_tot), xlab="Ext", main = "Distribuzione Ext", xlim = c(0,15))

# Istogramma
hist(my_data$ext_tot, col="lightblue", xlab="Ext", main = "Distribuzione Ext")

# Boxplot
boxplot(my_data$ext_tot, col="lightblue", xlab="Ext", main = "Distribuzione Ext")

# Variabile quantitativa e variabile qualitativa

# Per digitare il simbolo tilde (~)
# Windows: ALT + 126 (tastierino numerico)
#          ALT + Fn + 126 (senza tastierino)
# MacOS: option + 5

boxplot(my_data$ext_tot ~ my_data$genere, col="lightblue", ylab="Ext", xlab = "Genere", main = "Distribuzione Ext")

par(mfrow=c(1,2)) # Determino il numero di grafici da rappresentare su una stessa pagina

boxplot(my_data$ext_tot ~ my_data$genere, col="lightblue", ylab="Ext", xlab = "Genere", main = "Distribuzione Ext")
boxplot(my_data$ext_tot ~ my_data$classe, col="lightblue", ylab="Ext", xlab = "Classe", main = "Distribuzione Ext")

par(mfrow=c(1,1))
boxplot(my_data$ext_tot ~ my_data$classe * my_data$genere,
        col=c("lightgreen", "orange","lightblue","lightpink"),
        ylab="Ext", xlab = "Gruppi: Genere X Classe ", main = "Distribuzione Ext")

# Variabile qualitativa per variabile qualitativa
plot(my_data$ssm_tot, my_data$ext_tot)

# per risolvere problema sovrapposizione aggiungiamo un po di random error
plot(jitter(my_data$ssm_tot), jitter(my_data$ext_tot))

cor(my_data$ssm_tot, my_data$ext_tot)

#==============  Fine  ==============#



