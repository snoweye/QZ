/* This is a C wrapper for "zgees.f" and called by "qz_zgees.r". */

#include "R_qz_global.h"

static int fake_select(Rcomplex *w){
	return 0;
} /* End of fake_select(). */

SEXP R_zgees(SEXP JOBVS, SEXP SORT, SEXP SELECT, SEXP N,
		SEXP A, SEXP LDA, SEXP SDIM,
		SEXP W, SEXP VS, SEXP LDVS,
		SEXP WORK, SEXP LWORK, SEXP RWORK, SEXP BWORK,
		SEXP INFO){
	int n = INTEGER(N)[0], total_length;
	SEXP RET, RET_NAMES, T;

	/* Protect R objects. */
	PROTECT(RET = allocVector(VECSXP, 1));
	PROTECT(RET_NAMES = allocVector(STRSXP, 1));
	PROTECT(T = allocMatrix(CPLXSXP, n, n));

	SET_VECTOR_ELT(RET, 0, T);
	SET_STRING_ELT(RET_NAMES, 0, mkChar("T")); 
	setAttrib(RET, R_NamesSymbol, RET_NAMES);

	/* COpy A since zgees writes in place. */
	total_length = n * n;
	Memcpy(COMPLEX(T), COMPLEX(A), total_length);

	/* Call Fortran. */
	F77_CALL(zgees)(CHARPT(JOBVS, 0), CHARPT(SORT, 0),
		fake_select, INTEGER(N), COMPLEX(T), INTEGER(LDA),
		INTEGER(SDIM), COMPLEX(W), COMPLEX(VS), INTEGER(LDVS),
		COMPLEX(WORK), INTEGER(LWORK),
		REAL(RWORK), INTEGER(BWORK), INTEGER(INFO));

	/* Return. */
	UNPROTECT(3);
	return(RET);
} /* End of R_zgees(). */

