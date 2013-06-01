/* This is a C wrapper for "dtgsen.f" and called by "qz_dtgsen.r". */

#include "R_qz_global.h"

SEXP R_dtgsen(SEXP IJOB, SEXP WANTQ, SEXP WANTZ, SEXP SELECT,
		SEXP N, SEXP S, SEXP LDA, SEXP T, SEXP LDB,
		SEXP ALPHAR, SEXP ALPHAI, SEXP BETA,
		SEXP Q, SEXP LDQ, SEXP Z, SEXP LDZ,
		SEXP M, SEXP PL, SEXP PR, SEXP DIF,
		SEXP WORK, SEXP LWORK, SEXP IWORK, SEXP LIWORK, SEXP INFO){
	int n = INTEGER(N)[0], total_length;
	SEXP RET, RET_NAMES, S_OUT, T_OUT, Q_OUT, Z_OUT;

	/* Protect R objects. */
	PROTECT(RET = allocVector(VECSXP, 4));
	PROTECT(RET_NAMES = allocVector(STRSXP, 4));
	PROTECT(S_OUT = allocMatrix(REALSXP, n, n));
	PROTECT(T_OUT = allocMatrix(REALSXP, n, n));
	PROTECT(Q_OUT = allocMatrix(REALSXP, n, n));
	PROTECT(Z_OUT = allocMatrix(REALSXP, n, n));

	SET_VECTOR_ELT(RET, 0, S_OUT);
	SET_VECTOR_ELT(RET, 1, T_OUT);
	SET_VECTOR_ELT(RET, 2, Q_OUT);
	SET_VECTOR_ELT(RET, 3, Z_OUT);
	SET_STRING_ELT(RET_NAMES, 0, mkChar("S")); 
	SET_STRING_ELT(RET_NAMES, 1, mkChar("T")); 
	SET_STRING_ELT(RET_NAMES, 2, mkChar("Q")); 
	SET_STRING_ELT(RET_NAMES, 3, mkChar("Z")); 
	setAttrib(RET, R_NamesSymbol, RET_NAMES);

	/* COpy A and B since dtgsen writes in place. */
	total_length = n * n;
	Memcpy(REAL(S_OUT), REAL(S), total_length);
	Memcpy(REAL(T_OUT), REAL(T), total_length);
	Memcpy(REAL(Q_OUT), REAL(Q), total_length);
	Memcpy(REAL(Z_OUT), REAL(Z), total_length);

	/* Call Fortran. */
	F77_CALL(dtgsen)(INTEGER(IJOB), INTEGER(WANTQ), INTEGER(WANTZ),
		INTEGER(SELECT), INTEGER(N), REAL(S_OUT), INTEGER(LDA),
		REAL(T_OUT), INTEGER(LDB),
		REAL(ALPHAR), REAL(ALPHAI), REAL(BETA),
		REAL(Q_OUT), INTEGER(LDQ), REAL(Z_OUT), INTEGER(LDZ),
		INTEGER(M), REAL(PL), REAL(PR), REAL(DIF),
		REAL(WORK), INTEGER(LWORK), INTEGER(IWORK),
		INTEGER(LIWORK), INTEGER(INFO));

	/* Return. */
	UNPROTECT(6);
	return(RET);
} /* End of R_dtgsen(). */

