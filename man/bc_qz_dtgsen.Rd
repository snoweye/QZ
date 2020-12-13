\name{qz.dtgsen}
\alias{qz.dtgsen}
\title{Reordered QZ Decomposition for Real Paired Matrices}
\description{
  This function call 'dtgsend' in Fortran to reorder 'double'
  matrices (S,T,Q,Z).
}
\usage{
  qz.dtgsen(S, T, Q, Z, select, ijob = 4L,
            want.Q = TRUE, want.Z = TRUE, LWORK = NULL, LIWORK = NULL)
}
\arguments{
  \item{S}{a 'double' generalized Schur form, dim = c(N, N).}
  \item{T}{a 'double' generalized Schur form, dim = c(N, N).}
  \item{Q}{a 'double' left Schur vectors, dim = c(N, N).}
  \item{Z}{a 'double' right Schur vectors, dim = c(N, N).}
  \item{select}{specifies the eigenvalues in the selected cluster.}
  \item{ijob}{specifies whether condition numbers are required for the
              cluster of eigenvalues (PL and PR) or the deflating subspaces
              (Difu and Difl).}
  \item{want.Q}{if update Q.}
  \item{want.Z}{if update Z.}
  \item{LWORK}{optional, dimension of array WORK for workspace. (>= max(4N+16, N(N+1)))}
  \item{LIWORK}{optional, dimension of array IWORK for workspace. (>= max(N+6, N(N+1)/2))}
}
\details{
  See 'dtgsen.f' for all details.

  DTGSEN reorders the generalized real Schur decomposition of a real
  matrix pair (S,T) (in terms of an orthonormal equivalence transformation
  Q**T * (S,T) * Z), so that a selected cluster of eigenvalues
  appears in the leading diagonal blocks of the upper quasi-triangular
  matrix S and the upper triangular T. The leading columns of Q and
  Z form orthonormal bases of the corresponding left and right eigenspaces
  (deflating subspaces). (S,T) must be in generalized real
  Schur canonical form (as returned by DGGES), i.e. S is block upper
  triangular with 1-by-1 and 2-by-2 diagonal blocks. T is upper
  triangular.

  Note for 'ijob': \cr
  =0: Only reorder w.r.t. SELECT. No extras. \cr
  =1: Reciprocal of norms of "projections" onto left and right
      eigenspaces w.r.t. the selected cluster (PL and PR). \cr
  =2: Upper bounds on Difu and Difl. F-norm-based estimate (DIF(1:2)). \cr
  =3: Estimate of Difu and Difl. 1-norm-based estimate (DIF(1:2)).
      About 5 times as expensive as ijob = 2. \cr
  =4: Compute PL, PR and DIF (i.e. 0, 1 and 2 above): Economic
      version to get it all. \cr
  =5: Compute PL, PR and DIF (i.e. 0, 1 and 3 above). \cr

  In short, if (A,B) = Q * (S,T) * Z**T from \code{qz.zgges} and input
  (S,T,Q,Z) to \code{qz.ztgsen} with appropriate \code{select} option,
  then it yields

           (A,B) = Q_n * (S_n,T_n) * Z_n**T

  where (S_n,T_n,Q_n,Z_n) is a new set of generalized Schur decomposition
  of (A,B) according to the \code{select}.
}
\value{
  Return a list contains next:
  \item{'S'}{S's reorded generalized Schur form.}
  \item{'T'}{T's reorded generalized Schur form.}
  \item{'ALPHAR'}{original returns from 'dtgsen.f'.}
  \item{'ALPHAI'}{original returns from 'dtgsen.f'.}
  \item{'BETA'}{original returns from 'dtgsen.f'.}
  \item{'M'}{original returns from 'dtgsen.f'.}
  \item{'PL'}{original returns from 'dtgsen.f'.}
  \item{'PR'}{original returns from 'dtgsen.f'.}
  \item{'DIF'}{original returns from 'dtgsen.f'.}
  \item{'WORK'}{optimal LWORK (for dtgsen.f only)}
  \item{'IWORK'}{optimal LIWORK (for dtgsen.f only)}
  \item{'INFO'}{= 0: successful. < 0: if INFO = -i, the i-th argument had
                an illegal value. =1: reordering of (S,T) failed.}

  Extra returns in the list:
  \item{'ALPHA'}{ALPHAR + ALPHAI * i.}
  \item{'Q'}{the reorded left Schur vectors.}
  \item{'Z'}{the reorded right Schur vectors.}
}
\section{Warning(s)}{
  There is no format checking for \code{S}, \code{T}, \code{Q}, and \code{Z}
  which are usually returned by \code{qz.dgges}.

  There is also no checking for \code{select} which is usually according to
  the returns of \code{qz.dggev}.
}
\references{
  Anderson, E., et al. (1999) \emph{LAPACK User's Guide,}
  3rd edition, SIAM, Philadelphia.

  \url{https://www.netlib.org/lapack/double/dtgsen.f}

  \url{https://en.wikipedia.org/wiki/Schur_decomposition}
}
\author{
  Wei-Chen Chen \email{wccsnow@gmail.com}
}
\seealso{
  \code{\link{qz.zgges}}, \code{\link{qz.dgges}}, \code{\link{qz.ztgsen}}.
}
\examples{
% \dontrun{
library(QZ, quiet = TRUE)

### https://www.nag.com/numeric/fl/nagdoc_fl23/xhtml/f08/f08ygf.xml
S <- exAB4$S
T <- exAB4$T
Q <- exAB4$Q
Z <- exAB4$Z
select <- c(FALSE, TRUE, TRUE, FALSE)
ret <- qz.dtgsen(S, T, Q, Z, select)

# Verify 1
S.new <- ret$Q \%*\% ret$S \%*\% t(ret$Z)
T.new <- ret$Q \%*\% ret$T \%*\% t(ret$Z)
round(S - S.new)
round(T - T.new)

# verify 2
round(ret$Q \%*\% t(ret$Q))
round(ret$Z \%*\% t(ret$Z))
% }
}
\keyword{utility}

