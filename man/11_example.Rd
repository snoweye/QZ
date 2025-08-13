\name{Example datasets}
\alias{exAB1}
\alias{exAB2}
\alias{exAB3}
\alias{exAB4}
\alias{exA1}
\alias{exA2}
\alias{exA3}
\alias{exA4}
\docType{data}
\title{Small example datasets}
\description{
  These datasets are small for test operations and functions in
  complex and double precision/matrices.
}
\format{
  Each dataset contains information where it is from and two
  matrices in pair of (A,B) or single matrix (A)
  for testing functions \code{qz.*}
  or related functions, either in complex or in double precision.
}
\details{
  The example datasets are
\tabular{ll}{
  Examples   \tab Source \cr
  \code{exAB1} \tab \url{https://www.netlib.org/lapack/lug/node124.html} \cr
  \code{exAB2} \tab \url{https://www.netlib.org/lapack/lug/node119.html} \cr
  \code{exAB3} \tab \url{https://support.nag.com/numeric/fl/nagdoc_fl23/xhtml/f08/f08yuf.xml} \cr
  \code{exAB4} \tab \url{https://support.nag.com/numeric/fl/nagdoc_fl23/xhtml/f08/f08ygf.xml} \cr
               \tab \cr
  \code{exA1}  \tab \url{https://www.netlib.org/lapack/lug/node94.html} \cr
  \code{exA2}  \tab \url{https://www.netlib.org/lapack/lug/node89.html} \cr
  \code{exA3}  \tab \url{https://support.nag.com/numeric/fl/nagdoc_fl23/xhtml/f08/f08quf.xml} \cr
  \code{exA4}  \tab \url{https://support.nag.com/numeric/fl/nagdoc_fl22/xhtml/f08/f08qgf.xml} \cr
}

  The elements of dataset are (if any)
\tabular{ll}{
  Elements           \tab Usage \cr
  \code{description} \tab the source of data \cr
  \code{A}           \tab the first matrix A \cr
  \code{B}           \tab the second matrix B \cr
  \code{S}           \tab the Shur form \cr
  \code{T}           \tab the Shur form \cr
  \code{Q}           \tab the left Shur vectors \cr
  \code{Z}           \tab the right Shur vectors \cr
}
}
\references{
  Anderson, E., et al. (1999) \emph{LAPACK User's Guide,}
  3rd edition, SIAM, Philadelphia.

  \url{https://en.wikipedia.org/wiki/Schur_decomposition}
}
\author{
  Wei-Chen Chen \email{wccsnow@gmail.com}
}
\keyword{data}
