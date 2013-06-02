/* This is a C wrapper for "ztgsen.f" and called by "qz_ztgsen.r". */

#include "R_qz_global.h"

SEXP R_ztgsen(SEXP IJOB, SEXP WANTQ, SEXP WANTZ, SEXP SELECT,
		SEXP N, SEXP S, SEXP LDA, SEXP T, SEXP LDB,
		SEXP ALPHA, SEXP BETA, SEXP Q, SEXP LDQ, SEXP Z, SEXP LDZ,
		SEXP M, SEXP PL, SEXP PR, SEXP DIF,
		SEXP WORK, SEXP LWORK, SEXP IWORK, SEXP LIWORK, SEXP INFO){
	int n = INTEGER(N)[0], total_length;
	SEXP RET, RET_NAMES, S_OUT, T_OUT, Q_OUT, Z_OUT;

	/* Protect R objects. */
	PROTECT(RET = allocVector(VECSXP, 4));
	PROTECT(RET_NAMES = allocVector(STRSXP, 4));
	PROTECT(S_OUT = allocMatrix(CPLXSXP, n, n));
	PROTECT(T_OUT = allocMatrix(CPLXSXP, n, n));
	PROTECT(Q_OUT = allocMatrix(CPLXSXP, n, n));
	PROTECT(Z_OUT = allocMatrix(CPLXSXP, n, n));

	SET_VECTOR_ELT(RET, 0, S_OUT);
	SET_VECTOR_ELT(RET, 1, T_OUT);
	SET_VECTOR_ELT(RET, 2, Q_OUT);
	SET_VECTOR_ELT(RET, 3, Z_OUT);
	SET_STRING_ELT(RET_NAMES, 0, mkChar("S")); 
	SET_STRING_ELT(RET_NAMES, 1, mkChar("T")); 
	SET_STRING_ELT(RET_NAMES, 2, mkChar("Q")); 
	SET_STRING_ELT(RET_NAMES, 3, mkChar("Z")); 
	setAttrib(RET, R_NamesSymbol, RET_NAMES);

	/* COpy A and B since ztgsen writes in place. */
	total_length = n * n;
	Memcpy(COMPLEX(S_OUT), COMPLEX(S), total_length);
	Memcpy(COMPLEX(T_OUT), COMPLEX(T), total_length);
	Memcpy(COMPLEX(Q_OUT), COMPLEX(Q), total_length);
	Memcpy(COMPLEX(Z_OUT), COMPLEX(Z), total_length);

	/* Call Fortran. */
	F77_CALL(ztgsen)(INTEGER(IJOB), INTEGER(WANTQ), INTEGER(WANTZ),
		INTEGER(SELECT), INTEGER(N), COMPLEX(S_OUT), INTEGER(LDA),
		COMPLEX(T_OUT), INTEGER(LDB), COMPLEX(ALPHA), COMPLEX(BETA),
		COMPLEX(Q_OUT), INTEGER(LDQ), COMPLEX(Z_OUT), INTEGER(LDZ),
		INTEGER(M), REAL(PL), REAL(PR), REAL(DIF),
		COMPLEX(WORK), INTEGER(LWORK), INTEGER(IWORK),
		INTEGER(LIWORK), INTEGER(INFO));

	/* Return. */
	UNPROTECT(6);
	return(RET);
} /* End of R_ztgsen(). */

