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

	/* Protect R objects. */
	PROTECT(T = allocMatrix(CPLXSXP, n, n));

	/* COpy A and B since zgges writes in place. */
	total_length = n * n;
	Memcpy(COMPLEX(T), COMPLEX(A), total_length);

	/* Call Fortran. */
	if(CS_JOBVL == 'V' && CS_JOBVR == 'V'){
		F77_CALL(zgeev)("V", "V",
			INTEGER(N), COMPLEX(T), INTEGER(LDA),
			COMPLEX(W), COMPLEX(VL), INTEGER(LDVL),
			COMPLEX(VR), INTEGER(LDVR), COMPLEX(WORK),
			INTEGER(LWORK),
			REAL(RWORK), INTEGER(INFO));
	} else if(CS_JOBVL == 'N' && CS_JOBVR == 'V'){
		F77_CALL(zgeev)("N", "V",
			INTEGER(N), COMPLEX(T), INTEGER(LDA),
			COMPLEX(W), COMPLEX(VL), INTEGER(LDVL),
			COMPLEX(VR), INTEGER(LDVR), COMPLEX(WORK),
			INTEGER(LWORK),
			REAL(RWORK), INTEGER(INFO));
	} else if(CS_JOBVL == 'V' && CS_JOBVR == 'N'){
		F77_CALL(zgeev)("V", "N",
			INTEGER(N), COMPLEX(T), INTEGER(LDA),
			COMPLEX(W), COMPLEX(VL), INTEGER(LDVL),
			COMPLEX(VR), INTEGER(LDVR), COMPLEX(WORK),
			INTEGER(LWORK),
			REAL(RWORK), INTEGER(INFO));
	} else if(CS_JOBVL == 'N' && CS_JOBVR == 'N'){
		F77_CALL(zgeev)("N", "N",
			INTEGER(N), COMPLEX(T), INTEGER(LDA),
			COMPLEX(W), COMPLEX(VL), INTEGER(LDVL),
			COMPLEX(VR), INTEGER(LDVR), COMPLEX(WORK),
			INTEGER(LWORK),
			REAL(RWORK), INTEGER(INFO));
	} else{
		REprintf("Input (CHARACTER) types are not implemented.\n");
	}

	/* Return. */
	UNPROTECT(1);
	return(R_NilValue);
} /* End of R_zgeev(). */

