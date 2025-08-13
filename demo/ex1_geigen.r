library(QZ, quiet = TRUE)

### https://www.netlib.org/lapack/lug/node122.html
(ret <- geigen(exAB1$A, exAB1$B))

### https://www.netlib.org/lapack/lug/node117.html
(ret <- geigen(exAB2$A, exAB2$B))

### https://www.netlib.org/lapack/lug/node92.html
(ret <- geigen(exA1$A))

### https://www.netlib.org/lapack/lug/node87.html
(ret <- geigen(exA2$A))
