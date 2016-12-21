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

	/* Protect R objects. */
	PROTECT(S = allocMatrix(REALSXP, n, n));
	PROTECT(T = allocMatrix(REALSXP, n, n));

	/* COpy A and B since dggev writes in place. */
	total_length = n * n;
	Memcpy(REAL(S), REAL(A), total_length);
	Memcpy(REAL(T), REAL(B), total_length);

	/* Call Fortran. */
	if(CS_JOBVL == 'V' && CS_JOBVR == 'V'){
		F77_CALL(dggev)("V", "V",
			INTEGER(N), REAL(S), INTEGER(LDA),
			REAL(T), INTEGER(LDB),
			REAL(ALPHAR), REAL(ALPHAI), REAL(BETA),
			REAL(VL), INTEGER(LDVL), REAL(VR), INTEGER(LDVR),
			REAL(WORK), INTEGER(LWORK),
			INTEGER(INFO));
	} else if(CS_JOBVL == 'N' && CS_JOBVR == 'V'){
		F77_CALL(dggev)("N", "V",
			INTEGER(N), REAL(S), INTEGER(LDA),
			REAL(T), INTEGER(LDB),
			REAL(ALPHAR), REAL(ALPHAI), REAL(BETA),
			REAL(VL), INTEGER(LDVL), REAL(VR), INTEGER(LDVR),
			REAL(WORK), INTEGER(LWORK),
			INTEGER(INFO));
	} else if(CS_JOBVL == 'V' && CS_JOBVR == 'N'){
		F77_CALL(dggev)("V", "N",
			INTEGER(N), REAL(S), INTEGER(LDA),
			REAL(T), INTEGER(LDB),
			REAL(ALPHAR), REAL(ALPHAI), REAL(BETA),
			REAL(VL), INTEGER(LDVL), REAL(VR), INTEGER(LDVR),
			REAL(WORK), INTEGER(LWORK),
			INTEGER(INFO));
	} else if(CS_JOBVL == 'N' && CS_JOBVR == 'N'){
		F77_CALL(dggev)("N", "N",
			INTEGER(N), REAL(S), INTEGER(LDA),
			REAL(T), INTEGER(LDB),
			REAL(ALPHAR), REAL(ALPHAI), REAL(BETA),
			REAL(VL), INTEGER(LDVL), REAL(VR), INTEGER(LDVR),
			REAL(WORK), INTEGER(LWORK),
			INTEGER(INFO));
	} else{
		REprintf("Input (CHARACTER) types are not implemented.\n");
	}

	/* Return. */
	UNPROTECT(2);
	return(R_NilValue);
} /* End of R_dggev(). */

