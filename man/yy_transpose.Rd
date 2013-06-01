\name{Conjugate transpose}
\alias{H}
\title{Conjugate Transpose for Complex Matrix}
\description{
  Conjugate transpose, Hermitian transpose, or Hermitian conjugate.
}
\usage{
  H(x)
}
\arguments{
  \item{x}{a complex matrix or vector.}
}
\details{
  This is equivalent to \code{Conj(t.default(x))}.
}
\value{
  This returns a conjugate transpose of \code{x}.
}
\author{
  Wei-Chen Chen \email{wccsnow@gmail.com}
}
\examples{
\dontrun{
library(QZ, quiet = TRUE)

A <- matrix(c(-21.10 -22.50i, 53.50 -50.50i, -34.50 +127.50i,   7.50  +0.50i,
               -0.46  -7.78i, -3.50 -37.50i, -15.50  +58.50i, -10.50  -1.50i,
                4.30  -5.50i, 39.70 -17.10i, -68.50  +12.50i,  -7.50  -3.50i,
                5.50  +4.40i, 14.40 +43.30i, -32.50  -46.00i, -19.00 -32.50i),
            nrow = 4, byrow = T)
H(A)
}
}
\keyword{programming}
