\name{QZ-package}
\alias{QZ-package}
\docType{package}
\title{Generalized Eigenvalues and QZ Decomposition}
\description{
  QZ package provides generalized eigenvalues and QZ decomposition
  (generalized Schur form) for an N-by-N non-symmetric
  matrix A or paired matrices (A,B) with eigenvalues reordering
  mechanism. The package is mainly based complex*16 and double
  precision of LAPACK library (version 3.4.2.)
}
\details{
\tabular{ll}{
  Package: \tab QZ\cr
  Type: \tab Package\cr
%  Version: \tab 0.1-2\cr
%  Date: \tab 2010-02-18\cr
  License: \tab MPL\cr
  LazyLoad: \tab yes\cr
}

  The QZ package contains R functions for generalized eigenvalues and
  QZ decomposition (generalized Schur form) for an N-by-N non-symmetric
  matrix A or paired matrices (A,B) via two main functions, \code{qz.geigen()}
  and \code{qz()}. The \code{qz()} function also provides an option for
  eigenvalues reordering.

  The QZ package is also based on a minimum set of complex*16 and double
  precision of LAPACK and BLAS Fortran libraries.
  Most functions are wrapped in C via \code{.Call()} to avoid
  extra memory copy and to improve performance and memory usage.
}
\references{
  Anderson, E., et al. (1999) \emph{LAPACK User's Guide,}
  3rd edition, SIAM, Philadelphia.

  \url{http://en.wikipedia.org/wiki/Schur_decomposition}

  \url{http://www.netlib.org/lapack/}
}
\author{
  Wei-Chen Chen \email{wccsnow@gmail.com}
}
\seealso{
  \code{\link{qz.geigen}},
  \code{\link{qz}}, \cr
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
demo(ex1_geigen, "QZ")
demo(ex2_qz, "QZ")
demo(ex3_ordqz, "QZ")
demo(ex4_fda_geigen, "QZ")
}
}
\keyword{package}

