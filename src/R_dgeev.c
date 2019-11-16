/* This is a C wrapper for "dgeev.f" and called by "qz_dgeev.r". */

#include "R_qz_global.h"

SEXP R_dgeev(SEXP JOBVL, SEXP JOBVR, SEXP N,
		SEXP A, SEXP LDA, SEXP WR, SEXP WI,
		SEXP VL, SEXP LDVL, SEXP VR, SEXP LDVR, SEXP WORK, SEXP LWORK,
		SEXP INFO){
	int n = INTEGER(N)[0], total_length;
	SEXP T;
	char CS_JOBVL = CHARPT(JOBVL, 0)[0], CS_JOBVR = CHARPT(JOBVR, 0)[0];
	int CF_iwrap;

	/* Protect R objects. */
	PROTECT(T = allocMatrix(REALSXP, n, n));

	/* COpy A and B since dgeev writes in place. */
	total_length = n * n;
	Memcpy(REAL(T), REAL(A), total_length);

	/* Call Fortran. */
	if(CS_JOBVL == 'V' && CS_JOBVR == 'V'){
		CF_iwrap = 0;
	} else if(CS_JOBVL == 'N' && CS_JOBVR == 'V'){
		CF_iwrap = 1;
	} else if(CS_JOBVL == 'V' && CS_JOBVR == 'N'){
		CF_iwrap = 2;
	} else if(CS_JOBVL == 'N' && CS_JOBVR == 'N'){
		CF_iwrap = 3;
	} else{
		REprintf("Input (CHARACTER) types are not implemented.\n");
	}
	F77_CALL(wdgeev)(&CF_iwrap,
		INTEGER(N), REAL(T), INTEGER(LDA),
		REAL(WR), REAL(WI),
		REAL(VL), INTEGER(LDVL), REAL(VR), INTEGER(LDVR),
		REAL(WORK), INTEGER(LWORK),
		INTEGER(INFO));

	/* Return. */
	UNPROTECT(1);
	return(R_NilValue);
} /* End of R_dgeev(). */

