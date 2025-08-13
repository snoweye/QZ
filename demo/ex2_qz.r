library(QZ, quiet = TRUE)

### https://www.netlib.org/lapack/lug/node124.html
(ret <- qz(exAB1$A, exAB1$B))

### https://www.netlib.org/lapack/lug/node119.html
(ret <- qz(exAB2$A, exAB2$B))

### https://www.netlib.org/lapack/lug/node94.html
(ret <- qz(exA1$A))

### https://www.netlib.org/lapack/lug/node89.html
(ret <- qz(exA2$A))


