\name{qz.dggev}
\alias{qz.dggev}
\title{Generalized Eigenvalues Decomposition for Real Paired Matrices}
\description{
  This function call 'dggev' in Fortran to decompose 'real' matrices (A,B).
}
\usage{
  qz.dggev(A, B, vl = TRUE, vr = TRUE, LWORK = NULL)
}
\arguments{
  \item{A}{a 'real' matrix, dim = c(N, N).}
  \item{B}{a 'real' matrix, dim = c(N, N).}
  \item{vl}{if compute left 'real' eigen vector. (U)}
  \item{vr}{if compute right 'real' eigen vector. (V)}
  \item{LWORK}{optional, dimension of array WORK for workspace. (>= 8N)}
}
\details{
  See 'dggev.f' for all details.

  DGGEV computes for a pair of N-by-N real non-symmetric matrices (A,B)
  the generalized eigenvalues, and optionally, the left and/or right
  generalized eigenvectors.

  A generalized eigenvalue for a pair of matrices (A,B) is a scalar
  lambda or a ratio alpha/beta = lambda, such that A - lambda*B is
  singular. It is usually represented as the pair (alpha,beta), as
  there is a reasonable interpretation for beta=0, and even for both
  being zero.

  The right eigenvector v(j) corresponding to the eigenvalue lambda(j)
  of (A,B) satisfies

                   A * v(j) = lambda(j) * B * v(j).

  The left eigenvector u(j) corresponding to the eigenvalue lambda(j)
  of (A,B) satisfies

                   u(j)**H * A  = lambda(j) * u(j)**H * B .

  where u(j)**H is the conjugate-transpose of u(j).
}
\value{
  Return a list contains next:
  \item{'ALPHAR'}{original returns from 'dggev.f'.}
  \item{'ALPHAI'}{original returns from 'dggev.f'.}
  \item{'BETA'}{original returns from 'dggev.f'.}
  \item{'VL'}{original returns from 'dggev.f'.}
  \item{'VR'}{original returns from 'dggev.f'.}
  \item{'WORK'}{optimal LWORK (for dggev.f only)}
  \item{'INFO'}{= 0: successful. < 0: if INFO = -i, the i-th argument had
                an illegal value. =1,...,N: QZ iteration failed.
                =N+1: other than QZ iteration failed in DHGEQZ.
                =N+2: reordering problem.
                =N+3: reordering failed.}

  Extra returns in the list:
  \item{'ALPHA'}{ALPHAR + ALPHAI * i.}
  \item{'U'}{the left eigen vectors.}
  \item{'V'}{the right eigen vectors.}

  If ALPHAI[j] is zero, then the j-th eigenvalue is real; if
  positive, then the j-th and (j+1)-st eigenvalues are a
  complex conjugate pair, with ALPHAI[j+1] negative.

  If the j-th eigenvalue is real, then
  U[, j] = VL[, j], the j-th column of VL. If the j-th and
  (j+1)-th eigenvalues form a complex conjugate pair, then
  U[, j] = VL[, j] + i * VL[, j+1] and
  U[, j+1] = VL[, j] - i * VL[, j+1].
  Each eigenvector is scaled so the largest component has
  abs(real part) + abs(imag. part) = 1.

  Similarly, for the right eigenvectors of V and VR.
}
\references{
  Anderson, E., et al. (1999) \emph{LAPACK User's Guide,}
  3rd edition, SIAM, Philadelphia.

  \url{https://www.netlib.org/lapack/double/dggev.f}

  \url{https://en.wikipedia.org/wiki/Schur_decomposition}
}
\author{
  Wei-Chen Chen \email{wccsnow@gmail.com}
}
\seealso{
  \code{\link{qz.dgges}}
}
\examples{
% \dontrun{
library(QZ, quiet = TRUE)

### https://www.netlib.org/lapack/lug/node117.html 
A <- exAB2$A
B <- exAB2$B
ret <- qz.dggev(A, B)

# Verify
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
% }
}
\keyword{utility}

