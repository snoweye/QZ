/* This is a C wrapper for "dgees.f" and called by "qz_dgees.r". */

#include "R_qz_global.h"

static int fake_select(double *wr, double *wi){
	return 0;
} /* End of fake_select(). */

SEXP R_dgees(SEXP JOBVS, SEXP SORT, SEXP SELECT, SEXP N,
		SEXP A, SEXP LDA, SEXP SDIM,
		SEXP WR, SEXP WI,
		SEXP VS, SEXP LDVS,
		SEXP WORK, SEXP LWORK, SEXP BWORK,
		SEXP INFO){
	int n = INTEGER(N)[0], total_length;
	SEXP RET, RET_NAMES, T;
	char CS_JOBVS = CHARPT(JOBVS, 0)[0], CS_SORT = CHARPT(SORT, 0)[0];

	/* Protect R objects. */
	PROTECT(RET = allocVector(VECSXP, 1));
	PROTECT(RET_NAMES = allocVector(STRSXP, 1));
	PROTECT(T = allocMatrix(REALSXP, n, n));

	SET_VECTOR_ELT(RET, 0, T);
	SET_STRING_ELT(RET_NAMES, 0, mkChar("T")); 
	setAttrib(RET, R_NamesSymbol, RET_NAMES);

	/* COpy A and B since dgees writes in place. */
	total_length = n * n;
	Memcpy(REAL(T), REAL(A), total_length);

	/* Call Fortran. */
	if(CS_JOBVS == 'V' && CS_SORT == 'N'){
		F77_CALL(dgees)("V", "N",
			fake_select, INTEGER(N), REAL(T), INTEGER(LDA),
			INTEGER(SDIM),
			REAL(WR), REAL(WI), REAL(VS), INTEGER(LDVS), REAL(WORK),
			INTEGER(LWORK), INTEGER(BWORK), INTEGER(INFO));
	} else if(CS_JOBVS == 'N' && CS_SORT == 'N'){
		F77_CALL(dgees)("N", "N",
			fake_select, INTEGER(N), REAL(T), INTEGER(LDA),
			INTEGER(SDIM),
			REAL(WR), REAL(WI), REAL(VS), INTEGER(LDVS), REAL(WORK),
			INTEGER(LWORK), INTEGER(BWORK), INTEGER(INFO));
	} else{
		REprintf("Input (CHARACTER) types are not implemented.\n");
	}

	/* Return. */
	UNPROTECT(3);
	return(RET);
} /* End of R_dgees(). */

