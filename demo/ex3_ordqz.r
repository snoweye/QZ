library(QZ, quiet = TRUE)

# Reordering eigenvalues
select <- c(TRUE, FALSE, FALSE, TRUE)
(ret <- qz(exAB1$A, exAB1$B, select = select))

select <- c(FALSE, TRUE, TRUE, FALSE)
(ret <- qz(exAB2$A, exAB2$B, select = select))

select <- c(TRUE, FALSE, FALSE, TRUE)
(ret <- qz(exA1$A, select = select))

select <- c(TRUE, FALSE, FALSE, TRUE)
(ret <- qz(exA2$A, select = select))


