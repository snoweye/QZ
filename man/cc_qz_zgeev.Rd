\name{qz.zgeev}
\alias{qz.zgeev}
\title{Generalized Eigenvalues Decomposition for a Complex Matrix}
\description{
  This function call 'zgeev' in Fortran to decompose a 'complex' matrix A.
}
\usage{
  qz.zgeev(A, vl = TRUE, vr = TRUE, LWORK = NULL)
}
\arguments{
  \item{A}{a 'complex' matrix, dim = c(N, N).}
  \item{vl}{if compute left 'complex' eigen vectors. (U)}
  \item{vr}{if compute right 'complex' eigen vectors. (V)}
  \item{LWORK}{optional, dimension of array WORK for workspace. (>= 2N)}
}
\details{
  See 'zgeev.f' for all details.

  ZGEEV computes for an N-by-N complex non-symmetric matrix A, the
  eigenvalues and, optionally, the left and/or right eigenvectors.

  The right eigenvector v(j) of A satisfies

                   A * v(j) = lambda(j) * v(j)

  where lambda(j) is its eigenvalue.
  The left eigenvector u(j) of A satisfies

                u(j)**H * A = lambda(j) * u(j)**H

  where u(j)**H denotes the conjugate transpose of u(j).

  The computed eigenvectors are normalized to have Euclidean norm
  equal to 1 and largest component real.
}
\value{
  Return a list contains next:
  \item{'W'}{original returns from 'zgeev.f'.}
  \item{'VL'}{original returns from 'zgeev.f'.}
  \item{'VR'}{original returns from 'zgeev.f'.}
  \item{'WORK'}{optimal LWORK (for zgeev.f only)}
  \item{'INFO'}{= 0: successful. < 0: if INFO = -i, the i-th argument had
                an illegal value. > 0: QZ iteration failed.}

  Extra returns in the list:
  \item{'U'}{the left eigen vectors.}
  \item{'V'}{the right eigen vectors.}
}
\references{
  Anderson, E., et al. (1999) \emph{LAPACK User's Guide,}
  3rd edition, SIAM, Philadelphia.

  \url{https://www.netlib.org/lapack/complex16/zgeev.f}

  \url{https://en.wikipedia.org/wiki/Schur_decomposition}
}
\author{
  Wei-Chen Chen \email{wccsnow@gmail.com}
}
\seealso{
  \code{\link{qz.zgees}}
}
\examples{
% \dontrun{
library(QZ, quiet = TRUE)

### https://www.nag.com/lapack-ex/node92.html
A <- exA1$A
ret <- qz.zgeev(A)

# Verify 1
diff.R <- A \%*\% ret$V - matrix(ret$W, 4, 4, byrow = TRUE) * ret$V
diff.L <- H(ret$U) \%*\% A - matrix(ret$W, 4, 4) * H(ret$U)
round(diff.R)
round(diff.L)

# Verify 2
round(ret$U \%*\% H(ret$U))
round(ret$V \%*\% H(ret$V))
% }
}
\keyword{utility}

