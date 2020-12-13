\name{Print methods}
\alias{print.zgges}
\alias{print.zggev}
\alias{print.ztgsen}
\alias{print.dgges}
\alias{print.dggev}
\alias{print.dtgsen}
\alias{print.zgees}
\alias{print.zgeev}
\alias{print.ztrsen}
\alias{print.dgees}
\alias{print.dgeev}
\alias{print.dtrsen}
\title{Functions for Printing Objects According to Classes}
\description{
  Several classes are declared in \pkg{QZ}, and these are functions
  to print objects.
}
\usage{
\method{print}{zgges}(x, digits = max(4, getOption("digits") - 3), ...)
\method{print}{zggev}(x, digits = max(4, getOption("digits") - 3), ...)
\method{print}{ztgsen}(x, digits = max(4, getOption("digits") - 3), ...)
\method{print}{dgges}(x, digits = max(4, getOption("digits") - 3), ...)
\method{print}{dggev}(x, digits = max(4, getOption("digits") - 3), ...)
\method{print}{dtgsen}(x, digits = max(4, getOption("digits") - 3), ...)

\method{print}{zgees}(x, digits = max(4, getOption("digits") - 3), ...)
\method{print}{zgeev}(x, digits = max(4, getOption("digits") - 3), ...)
\method{print}{ztrsen}(x, digits = max(4, getOption("digits") - 3), ...)
\method{print}{dgees}(x, digits = max(4, getOption("digits") - 3), ...)
\method{print}{dgeev}(x, digits = max(4, getOption("digits") - 3), ...)
\method{print}{dtrsen}(x, digits = max(4, getOption("digits") - 3), ...)
}
\arguments{
  \item{x}{an object with the class attributes.}
  \item{digits}{for printing out numbers.}
  \item{\dots}{other possible options.}
}
\details{
  These are useful functions for summarizing and debugging.
  Use \code{names} or \code{str} to explore the details.
}
\value{
  The results will cat or print on the STDOUT by default.
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
  \code{\link{qz.zgges}},
  \code{\link{qz.zggev}},
  \code{\link{qz.ztgsen}},
  \code{\link{qz.dgges}},
  \code{\link{qz.dggev}},
  \code{\link{qz.dtgsen}}, \cr
  \code{\link{qz.zgees}},
  \code{\link{qz.zgeev}},
  \code{\link{qz.ztrsen}},
  \code{\link{qz.dgees}},
  \code{\link{qz.dgeev}},
  \code{\link{qz.dtrsen}}.
}
\examples{
\dontrun{
# Functions applied by directly type the names of objects.
}
}
\keyword{programming}
