/* This is a C wrapper for "zggev.f" and called by "qz_zggev.r". */

#include "R_qz_global.h"

SEXP R_zggev(SEXP JOBVL, SEXP JOBVR, SEXP N,
		SEXP A, SEXP LDA, SEXP B, SEXP LDB,
		SEXP ALPHA, SEXP BETA, SEXP VL, SEXP LDVL, SEXP VR,
		SEXP LDVR, SEXP WORK, SEXP LWORK, SEXP RWORK,
		SEXP INFO){
	int n = INTEGER(N)[0], total_length;
	SEXP S, T;
	char CS_JOBVL = CHARPT(JOBVL, 0)[0], CS_JOBVR = CHARPT(JOBVR, 0)[0];
	int CF_iwrap;

	/* Protect R objects. */
	PROTECT(S = allocMatrix(CPLXSXP, n, n));
	PROTECT(T = allocMatrix(CPLXSXP, n, n));

	/* COpy A and B since zgges writes in place. */
	total_length = n * n;
	Memcpy(COMPLEX(S), COMPLEX(A), total_length);
	Memcpy(COMPLEX(T), COMPLEX(B), total_length);

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
	F77_CALL(wzggev)(&CF_iwrap,
		INTEGER(N), COMPLEX(S), INTEGER(LDA),
		COMPLEX(T), INTEGER(LDB),
		COMPLEX(ALPHA), COMPLEX(BETA), COMPLEX(VL),
		INTEGER(LDVL),
		COMPLEX(VR), INTEGER(LDVR), COMPLEX(WORK),
		INTEGER(LWORK),
		REAL(RWORK), INTEGER(INFO));

	/* Return. */
	UNPROTECT(2);
	return(R_NilValue);
} /* End of R_zggev(). */

