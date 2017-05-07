\name{qz.zgees}
\alias{qz.zgees}
\title{QZ Decomposition for a Complex Matrix}
\description{
  This function call 'zgees' in Fortran to decompose a 'complex' matrix A.
}
\usage{
  qz.zgees(A, vs = TRUE, LWORK = NULL)
}
\arguments{
  \item{A}{a 'complex' matrix, dim = c(N, N).}
  \item{vs}{if compute 'complex' Schur vectors. (Q)}
  \item{LWORK}{optional, dimension of array WORK for workspace. (>= 2N)}
}
\details{
  See 'zgees.f' for all details.

  ZGEES computes for an N-by-N complex non-symmetric matrix A, the
  eigenvalues, the Schur form T, and, optionally, the matrix of Schur
  vectors Q.  This gives the Schur factorization A = Q*T*(Q**H).

  Optionally, it also orders the eigenvalues on the diagonal of the
  Schur form so that selected eigenvalues are at the top left.
  The leading columns of Q then form an orthonormal basis for the
  invariant subspace corresponding to the selected eigenvalues.

  A complex matrix is in Schur form if it is upper triangular.
}
\value{
  Return a list contains next:
  \item{'T'}{A's generalized Schur form.}
  \item{'W'}{generalized eigenvalues.}
  \item{'VS'}{original returns from 'zgees.f'.}
  \item{'WORK'}{optimal LWORK (for zgees.f only)}
  \item{'INFO'}{= 0: successful. < 0: if INFO = -i, the i-th argument had
                an illegal value.
                =1,...,N: QZ iteration failed.
                =N+1: reordering problem.
                =N+2: reordering failed.}

  Extra returns in the list:
  \item{'Q'}{the Schur vectors.}
}
\section{Warning(s)}{
  The results may not be consistent on 32 bits and 64 bits Windows systems,
  but may be valid on both systems.
}
\references{
  Anderson, E., et al. (1999) \emph{LAPACK User's Guide,}
  3rd edition, SIAM, Philadelphia.

  \url{http://www.netlib.org/lapack/complex16/zgees.f}

  \url{http://en.wikipedia.org/wiki/Schur_decomposition}
}
\author{
  Wei-Chen Chen \email{wccsnow@gmail.com}
}
\seealso{
  \code{\link{qz.zgeev}}
}
\examples{
% \dontrun{
library(QZ, quiet = TRUE)

### http://www.nag.com/lapack-ex/node94.html
A <- exA1$A
ret <- qz.zgees(A)

# Verify 1
A.new <- ret$Q \%*\% ret$T \%*\% H(ret$Q)
round(A - A.new)

# verify 2
round(ret$Q \%*\% H(ret$Q))
% }
}
\keyword{utility}

