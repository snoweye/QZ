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
	char CS_JOBVL = CHARPT(JOBVL, 0)[0], CS_JOBVR = CHARPT(JOBVR, 0)[0];
	int CF_wrap;

	/* Protect R objects. */
	PROTECT(S = allocMatrix(REALSXP, n, n));
	PROTECT(T = allocMatrix(REALSXP, n, n));

	/* COpy A and B since dggev writes in place. */
	total_length = n * n;
	Memcpy(REAL(S), REAL(A), total_length);
	Memcpy(REAL(T), REAL(B), total_length);

	/* Call Fortran. */
	if(CS_JOBVL == 'V' && CS_JOBVR == 'V'){
		CF_wrap = 0;
	} else if(CS_JOBVL == 'N' && CS_JOBVR == 'V'){
		CF_wrap = 1;
	} else if(CS_JOBVL == 'V' && CS_JOBVR == 'N'){
		CF_wrap = 2;
	} else if(CS_JOBVL == 'N' && CS_JOBVR == 'N'){
		CF_wrap = 3;
	} else{
		REprintf("Input (CHARACTER) types are not implemented.\n");
	}
	F77_CALL(wdggev)(&CF_wrap,
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

