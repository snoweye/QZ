\name{Generalized Eigenvalues}
\alias{geigen}
\alias{qz.geigen}
\title{ Generalized Eigen Values }
\description{
  This function obtains generalized eigen values on input paired
  matrices (A,B) or a single matrix A.
}
\usage{
  geigen(A, B = NULL, only.values = FALSE, ...)

  qz.geigen(A, B = NULL, only.values = FALSE, ...)
}
\arguments{
  \item{A}{a 'complex/real' matrix, dim = c(N, N).}
  \item{B}{a 'complex/real' matrix, dim = c(N, N).}
  \item{only.values}{if 'TRUE', only the eigenvalues are computed and returned,
                     otherwise both eigenvalues and eigenvectors are returned.}
  \item{...}{options to \code{qz.*} functions.}
}
\details{
  Call one of \code{\link{qz.zggev}}, \code{\link{qz.dggev}},
  \code{\link{qz.zgeev}}, or \code{\link{qz.dgeev}} depending on the
  input arguments and types.
}
\value{
  Returns a list from the call.
}
\references{
  Anderson, E., et al. (1999) \emph{LAPACK User's Guide,}
  3rd edition, SIAM, Philadelphia.

  \url{https://en.wikipedia.org/wiki/Schur_decomposition}
}
\author{
  Wei-Chen Chen \email{wccsnow@gmail.com}
}
\seealso{
  \code{\link{qz}}, \code{\link{ordqz}}.
}
\examples{
% \dontrun{
library(QZ, quiet = TRUE)

### https://www.netlib.org/lapack/lug/node122.html
(ret <- qz.geigen(exAB1$A, exAB1$B))

### https://www.netlib.org/lapack/lug/node117.html
(ret <- qz.geigen(exAB2$A, exAB2$B))

### https://www.netlib.org/lapack/lug/node92.html
(ret <- qz.geigen(exA1$A))

### https://www.netlib.org/lapack/lug/node87.html
(ret <- qz.geigen(exA2$A))
% }
}
\keyword{programming}

