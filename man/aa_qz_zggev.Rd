\name{qz.zggev}
\alias{qz.zggev}
\title{Generalized Eigenvalues Decomposition for Complex Paired Matrices}
\description{
  This function call 'zggev' in Fortran to decompose 'complex' matrices (A,B).
}
\usage{
  qz.zggev(A, B, vl = TRUE, vr = TRUE, LWORK = NULL)
}
\arguments{
  \item{A}{a 'complex' matrix, dim = c(N, N).}
  \item{B}{a 'complex' matrix, dim = c(N, N).}
  \item{vl}{if compute left 'complex' eigen vectors. (U)}
  \item{vr}{if compute right 'complex' eigen vectors. (V)}
  \item{LWORK}{optional, dimension of array WORK for workspace. (>= 2N)}
}
\details{
  See 'zggev.f' for all details.

  ZGGEV computes for a pair of N-by-N complex non-symmetric matrices
  (A,B), the generalized eigenvalues, and optionally, the left and/or
  right generalized eigenvectors.

  A generalized eigenvalue for a pair of matrices (A,B) is a scalar
  lambda or a ratio alpha/beta = lambda, such that A - lambda*B is
  singular. It is usually represented as the pair (alpha,beta), as
  there is a reasonable interpretation for beta=0, and even for both
  being zero.

  The right generalized eigenvector v(j) corresponding to the
  generalized eigenvalue lambda(j) of (A,B) satisfies

               A * v(j) = lambda(j) * B * v(j).

  The left generalized eigenvector u(j) corresponding to the
  generalized eigenvalues lambda(j) of (A,B) satisfies

               u(j)**H * A = lambda(j) * u(j)**H * B

  where u(j)**H is the conjugate-transpose of u(j).
}
\value{
  Return a list contains next:
  \item{'ALPHA'}{original returns from 'zggev.f'.}
  \item{'BETA'}{original returns from 'zggev.f'.}
  \item{'VL'}{original returns from 'zggev.f'.}
  \item{'VR'}{original returns from 'zggev.f'.}
  \item{'WORK'}{optimal LWORK (for zggev.f only)}
  \item{'INFO'}{= 0: successful. < 0: if INFO = -i, the i-th argument had
                an illegal value. =1,...,N: QZ iteration failed.
                =N+1: other than QZ iteration failed in ZHGEQZ.
                =N+2: reordering problem.
                =N+3: reordering failed.}

  Extra returns in the list:
  \item{'U'}{the left eigen vectors.}
  \item{'V'}{the right eigen vectors.}

  Note that 'VL' and 'VR' are scaled so the largest component has
  abs(real part) + abs(imag. part) = 1.
}
\references{
  Anderson, E., et al. (1999) \emph{LAPACK User's Guide,}
  3rd edition, SIAM, Philadelphia.

  \url{http://www.netlib.org/lapack/complex16/zggev.f}

  \url{http://en.wikipedia.org/wiki/Schur_decomposition}
}
\author{
  Wei-Chen Chen \email{wccsnow@gmail.com}
}
\seealso{
  \code{\link{qz.zgges}}
}
\examples{
\dontrun{
library(QZ, quiet = TRUE)

### http://www.nag.com/lapack-ex/node122.html
A <- exAB1$A
B <- exAB1$B
ret <- qz.zggev(A, B)

# Verify 1
(lambda <- ret$ALPHA / ret$BETA)    # Unstable
diff.R <- matrix(ret$BETA, 4, 4, byrow = TRUE) * A \%*\% ret$V -
          matrix(ret$ALPHA, 4, 4, byrow = TRUE) * B \%*\% ret$V
diff.L <- matrix(ret$BETA, 4, 4) * H(ret$U) \%*\% A -
          matrix(ret$ALPHA, 4, 4) * H(ret$U) \%*\% B
round(diff.R)
round(diff.L)

# Verify 2
round(ret$U \%*\% solve(ret$U))
round(ret$V \%*\% solve(ret$V))
}
}
\keyword{utility}

