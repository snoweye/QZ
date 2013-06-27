\name{fda.geigen}
\alias{fda.geigen}
\title{ Generalized Eigen Analysis as in fda Package}
\description{
  This is an equivalent function to \code{fda::geigen} which 
  finds matrices L and M to maximize

  tr(L'AM) / sqrt(tr(L'BL) tr(M'CM))

  where A = a p x q matrix, B = p x p symmetric, positive definite
  matrix, B = q x q symmetric positive definite matrix, L = p x s
  matrix, and M = q x s matrix, where s = the number of non-zero
  generalized eigenvalues of A.
}
\usage{
  fda.geigen(Amat, Bmat, Cmat)
}
\arguments{
  \item{Amat}{ a numeric matrix }
  \item{Bmat}{
    a symmetric, positive definite matrix with dimension = number of
    rows of A
  }
  \item{Cmat}{
    a symmetric, positive definite matrix with dimension = number of
    columns of A
  }
}
\details{
  This function is equivalent to \code{fda::geigen(Amat, Bmat, Cmat)}
  except that this is rewritten and utilizes LAPACK functions
  via \code{qz.dggev}.

  Also, \code{Lmat} and \code{Mmat} are both scaled such that
  L'BL and M'CM are identity matrices.
}
\value{
  list(values, Lmat, Mmat)
}
\author{
  Wei-Chen Chen \email{wccsnow@gmail.com}
}
\seealso{
  \code{\link{qz.geigen}}, \code{\link{qz.dggev}}.
}
\examples{
\dontrun{
library(QZ, quiet = TRUE)

A <- matrix(as.double(1:6), 2)
B <- matrix(as.double(c(2, 1, 1, 2)), 2)
C <- diag(as.double(1:3))

ret.qz <- fda.geigen(A, B, C)

### Verify
ret.fda <- fda::geigen(A, B, C)
}
}
\keyword{programming}

