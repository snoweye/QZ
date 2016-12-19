/* This is a C wrapper for "zggev.f" and called by "qz_zggev.r". */

#include "R_qz_global.h"

SEXP R_zggev(SEXP JOBVL, SEXP JOBVR, SEXP N,
		SEXP A, SEXP LDA, SEXP B, SEXP LDB,
		SEXP ALPHA, SEXP BETA, SEXP VL, SEXP LDVL, SEXP VR,
		SEXP LDVR, SEXP WORK, SEXP LWORK, SEXP RWORK,
		SEXP INFO){
	int n = INTEGER(N)[0], total_length;
	SEXP S, T;
	const char *C_JOBVL = CHARPT(JOBVL, 0), *C_JOBVR = CHARPT(JOBVR, 0);

	/* Protect R objects. */
	PROTECT(S = allocMatrix(CPLXSXP, n, n));
	PROTECT(T = allocMatrix(CPLXSXP, n, n));

	/* COpy A and B since zgges writes in place. */
	total_length = n * n;
	Memcpy(COMPLEX(S), COMPLEX(A), total_length);
	Memcpy(COMPLEX(T), COMPLEX(B), total_length);

	/* Call Fortran. */
	F77_CALL(zggev)(C_JOBVL, C_JOBVR,
		INTEGER(N), COMPLEX(S), INTEGER(LDA),
		COMPLEX(T), INTEGER(LDB),
		COMPLEX(ALPHA), COMPLEX(BETA), COMPLEX(VL), INTEGER(LDVL),
		COMPLEX(VR), INTEGER(LDVR), COMPLEX(WORK), INTEGER(LWORK),
		REAL(RWORK), INTEGER(INFO));

	/* Return. */
	UNPROTECT(2);
	return(R_NilValue);
} /* End of R_zggev(). */

