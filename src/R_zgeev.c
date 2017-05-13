/* This is a C wrapper for "zgeev.f" and called by "qz_zgeev.r". */

#include "R_qz_global.h"

SEXP R_zgeev(SEXP JOBVL, SEXP JOBVR, SEXP N,
		SEXP A, SEXP LDA,
		SEXP W, SEXP VL, SEXP LDVL, SEXP VR, SEXP LDVR,
		SEXP WORK, SEXP LWORK, SEXP RWORK,
		SEXP INFO){
	int n = INTEGER(N)[0], total_length;
	SEXP T;
	char CS_JOBVL = CHARPT(JOBVL, 0)[0], CS_JOBVR = CHARPT(JOBVR, 0)[0];
	int CF_wrap;

	/* Protect R objects. */
	PROTECT(T = allocMatrix(CPLXSXP, n, n));

	/* COpy A and B since zgges writes in place. */
	total_length = n * n;
	Memcpy(COMPLEX(T), COMPLEX(A), total_length);

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
	F77_CALL(wzgeev)(&CF_wrap,
		INTEGER(N), COMPLEX(T), INTEGER(LDA),
		COMPLEX(W), COMPLEX(VL), INTEGER(LDVL),
		COMPLEX(VR), INTEGER(LDVR), COMPLEX(WORK),
		INTEGER(LWORK),
		REAL(RWORK), INTEGER(INFO));

	/* Return. */
	UNPROTECT(1);
	return(R_NilValue);
} /* End of R_zgeev(). */

