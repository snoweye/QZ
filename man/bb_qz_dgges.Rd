\name{qz.dgges}
\alias{qz.dgges}
\title{QZ Decomposition for Real Paired Matrices}
\description{
  This function call 'dgges' in Fortran to decompose 'real' matrices (A,B).
}
\usage{
  qz.dgges(A, B, vsl = TRUE, vsr = TRUE, LWORK = NULL)
}
\arguments{
  \item{A}{a 'real' matrix, dim = c(N, N).}
  \item{B}{a 'real' matrix, dim = c(N, N).}
  \item{vsl}{if compute left 'real' Schur vectors. (Q)}
  \item{vsr}{if compute right 'real' Schur vectors. (Z)}
  \item{LWORK}{optional, dimension of array WORK for workspace. (>= 8N+16)}
}
\details{
  See 'dgges.f' for all details.

  DGGES computes for a pair of N-by-N real non-symmetric matrices (A,B),
  the generalized eigenvalues, the generalized real Schur form (S,T),
  optionally, the left and/or right matrices of Schur vectors (VSL and
  VSR). This gives the generalized Schur factorization

           (A,B) = ( (VSL)*S*(VSR)**T, (VSL)*T*(VSR)**T )

  Optionally, it also orders the eigenvalues so that a selected cluster
  of eigenvalues appears in the leading diagonal blocks of the upper
  quasi-triangular matrix S and the upper triangular matrix T.The
  leading columns of VSL and VSR then form an orthonormal basis for the
  corresponding left and right eigenspaces (deflating subspaces).

  (If only the generalized eigenvalues are needed, use the driver
  DGGEV instead, which is faster.)

  A generalized eigenvalue for a pair of matrices (A,B) is a scalar w
  or a ratio alpha/beta = w, such that  A - w*B is singular.  It is
  usually represented as the pair (alpha,beta), as there is a
  reasonable interpretation for beta=0 or both being zero.

  A pair of matrices (S,T) is in generalized real Schur form if T is
  upper triangular with non-negative diagonal and S is block upper
  triangular with 1-by-1 and 2-by-2 blocks.  1-by-1 blocks correspond
  to real generalized eigenvalues, while 2-by-2 blocks of S will be
  "standardized" by making the corresponding elements of T have the
  form:

          [  a  0  ] \cr
          [  0  b  ]

  and the pair of corresponding 2-by-2 blocks in S and T will have a
  complex conjugate pair of generalized eigenvalues.
}
\value{
  Return a list contains next:
  \item{'S'}{A's generalized Schur form.}
  \item{'T'}{B's generalized Schur form.}
  \item{'ALPHAR'}{original returns from 'dgges.f'.}
  \item{'ALPHAI'}{original returns from 'dgges.f'.}
  \item{'BETA'}{original returns from 'dgges.f'.}
  \item{'VSL'}{original returns from 'dgges.f'.}
  \item{'VSR'}{original returns from 'dgges.f'.}
  \item{'WORK'}{optimal LWORK (for dgges.f only)}
  \item{'INFO'}{= 0: successful. < 0: if INFO = -i, the i-th argument had
                an illegal value. =1,...,N: QZ iteration failed.
                =N+1: other than QZ iteration failed in DHGEQZ.
                =N+2: reordering problem.
                =N+3: reordering failed.}

  Extra returns in the list:
  \item{'ALPHA'}{ALPHAR + ALPHAI * i.}
  \item{'Q'}{the left Schur vectors.}
  \item{'Z'}{the right Schur vectors.}

  The ALPHA[j]/BETA[j] are generalized eigenvalues.

  If ALPHAI[j] is zero, then the j-th eigenvalue is real; if
  positive, then the j-th and (j+1)-st eigenvalues are a
  complex conjugate pair, with ALPHAI[j+1] negative.
}
\references{
  Anderson, E., et al. (1999) \emph{LAPACK User's Guide,}
  3rd edition, SIAM, Philadelphia.

  \url{http://www.netlib.org/lapack/double/dgges.f}

  \url{http://en.wikipedia.org/wiki/Schur_decomposition}
}
\author{
  Wei-Chen Chen \email{wccsnow@gmail.com}
}
\seealso{
  \code{\link{qz.dggev}}
}
\examples{
\dontrun{
library(QZ, quiet = TRUE)

### http://www.nag.com/lapack-ex/node119.html 
A <- exAB2$A
B <- exAB2$B
ret <- qz.dgges(A, B)

# Verify 1
A.new <- ret$Q \%*\% ret$S \%*\% t(ret$Z)
B.new <- ret$Q \%*\% ret$T \%*\% t(ret$Z)
round(A - A.new)
round(B - B.new)

# verify 2
round(ret$Q \%*\% t(ret$Q))
round(ret$Z \%*\% t(ret$Z))
}
}
\keyword{utility}

