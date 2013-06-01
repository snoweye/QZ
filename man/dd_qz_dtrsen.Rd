\name{qz.dtrsen}
\alias{qz.dtrsen}
\title{Reordered QZ Decomposition for a Real Matrix}
\description{
  This function call 'dtrsend' in Fortran to reorder 'double'
  matrices (T,Q).
}
\usage{
  qz.dtrsen(T, Q, select, job = c("B", "V", "E", "N"),
            want.Q = TRUE, LWORK = NULL, LIWORK = NULL)
}
\arguments{
  \item{T}{a 'double' generalized Schur form, dim = c(N, N).}
  \item{Q}{a 'double' Schur vectors, dim = c(N, N).}
  \item{select}{specifies the eigenvalues in the selected cluster.}
  \item{job}{Specifies whether condition numbers are required for the
          cluster of eigenvalues (S) or the invariant subspace (SEP).}
  \item{want.Q}{if update Q.}
  \item{LWORK}{optional, dimension of array WORK for workspace. (>= N(N+1)/2)}
  \item{LIWORK}{optional, dimension of array IWORK for workspace. (>= N(N+1)/4)}
}
\details{
  See 'dtrsen.f' for all details.

  DTRSEN reorders the real Schur factorization of a real matrix
  A = Q*T*Q**T, so that a selected cluster of eigenvalues appears in
  the leading diagonal blocks of the upper quasi-triangular matrix T,
  and the leading columns of Q form an orthonormal basis of the
  corresponding right invariant subspace.

  Optionally the routine computes the reciprocal condition numbers of
  the cluster of eigenvalues and/or the invariant subspace.

  T must be in Schur canonical form (as returned by DHSEQR), that is,
  block upper triangular with 1-by-1 and 2-by-2 diagonal blocks; each
  2-by-2 diagonal block has its diagonal elements equal and its
  off-diagonal elements of opposite sign.
}
\value{
  Return a list contains next:
  \item{'T'}{T's reorded generalized Schur form.}
  \item{'WR'}{original returns from 'dtrsen.f'.}
  \item{'WI'}{original returns from 'dtrsen.f'.}
  \item{'M'}{original returns from 'dtrsen.f'.}
  \item{'S'}{original returns from 'dtrsen.f'.}
  \item{'SEP'}{original returns from 'dtrsen.f'.}
  \item{'WORK'}{optimal LWORK (for dtrsen.f only)}
  \item{'IWORK'}{optimal LIWORK (for dtrsen.f only)}
  \item{'INFO'}{= 0: successful. < 0: if INFO = -i, the i-th argument had
                an illegal value. =1: reordering of T failed.}

  Extra returns in the list:
  \item{'W'}{WR + WI * i.}
  \item{'Q'}{the reorded Schur vectors.}
}
\section{Warning(s)}{
  There is no format checking for \code{T} and \code{Q}
  which are usually returned by \code{qz.dgees}.

  There is also no checking for \code{select} which is usually according to
  the returns of \code{qz.dgeev}.
}
\references{
  Anderson, E., et al. (1999) \emph{LAPACK User's Guide,}
  3rd edition, SIAM, Philadelphia.

  \url{http://www.netlib.org/lapack/double/dtrsen.f}

  \url{http://en.wikipedia.org/wiki/Schur_decomposition}
}
\author{
  Wei-Chen Chen \email{wccsnow@gmail.com}
}
\seealso{
  \code{\link{qz.zgees}}, \code{\link{qz.dgees}}, \code{\link{qz.ztrsen}}.
}
\examples{
\dontrun{
library(QZ, quiet = TRUE)

### http://www.nag.com/numeric/fl/nagdoc_fl22/xhtml/F08/f08qgf.xml
T <- exA4$T
Q <- exA4$Q
select <- c(TRUE, FALSE, FALSE, TRUE)
ret <- qz.dtrsen(T, Q, select)

# Verify 1
A <- Q \%*\% T \%*\% solve(Q)
A.new <- ret$Q \%*\% ret$T \%*\% solve(ret$Q)
round(A - A.new)

# verify 2
round(ret$Q \%*\% t(ret$Q))
}
}
\keyword{utility}

