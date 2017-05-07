\name{qz.ztgsen}
\alias{qz.ztgsen}
\title{Reordered QZ Decomposition for Complex Paired Matrices}
\description{
  This function call 'ztgsend' in Fortran to reorder 'complex'
  matrices (S,T,Q,Z).
}
\usage{
  qz.ztgsen(S, T, Q, Z, select, ijob = 4L,
            want.Q = TRUE, want.Z = TRUE, LWORK = NULL, LIWORK = NULL)
}
\arguments{
  \item{S}{a 'complex' generalized Schur form, dim = c(N, N).}
  \item{T}{a 'complex' generalized Schur form, dim = c(N, N).}
  \item{Q}{a 'complex' left Schur vectors, dim = c(N, N).}
  \item{Z}{a 'complex' right Schur vectors, dim = c(N, N).}
  \item{select}{specifies the eigenvalues in the selected cluster.}
  \item{ijob}{specifies whether condition numbers are required for the
              cluster of eigenvalues (PL and PR) or the deflating subspaces
              (Difu and Difl).}
  \item{want.Q}{if update Q.}
  \item{want.Z}{if update Z.}
  \item{LWORK}{optional, dimension of array WORK for workspace. (>= N(N+1))}
  \item{LIWORK}{optional, dimension of array IWORK for workspace. (>= max(N+2, N(N+1)/2))}
}
\details{
  See 'ztgsen.f' for all details.

  ZTGSEN reorders the generalized Schur decomposition of a complex
  matrix pair (S,T) (in terms of an unitary equivalence transformation
  Q**H * (S,T) * Z), so that a selected cluster of eigenvalues
  appears in the leading diagonal blocks of the pair (S,T). The leading
  columns of Q and Z form unitary bases of the corresponding left and
  right eigenspaces (deflating subspaces). (S,T) must be in
  generalized Schur canonical form, that is, S and T are both upper
  triangular.

  ZTGSEN also computes the generalized eigenvalues

           w(j)= ALPHA(j) / BETA(j)

  of the reordered matrix pair (S,T).

  Note for 'ijob': \cr
  =0: Only reorder w.r.t. SELECT. No extras. \cr
  =1: Reciprocal of norms of "projections" onto left and right
      eigenspaces w.r.t. the selected cluster (PL and PR). \cr
  =2: Upper bounds on Difu and Difl. F-norm-based estimate (DIF(1:2)). \cr
  =3: Estimate of Difu and Difl. 1-norm-based estimate
      (DIF(1:2)). About 5 times as expensive as ijob = 2. \cr
  =4: Compute PL, PR and DIF (i.e. 0, 1 and 2 above): Economic
      version to get it all. \cr
  =5: Compute PL, PR and DIF (i.e. 0, 1 and 3 above). \cr

  In short, if (A,B) = Q * (S,T) * Z**H from \code{qz.zgges} and input
  (S,T,Q,Z) to \code{qz.ztgsen} with appropriate \code{select} option,
  then it yields

           (A,B) = Q_n * (S_n,T_n) * Z_n**H

  where (S_n,T_n,Q_n,Z_n) is a new set of generalized Schur decomposition
  of (A,B) according to the \code{select}.
}
\value{
  Return a list contains next:
  \item{'S'}{S's reorded generalized Schur form.}
  \item{'T'}{T's reorded generalized Schur form.}
  \item{'ALPHA'}{ALPHA[j]/BETA[j] are generalized eigenvalues.}
  \item{'BETA'}{ALPHA[j]/BETA[j] are generalized eigenvalues.}
  \item{'M'}{original returns from 'ztgsen.f'.}
  \item{'PL'}{original returns from 'ztgsen.f'.}
  \item{'PR'}{original returns from 'ztgsen.f'.}
  \item{'DIF'}{original returns from 'ztgsen.f'.}
  \item{'WORK'}{optimal LWORK (for ztgsen.f only)}
  \item{'IWORK'}{optimal LIWORK (for ztgsen.f only)}
  \item{'INFO'}{= 0: successful. < 0: if INFO = -i, the i-th argument had
                an illegal value. =1: reordering of (S,T) failed.}

  Extra returns in the list:
  \item{'Q'}{the reorded left Schur vectors.}
  \item{'Z'}{the reorded right Schur vectors.}
}
\section{Warning(s)}{
  There is no format checking for \code{S}, \code{T}, \code{Q}, and \code{Z}
  which are usually returned by \code{qz.zgges}.

  There is also no checking for \code{select} which is usually according to
  the returns of \code{qz.zggev}.
}
\references{
  Anderson, E., et al. (1999) \emph{LAPACK User's Guide,}
  3rd edition, SIAM, Philadelphia.

  \url{http://www.netlib.org/lapack/complex16/ztgsen.f}

  \url{http://en.wikipedia.org/wiki/Schur_decomposition}
}
\author{
  Wei-Chen Chen \email{wccsnow@gmail.com}
}
\seealso{
  \code{\link{qz.zgges}}, \code{\link{qz.dgges}}, \code{\link{qz.dtgsen}}.
}
\examples{
% \dontrun{
library(QZ, quiet = TRUE)

### http://www.nag.com/numeric/fl/nagdoc_fl23/xhtml/F08/f08yuf.xml
S <- exAB3$S
T <- exAB3$T
Q <- exAB3$Q
Z <- exAB3$Z
select <- c(FALSE, TRUE, TRUE, FALSE)
ret <- qz.ztgsen(S, T, Q, Z, select)

# Verify 1
S.new <- ret$Q \%*\% ret$S \%*\% H(ret$Z)
T.new <- ret$Q \%*\% ret$T \%*\% H(ret$Z)
round(S - S.new)
round(T - T.new)

# verify 2
round(ret$Q \%*\% H(ret$Q))
round(ret$Z \%*\% H(ret$Z))
% }
}
\keyword{utility}

