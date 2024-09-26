####################################
####    Capitolo 9 - Matrici    ####
####################################

#---------  Creazione di matrici  -----

# 1
A<-matrix(data=c(2,34,12,7,46,93,27,99,23,38,7,04),
          ncol=4, nrow=3, byrow=TRUE)

# 2
B<-matrix(data=seq(from=1, by=2,length.out = 12),
          ncol=3, nrow=4, byrow=TRUE)

# 3
C<-matrix(data=seq(from=9, by=9,length.out = 12),
          ncol=4, nrow=3, byrow=TRUE)

# 4
D<-matrix(data=rep(c("A","B","C"), 4),
          ncol=3, nrow=4, byrow=TRUE)

# 5
E<-matrix(data=rep(c("A","B","C"), 4),
          ncol=4, nrow=3)


#---------- Selezione di matrici  ------

# 1
A[2,3]

# 2
B[2:4,2:3]

# 3
A[A%%2==0]

# 4
C[-3,-3]

# 5
B[2:3,]

# 6
D[D!="B"]

#---------  Operazioni tra matrici ------

# 1
G<-cbind(A,C[,1:2])

# 2
H<-rbind(C, t(B)[1:2,])

# 3
A<-A[,-2]
B<-B[-1,]
dim(A)==dim(B)

# 4
A*B
B*A
A%*%B
B%*%A

# 5
colnames(C)<-paste0("col_",1:4)
rownames(C)<-paste0("row_",1:3)
