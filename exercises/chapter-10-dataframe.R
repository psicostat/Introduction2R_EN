########################################
####    Capitolo 10 - Dattaframe    ####
########################################

#---------  Creazione di DataFrames  -----

# 1
data_wide<-data.frame(Id=c("subj_1","subj_2","subj_3"),
                      age=c(21,23,19),
                      gender=c("F","M","F"),
                      item_1=c(2,1,1),
                      item_2=c(0,2,1),
                      item_3=c(2,0,1))

# 2
data_long<-data.frame(Id=rep(c("subj_1","subj_2","subj_3"),each=3),
                      age=rep(c(21,23,19),each=3),
                      gender=rep(c("F","M","F"),each=3),
                      item=rep(1:3,3),
                      response=c(2,1,1,0,2,1,2,0,1))


#---------- Selezione di DataFrames  ------

# 1
data_long[4:6,c(4,5)]

# 2
data_long[data_long$Id=="subj_2", c("item", "response")]

# 3
data_wide[data_wide$item_1==1, c("Id","gender")]

# 4
data_long[data_long$gender=="F" & data_long$age>20, ]

# 5
data_long[-(4:6),-3]


#---------  Funzioni DataFrame ------

# 1
data_wide$memory_pre<-c(3,2,1)
data_long$memeory_pre<-rep(c(3,2,1),each=3)

# 2
data_wide$gruppo<-c("trattamento","trattemento","controllo")
data_long$gruppo<-rep(c("trattamento","trattemento","controllo"),each=3)

# 3
data_new<-data.frame(Id=c("subj_4","subj_5"),
                     age=c(25,22),
                     gender=c("F","M"),
                     item_1=c(1,1),
                     item_2=c(0,1),
                     item_3=c(2,0),
                     memory_pre=c(1,3),
                     gruppo=c("trattemento","controllo"))

data_wide<-rbind(data_wide, data_new)

# 4
data_wide$memory_post<-with(data_wide, item_1+item_2+item_3)

# 5
colnames(data_wide)[4:6]<-paste0("problem_", 1:3)
data_wide
