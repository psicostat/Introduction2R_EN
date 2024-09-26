####################################
####    Capitolo 7 - Vettori    ####
####################################

#---------  Creazione di vettori  -----

# 1
x<-c(4,6,12,34,8)

# 2
y<-seq(from = 2, to = 24, by=2)

# 3
z<-seq(from = 14, by=7,  length.out = 10)

# 4
s<-rep(c("A","B","C"), times=4)

# 5
t<-rep(c("A","B","C"), each=4)

# 6
rep(rep(c("foo", "bar"), each = 2),times = 2)

#---------- Selezione di vettori  ------

# 1
x[c(2,3,5)]

# 2
x[c(4,1)]

# 3
my_vector = c(2,4,6,8)
my_vector[my_vector]

# 4
y[y<13 | y>19]

# 5
z[z>24 & z<50]

# 6
s[s=="A"]

# 7
t[t!="B"]

# 8
u <- s
u[u == "A"] <- "U"

# 9
z[-c(3,5)]


#---------  Operazioni tra vettori ------

# 1
j<-c(x,z)

# 2
j<-j[-(13:15)]
length(j)==length(y)

# 3
y+j

# 4
z*3

# 5
y[1:10]*z


#----
