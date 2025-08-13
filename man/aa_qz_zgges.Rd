\name{qz.zgges}
\alias{qz.zgges}
\title{QZ Decomposition for Complex Paired Matrices}
\description{
  This function call 'zgges' in Fortran to decompose 'complex' matrices (A,B).
}
\usage{
  qz.zgges(A, B, vsl = TRUE, vsr = TRUE, LWORK = NULL)
}
\arguments{
  \item{A}{a 'complex' matrix, dim = c(N, N).}
  \item{B}{a 'complex' matrix, dim = c(N, N).}
  \item{vsl}{if compute left 'complex' Schur vectors. (Q)}
  \item{vsr}{if compute right 'complex' Schur vectors. (Z)}
  \item{LWORK}{optional, dimension of array WORK for workspace. (>= 2N)}
}
\details{
  See 'zgges.f' for all details.

  ZGGES computes for a pair of N-by-N complex non-symmetric matrices
  (A,B), the generalized eigenvalues, the generalized complex Schur
  form (S, T), and optionally left and/or right Schur vectors (VSL
  and VSR). This gives the generalized Schur factorization

          (A,B) = ( (VSL)*S*(VSR)**H, (VSL)*T*(VSR)**H )

  where (VSR)**H is the conjugate-transpose of VSR.

  Optionally, it also orders the eigenvalues so that a selected cluster
  of eigenvalues appears in the leading diagonal blocks of the upper
  triangular matrix S and the upper triangular matrix T. The leading
  columns of VSL and VSR then form an unitary basis for the
  corresponding left and right eigenspaces (deflating subspaces).

  (If only the generalized eigenvalues are needed, use the driver
  ZGGEV instead, which is faster.)

  A generalized eigenvalue for a pair of matrices (A,B) is a scalar w
  or a ratio alpha/beta = w, such that  A - w*B is singular.  It is
  usually represented as the pair (alpha,beta), as there is a
  reasonable interpretation for beta=0, and even for both being zero.

  A pair of matrices (S,T) is in generalized complex Schur form if S
  and T are upper triangular and, in addition, the diagonal elements
  of T are non-negative real numbers.
}
\value{
  Return a list contains next:
  \item{'S'}{A's generalized Schur form.}
  \item{'T'}{B's generalized Schur form.}
  \item{'ALPHA'}{ALPHA[j]/BETA[j] are generalized eigenvalues.}
  \item{'BETA'}{ALPHA[j]/BETA[j] are generalized eigenvalues.}
  \item{'VSL'}{original returns from 'zgges.f'.}
  \item{'VSR'}{original returns from 'zgges.f'.}
  \item{'WORK'}{optimal LWORK (for zgges.f only)}
  \item{'INFO'}{= 0: successful. < 0: if INFO = -i, the i-th argument had
                an illegal value. =1,...,N: QZ iteration failed.
                =N+1: other than QZ iteration failed in ZHGEQZ.
                =N+2: reordering problem.
                =N+3: reordering failed.}

  Extra returns in the list:
  \item{'Q'}{the left Schur vectors.}
  \item{'Z'}{the right Schur vectors.}
}
\references{
  Anderson, E., et al. (1999) \emph{LAPACK User's Guide,}
  3rd edition, SIAM, Philadelphia.

  \url{https://www.netlib.org/lapack/complex16/zgges.f}

  \url{https://en.wikipedia.org/wiki/Schur_decomposition}
}
\author{
  Wei-Chen Chen \email{wccsnow@gmail.com}
}
\seealso{
  \code{\link{qz.zggev}}
}
\examples{
% \dontrun{
library(QZ, quiet = TRUE)

### https://www.netlib.org/lapack/lug/node124.html
A <- exAB1$A
B <- exAB1$B
ret <- qz.zgges(A, B)

# Verify 1
A.new <- ret$Q \%*\% ret$S \%*\% H(ret$Z)
B.new <- ret$Q \%*\% ret$T \%*\% H(ret$Z)
round(A - A.new)
round(B - B.new)

# verify 2
round(ret$Q \%*\% H(ret$Q))
round(ret$Z \%*\% H(ret$Z))
% }
}
\keyword{utility}

