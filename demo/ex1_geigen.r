library(QZ, quiet = TRUE)

### https://www.nag.com/lapack-ex/node122.html
(ret <- geigen(exAB1$A, exAB1$B))

### https://www.nag.com/lapack-ex/node117.html
(ret <- geigen(exAB2$A, exAB2$B))

### https://www.nag.com/lapack-ex/node92.html
(ret <- geigen(exA1$A))

### https://www.nag.com/lapack-ex/node87.html
(ret <- geigen(exA2$A))
