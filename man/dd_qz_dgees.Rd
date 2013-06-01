\name{qz.dgees}
\alias{qz.dgees}
\title{QZ Decomposition for a Real Matrix}
\description{
  This function call 'dgees' in Fortran to decompose a 'real' matrix A.
}
\usage{
  qz.dgees(A, vs = TRUE, LWORK = NULL)

}
\arguments{
  \item{A}{a 'real' matrix, dim = c(N, N).}
  \item{vs}{if compute 'real' Schur vectors. (Q)}
  \item{LWORK}{optional, dimension of array WORK for workspace. (>= 3N)}
}
\details{
  See 'dgees.f' for all details.

  DGEES computes for an N-by-N real non-symmetric matrix A, the
  eigenvalues, the real Schur form T, and, optionally, the matrix of
  Schur vectors Q.  This gives the Schur factorization A = Q*T*(Q**T).

  Optionally, it also orders the eigenvalues on the diagonal of the
  real Schur form so that selected eigenvalues are at the top left.
  The leading columns of Q then form an orthonormal basis for the
  invariant subspace corresponding to the selected eigenvalues.

  A matrix is in real Schur form if it is upper quasi-triangular with
  1-by-1 and 2-by-2 blocks. 2-by-2 blocks will be standardized in the
  form

          [  a  b  ]
          [  c  a  ]

  where b*c < 0. The eigenvalues of such a block are a +- sqrt(bc).
}
\value{
  Return a list contains next:
  \item{'T'}{A's generalized Schur form.}
  \item{'WR'}{original returns from 'dgees.f'.}
  \item{'WI'}{original returns from 'dgees.f'.}
  \item{'VS'}{original returns from 'dgees.f'.}
  \item{'WORK'}{optimal LWORK (for dgees.f only)}
  \item{'INFO'}{= 0: successful. < 0: if INFO = -i, the i-th argument had
                an illegal value. <= N: QZ iteration failed.
                =N+1: reordering problem.
                =N+2: reordering failed.}

  Extra returns in the list:
  \item{'W'}{WR + WI * i.}
  \item{'Q'}{the Schur vectors.}
}
\references{
  Anderson, E., et al. (1999) \emph{LAPACK User's Guide,}
  3rd edition, SIAM, Philadelphia.

  \url{http://www.netlib.org/lapack/double/dgees.f}

  \url{http://en.wikipedia.org/wiki/Schur_decomposition}
}
\author{
  Wei-Chen Chen \email{wccsnow@gmail.com}
}
\seealso{
  \code{\link{qz.dgeev}}
}
\examples{
\dontrun{
library(QZ, quiet = TRUE)

### http://www.nag.com/lapack-ex/node89.html
A <- exA2$A
ret <- qz.dgees(A)

# Verify 1
A.new <- ret$Q \%*\% ret$T \%*\% solve(ret$Q)
round(A - A.new)

# verify 2
round(ret$Q \%*\% solve(ret$Q))
}
}
\keyword{utility}

