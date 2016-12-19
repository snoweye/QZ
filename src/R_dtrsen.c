/* This is a C wrapper for "dtrsen.f" and called by "qz_dtrsen.r". */

#include "R_qz_global.h"

SEXP R_dtrsen(SEXP JOB, SEXP COMPQ, SEXP SELECT,
		SEXP N, SEXP T, SEXP LDT, SEXP Q, SEXP LDQ,
		SEXP WR, SEXP WI, SEXP M, SEXP S, SEXP SEP,
		SEXP WORK, SEXP LWORK, SEXP IWORK, SEXP LIWORK, SEXP INFO){
	int n = INTEGER(N)[0], total_length;
	SEXP RET, RET_NAMES, T_OUT, Q_OUT;
	const char *C_JOB = CHARPT(JOB, 0), *C_COMPQ = CHARPT(COMPQ, 0);

	/* Protect R objects. */
	PROTECT(RET = allocVector(VECSXP, 2));
	PROTECT(RET_NAMES = allocVector(STRSXP, 2));
	PROTECT(T_OUT = allocMatrix(REALSXP, n, n));
	PROTECT(Q_OUT = allocMatrix(REALSXP, n, n));

	SET_VECTOR_ELT(RET, 0, T_OUT);
	SET_VECTOR_ELT(RET, 1, Q_OUT);
	SET_STRING_ELT(RET_NAMES, 0, mkChar("T")); 
	SET_STRING_ELT(RET_NAMES, 1, mkChar("Q")); 
	setAttrib(RET, R_NamesSymbol, RET_NAMES);

	/* COpy A and B since dtrsen writes in place. */
	total_length = n * n;
	Memcpy(REAL(T_OUT), REAL(T), total_length);
	Memcpy(REAL(Q_OUT), REAL(Q), total_length);

	/* Call Fortran. */
	F77_CALL(dtrsen)(C_JOB, C_COMPQ,
		INTEGER(SELECT), INTEGER(N),
		REAL(T_OUT), INTEGER(LDT),
		REAL(Q_OUT), INTEGER(LDQ),
		REAL(WR), REAL(WI),
		INTEGER(M), REAL(S), REAL(SEP),
		REAL(WORK), INTEGER(LWORK), INTEGER(IWORK),
		INTEGER(LIWORK), INTEGER(INFO));

	/* Return. */
	UNPROTECT(4);
	return(RET);
} /* End of R_dtrsen(). */

