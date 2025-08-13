library(QZ, quiet = TRUE)

### https://www.netlib.org/lapack/lug/node89.html
A <- exA2$A
ret <- qz.dgees(A)

# Verify 1
A.new <- ret$Q %*% ret$T %*% solve(ret$Q)
round(A - A.new)

# verify 2
round(ret$Q %*% solve(ret$Q))
