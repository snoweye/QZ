library(QZ, quiet = TRUE)

### https://www.nag.com/lapack-ex/node124.html
(ret <- qz(exAB1$A, exAB1$B))

### https://www.nag.com/lapack-ex/node119.html
(ret <- qz(exAB2$A, exAB2$B))

### https://www.nag.com/lapack-ex/node94.html
(ret <- qz(exA1$A))

### https://www.nag.com/lapack-ex/node89.html
(ret <- qz(exA2$A))


