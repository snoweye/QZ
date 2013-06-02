/* This is a C wrapper for "zgeev.f" and called by "qz_zgeev.r". */

#include "R_qz_global.h"

SEXP R_zgeev(SEXP JOBVL, SEXP JOBVR, SEXP N,
		SEXP A, SEXP LDA,
		SEXP W, SEXP VL, SEXP LDVL, SEXP VR, SEXP LDVR,
		SEXP WORK, SEXP LWORK, SEXP RWORK,
		SEXP INFO){
	int n = INTEGER(N)[0], total_length;
	SEXP T;

	/* Protect R objects. */
	PROTECT(T = allocMatrix(CPLXSXP, n, n));

	/* COpy A and B since zgges writes in place. */
	total_length = n * n;
	Memcpy(COMPLEX(T), COMPLEX(A), total_length);

	/* Call Fortran. */
	F77_CALL(zgeev)(CHARPT(JOBVL, 0), CHARPT(JOBVR, 0),
		INTEGER(N), COMPLEX(T), INTEGER(LDA),
		COMPLEX(W), COMPLEX(VL), INTEGER(LDVL),
		COMPLEX(VR), INTEGER(LDVR), COMPLEX(WORK), INTEGER(LWORK),
		REAL(RWORK), INTEGER(INFO));

	/* Return. */
	UNPROTECT(1);
	return(R_NilValue);
} /* End of R_zgeev(). */

