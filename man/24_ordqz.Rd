\name{QZ Decomposition Reordering}
\alias{ordqz}
\title{ Reordering QZ Decomposition }
\description{
  This function performs QZ decomposition on input paired matrices (A,B)
  or a single matrix A with reordering.
}
\usage{
  ordqz(A, B = NULL, cluster = NULL,
        keyword = c("lhp", "rhp", "udi", "udo", "ref", "cef",
                    "lhp.fo", "rhp.fo", "udi.fo", "udo.fo"),
        ...)
}
\arguments{
  \item{A}{a 'complex/real' matrix, dim = c(N, N).}
  \item{B}{a 'complex/real' matrix, dim = c(N, N).}
  \item{cluster}{specifies the eigenvalues in the selected cluster.}
  \item{keyword}{as similarly used in MATLAB.}
  \item{...}{options to \code{qz.*} functions.}
}
\details{
  Either \code{cluster} or \code{keyword} should be specified.

  \code{cluster} actually is the same as \code{select} in all \code{qz.*}
  functions.

  \code{keywork} actually is similar as MATLAB.
\tabular{ll}{
  keyword \tab Selected Region \cr
  'lhp'   \tab Left-half plane (real(E) < 0) \cr
  'rhp'   \tab Right-half plane (real(E) >= 0) \cr
  'udi'   \tab Interior of unit disk (abs(E) < 1) \cr
  'udo'   \tab Exterior of unit disk (abs(E) >= 1) \cr
  'ref'   \tab Real eigenvalues first (top-left conner) \cr
  'cef'   \tab Complex eigenvalues first (top-left conner) \cr
  'lhp'   \tab Left-half plane (real(E) < 0) and finite only \cr
  'rhp'   \tab Right-half plane (real(E) >= 0) and finite only \cr
  'udi'   \tab Interior of unit disk (abs(E) < 1) and finite only \cr
  'udo'   \tab Exterior of unit disk (abs(E) >= 1) and finite only \cr
}
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
  \code{\link{qz}}, \code{\link{geigen}}.
}
\examples{
% \dontrun{
library(QZ, quiet = TRUE)

# Reordering eigenvalues
(ret <- ordqz(exAB1$A, exAB1$B, keyword = "lhp"))
(ret <- ordqz(exAB1$A, exAB1$B, keyword = "rhp"))
(ret <- ordqz(exAB1$A, exAB1$B, keyword = "udi"))
(ret <- ordqz(exAB1$A, exAB1$B, keyword = "udo"))
(ret <- ordqz(exAB1$A, exAB1$B, keyword = "ref"))
(ret <- ordqz(exAB1$A, exAB1$B, keyword = "cef"))
(ret <- ordqz(exAB1$A, exAB1$B, keyword = "lhp.fo"))
(ret <- ordqz(exAB1$A, exAB1$B, keyword = "rhp.fo"))
(ret <- ordqz(exAB1$A, exAB1$B, keyword = "udi.fo"))
(ret <- ordqz(exAB1$A, exAB1$B, keyword = "udo.fo"))

% }
}
\keyword{programming}

