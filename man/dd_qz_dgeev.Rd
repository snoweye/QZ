\name{qz.dgeev}
\alias{qz.dgeev}
\title{Generalized Eigenvalues Decomposition for a Real Matrix}
\description{
  This function call 'dgeev' in Fortran to decompose a 'real' matrix A.
}
\usage{
  qz.dgeev(A, vl = TRUE, vr = TRUE, LWORK = NULL)
}
\arguments{
  \item{A}{a 'real' matrix, dim = c(N, N).}
  \item{vl}{if compute left 'real' eigen vector. (U)}
  \item{vr}{if compute right 'real' eigen vector. (V)}
  \item{LWORK}{optional, dimension of array WORK for workspace. (>= 4N)}
}
\details{
  See 'dgeev.f' for all details.

  DGEEV computes for an N-by-N real non-symmetric matrix A, the
  eigenvalues and, optionally, the left and/or right eigenvectors.

  The right eigenvector v(j) of A satisfies

                   A * v(j) = lambda(j) * v(j)

  where lambda(j) is its eigenvalue.
  The left eigenvector u(j) of A satisfies

                u(j)**T * A = lambda(j) * u(j)**T

  where u(j)**T denotes the transpose of u(j).

  The computed eigenvectors are normalized to have Euclidean norm
  equal to 1 and largest component real.
}
\value{
  Return a list contains next:
  \item{'WR'}{original returns from 'dgeev.f'.}
  \item{'WI'}{original returns from 'dgeev.f'.}
  \item{'VL'}{original returns from 'dgeev.f'.}
  \item{'VR'}{original returns from 'dgeev.f'.}
  \item{'WORK'}{optimal LWORK (for dgeev.f only)}
  \item{'INFO'}{= 0: successful. < 0: if INFO = -i, the i-th argument had
                an illegal value. > 0: QZ iteration failed.}

  Extra returns in the list:
  \item{'W'}{WR + WI * i.}
  \item{'U'}{the left eigen vectors.}
  \item{'V'}{the right eigen vectors.}

  If WI[j] is zero, then the j-th eigenvalue is real; if
  positive, then the j-th and (j+1)-st eigenvalues are a
  complex conjugate pair, with WI[j+1] negative.

  If the j-th eigenvalue is real, then
  U[, j] = VL[, j], the j-th column of VL. If the j-th and
  (j+1)-th eigenvalues form a complex conjugate pair, then
  U[, j] = VL[, j] + i * VL[, j+1] and
  U[, j+1] = VL[, j] - i * VL[, j+1].

  Similarly, for the right eigenvectors of V and VR.
}
\references{
  Anderson, E., et al. (1999) \emph{LAPACK User's Guide,}
  3rd edition, SIAM, Philadelphia.

  \url{http://www.netlib.org/lapack/double/dgeev.f}

  \url{http://en.wikipedia.org/wiki/Schur_decomposition}
}
\author{
  Wei-Chen Chen \email{wccsnow@gmail.com}
}
\seealso{
  \code{\link{qz.dgees}}
}
\examples{
% \dontrun{
library(QZ, quiet = TRUE)

### http://www.nag.com/lapack-ex/node87.html
A <- exA2$A
ret <- qz.dgeev(A)

# Verify 1
diff.R <- A \%*\% ret$V - matrix(ret$W, 4, 4, byrow = TRUE) * ret$V
diff.L <- t(ret$U) \%*\% A - matrix(ret$W, 4, 4) * t(ret$U)
round(diff.R)
round(diff.L)

# Verify 2
round(ret$U \%*\% solve(ret$U))
round(ret$V \%*\% solve(ret$V))
% }
}
\keyword{utility}

