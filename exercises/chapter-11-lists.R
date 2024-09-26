###################################
####    Capitolo 11 - Liste    ####
###################################

#---------  Creazione di Liste  -----

# 1
esperimento_1<-list(data_wide=data_wide,
                    A=A,x=x,
                    info="Hello world!")

# 2
esperimento_2<-list(data_long,
                    C,y,
                    info="Prima racolta dati")


#---------- Selezione di Liste  ------

# 1
esperimento_1[[1]][c(1,4),c("age","sex","gruppo")]

# 2
esperimento_1$data_wide[c(1,4),c("age","sex","gruppo")]

# 3
esperimento_2[[c(1,3)]]

# r select multiple object from a list
# https://stackoverflow.com/questions/12119019/select-multiple-elements-from-a-list
esperimento_2[c(1,3)]

# 4
names(esperimento_2)<-c("dati_esperimento", "matrice_VCV", "codici_Id", "note")
esperimento_2
