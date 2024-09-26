####################################
####    Capitolo 8 - Fattori    ####
####################################


#---------- Fattori ---------

# 1
genere<-factor(c(rep(c("M","F"),3),"F","F","M"))
genere

# 2
levels(genere)<-c("donne","uomini")
genere

# 3
intervento<-factor(c(rep(c("CBT","Psicanalisi"),3),"Controllo","Controllo","CBT"))
intervento

# 4
intervento[7:8]<-"Farmaci"

levels(intervento)<-c(levels(intervento), "Farmaci")
intervento[7:8]<-"Farmaci"

# 5
trattamento<-as.factor(c(as.character(intervento),c("Farmaci","Controllo","Farmaci")))
