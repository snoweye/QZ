\name{qz.ztrsen}
\alias{qz.ztrsen}
\title{Reordered QZ Decomposition for a Complex Matrix}
\description{
  This function call 'ztrsend' in Fortran to reorder 'complex'
  matrix (T,Q).
}
\usage{
  qz.ztrsen(T, Q, select, job = c("B", "V", "E", "N"),
            want.Q = TRUE, LWORK = NULL)
}
\arguments{
  \item{T}{a 'complex' generalized Schur form, dim = c(N, N).}
  \item{Q}{a 'complex' Schur vectors, dim = c(N, N).}
  \item{select}{specifies the eigenvalues in the selected cluster.}
  \item{job}{Specifies whether condition numbers are required for the
             cluster of eigenvalues (S) or the invariant subspace (SEP).}
  \item{want.Q}{if update Q.}
  \item{LWORK}{optional, dimension of array WORK for workspace. (>= N(N+1)/2)}
}
\details{
  See 'ztrsen.f' for all details.

  ZTRSEN reorders the Schur factorization of a complex matrix
  A = Q*T*Q**H, so that a selected cluster of eigenvalues appears in
  the leading positions on the diagonal of the upper triangular matrix
  T, and the leading columns of Q form an orthonormal basis of the
  corresponding right invariant subspace.

  Optionally the routine computes the reciprocal condition numbers of
  the cluster of eigenvalues and/or the invariant subspace.
}
\value{
  Return a list contains next:
  \item{'T'}{T's reorded generalized Schur form.}
  \item{'W'}{generalized eigenvalues.}
  \item{'M'}{original returns from 'ztrsen.f'.}
  \item{'S'}{original returns from 'ztrsen.f'.}
  \item{'SEP'}{original returns from 'ztrsen.f'.}
  \item{'WORK'}{optimal LWORK (for ztrsen.f only)}
  \item{'INFO'}{= 0: successful. < 0: if INFO = -i, the i-th argument had
                an illegal value.}

  Extra returns in the list:
  \item{'Q'}{the reorded Schur vectors.}
}
\section{Warning(s)}{
  There is no format checking for \code{T} and \code{Q}
  which are usually returned by \code{qz.zgees}.

  There is also no checking for \code{select} which is usually according to
  the returns of \code{qz.zgeev}.
}
\references{
  Anderson, E., et al. (1999) \emph{LAPACK User's Guide,}
  3rd edition, SIAM, Philadelphia.

  \url{https://www.netlib.org/lapack/complex16/ztrsen.f}

  \url{https://en.wikipedia.org/wiki/Schur_decomposition}
}
\author{
  Wei-Chen Chen \email{wccsnow@gmail.com}
}
\seealso{
  \code{\link{qz.zgees}}, \code{\link{qz.dgees}}, \code{\link{qz.dtrsen}}.
}
\examples{
% \dontrun{
library(QZ, quiet = TRUE)

### https://support.nag.com/numeric/fl/nagdoc_fl23/xhtml/f08/f08quf.xml
T <- exA3$T
Q <- exA3$Q
select <- c(TRUE, FALSE, FALSE, TRUE)
ret <- qz.ztrsen(T, Q, select)

# Verify 1
A <- Q \%*\% T \%*\% solve(Q)
A.new <- ret$Q \%*\% ret$T \%*\% solve(ret$Q)
round(A - A.new)

# verify 2
round(ret$Q \%*\% solve(ret$Q))
% }
}
\keyword{utility}

