/* This is a C wrapper for "dgges.f" and called by "qz_dgges.r". */

#include "R_qz_global.h"

static int fake_selctg(double *alphar, double *alpahi, double *beta){
	return 0;
} /* End of fake_selctg(). */

SEXP R_dgges(SEXP JOBVSL, SEXP JOBVSR, SEXP SORT, SEXP SELCTG, SEXP N,
		SEXP A, SEXP LDA, SEXP B, SEXP LDB, SEXP SDIM,
		SEXP ALPHAR, SEXP ALPHAI,
		SEXP BETA, SEXP VSL, SEXP LDVSL, SEXP VSR,
		SEXP LDVSR, SEXP WORK, SEXP LWORK, SEXP BWORK,
		SEXP INFO){
	int n = INTEGER(N)[0], total_length;
	SEXP RET, RET_NAMES, S, T;
	const char *C_JOBVSL = CHARPT(JOBVSL, 0), *C_JOBVSR = CHARPT(JOBVSR, 0),
		*C_SORT = CHARPT(SORT, 0);

	/* Protect R objects. */
	PROTECT(RET = allocVector(VECSXP, 2));
	PROTECT(RET_NAMES = allocVector(STRSXP, 2));
	PROTECT(S = allocMatrix(REALSXP, n, n));
	PROTECT(T = allocMatrix(REALSXP, n, n));

	SET_VECTOR_ELT(RET, 0, S);
	SET_VECTOR_ELT(RET, 1, T);
	SET_STRING_ELT(RET_NAMES, 0, mkChar("S")); 
	SET_STRING_ELT(RET_NAMES, 1, mkChar("T")); 
	setAttrib(RET, R_NamesSymbol, RET_NAMES);

	/* COpy A and B since dgges writes in place. */
	total_length = n * n;
	Memcpy(REAL(S), REAL(A), total_length);
	Memcpy(REAL(T), REAL(B), total_length);

	/* Call Fortran. */
	F77_CALL(dgges)(C_JOBVSL, C_JOBVSR, C_SORT,
		fake_selctg, INTEGER(N), REAL(S), INTEGER(LDA),
		REAL(T), INTEGER(LDB), INTEGER(SDIM),
		REAL(ALPHAR), REAL(ALPHAI), REAL(BETA), REAL(VSL),
		INTEGER(LDVSL), REAL(VSR), INTEGER(LDVSR), REAL(WORK),
		INTEGER(LWORK), INTEGER(BWORK), INTEGER(INFO));

	/* Return. */
	UNPROTECT(4);
	return(RET);
} /* End of R_dgges(). */

