/* This is a C wrapper for "dggev.f" and called by "qz_dggev.r". */

#include "R_qz_global.h"

SEXP R_dggev(SEXP JOBVL, SEXP JOBVR, SEXP N,
		SEXP A, SEXP LDA, SEXP B, SEXP LDB,
		SEXP ALPHAR, SEXP ALPHAI,
		SEXP BETA, SEXP VL, SEXP LDVL, SEXP VR,
		SEXP LDVR, SEXP WORK, SEXP LWORK,
		SEXP INFO){
	int n = INTEGER(N)[0], total_length;
	SEXP S, T;

	/* Protect R objects. */
	PROTECT(S = allocMatrix(REALSXP, n, n));
	PROTECT(T = allocMatrix(REALSXP, n, n));

	/* COpy A and B since dggev writes in place. */
	total_length = n * n;
	Memcpy(REAL(S), REAL(A), total_length);
	Memcpy(REAL(T), REAL(B), total_length);

	/* Call Fortran. */
	F77_CALL(dggev)(CHARPT(JOBVL, 0), CHARPT(JOBVR, 0),
		INTEGER(N), REAL(S), INTEGER(LDA),
		REAL(T), INTEGER(LDB),
		REAL(ALPHAR), REAL(ALPHAI), REAL(BETA),
		REAL(VL), INTEGER(LDVL), REAL(VR), INTEGER(LDVR),
		REAL(WORK), INTEGER(LWORK),
		INTEGER(INFO));

	/* Return. */
	UNPROTECT(2);
	return(R_NilValue);
} /* End of R_dggev(). */

