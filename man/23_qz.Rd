\name{QZ Decomposition}
\alias{qz}
\title{ QZ Decomposition }
\description{
  This function performs QZ decomposition on input paired matrices (A,B)
  or a single matrix A.
}
\usage{
  qz(A, B = NULL, select = NULL, only.values = FALSE, ...)
}
\arguments{
  \item{A}{a 'complex/real' matrix, dim = c(N, N).}
  \item{B}{a 'complex/real' matrix, dim = c(N, N).}
  \item{select}{specifies the eigenvalues in the selected cluster.}
  \item{only.values}{if 'TRUE', only the eigenvalues are computed and returned,
                     otherwise both eigenvalues and eigenvectors are returned.}
  \item{...}{options to \code{qz.*} functions.}
}
\details{
  If \code{select} is \code{NULL}, then
  call one of \code{\link{qz.zgges}}, \code{\link{qz.dgges}},
  \code{\link{qz.zgees}}, or \code{\link{qz.dgees}} depending on the
  input arguments and types.

  If \code{select} is not \code{NULL}, then
  call one of \code{\link{qz.zgges} + \link{qz.ztgsen}},
  \code{\link{qz.dgges} + \link{qz.dtgsen}}, \cr
  \code{\link{qz.zgees} + \link{qz.ztrsen}}, or
  \code{\link{qz.dgees} + \link{qz.dtrsen}} depending on the
  input arguments and types.
}
\value{
  Returns a list from the call.
}
\references{
  Anderson, E., et al. (1999) \emph{LAPACK User's Guide,}
  3rd edition, SIAM, Philadelphia.

  \url{http://en.wikipedia.org/wiki/Schur_decomposition}
}
\author{
  Wei-Chen Chen \email{wccsnow@gmail.com}
}
\seealso{
  \code{\link{ordqz}}, \code{\link{geigen}}.
}
\examples{
% \dontrun{
library(QZ, quiet = TRUE)

### http://www.nag.com/lapack-ex/node124.html
(ret <- qz(exAB1$A, exAB1$B))

### http://www.nag.com/lapack-ex/node119.html
(ret <- qz(exAB2$A, exAB2$B))

### http://www.nag.com/lapack-ex/node94.html
(ret <- qz(exA1$A))

### http://www.nag.com/lapack-ex/node89.html
(ret <- qz(exA2$A))

# Reordering eigenvalues
select1 <- c(TRUE, FALSE, FALSE, TRUE)
select2 <- c(FALSE, TRUE, TRUE, FALSE)
(ret <- qz(exAB1$A, exAB1$B, select = select1))
(ret <- qz(exAB2$A, exAB2$B, select = select2))
(ret <- qz(exA1$A, select = select1))
(ret <- qz(exA2$A, select = select1))
% }
}
\keyword{programming}

