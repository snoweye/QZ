/* This is a C wrapper for "ztrsen.f" and called by "qz_ztrsen.r". */

#include "R_qz_global.h"

SEXP R_ztrsen(SEXP JOB, SEXP COMPQ, SEXP SELECT,
		SEXP N, SEXP T, SEXP LDT, SEXP Q, SEXP LDQ,
		SEXP W, SEXP M, SEXP S, SEXP SEP,
		SEXP WORK, SEXP LWORK, SEXP INFO){
	int n = INTEGER(N)[0], total_length;
	SEXP RET, RET_NAMES, T_OUT, Q_OUT;

	/* Protect R objects. */
	PROTECT(RET = allocVector(VECSXP, 2));
	PROTECT(RET_NAMES = allocVector(STRSXP, 2));
	PROTECT(T_OUT = allocMatrix(CPLXSXP, n, n));
	PROTECT(Q_OUT = allocMatrix(CPLXSXP, n, n));

	SET_VECTOR_ELT(RET, 0, T_OUT);
	SET_VECTOR_ELT(RET, 1, Q_OUT);
	SET_STRING_ELT(RET_NAMES, 0, mkChar("T")); 
	SET_STRING_ELT(RET_NAMES, 1, mkChar("Q")); 
	setAttrib(RET, R_NamesSymbol, RET_NAMES);

	/* COpy T since ztrsen writes in place. */
	total_length = n * n;
	Memcpy(COMPLEX(T_OUT), COMPLEX(T), total_length);
	Memcpy(COMPLEX(Q_OUT), COMPLEX(Q), total_length);

	/* Call Fortran. */
	F77_CALL(ztrsen)(CHARPT(JOB, 0), CHARPT(COMPQ, 0),
		INTEGER(SELECT), INTEGER(N),
		COMPLEX(T_OUT), INTEGER(LDT),
		COMPLEX(Q_OUT), INTEGER(LDQ),
		COMPLEX(W), INTEGER(M), REAL(S), REAL(SEP),
		COMPLEX(WORK), INTEGER(LWORK), INTEGER(INFO));

	/* Return. */
	UNPROTECT(4);
	return(RET);
} /* End of R_ztrsen(). */

