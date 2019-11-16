/* This is a C wrapper for "ztrsen.f" and called by "qz_ztrsen.r". */

#include "R_qz_global.h"

SEXP R_ztrsen(SEXP JOB, SEXP COMPQ, SEXP SELECT,
		SEXP N, SEXP T, SEXP LDT, SEXP Q, SEXP LDQ,
		SEXP W, SEXP M, SEXP S, SEXP SEP,
		SEXP WORK, SEXP LWORK, SEXP INFO){
	int n = INTEGER(N)[0], total_length;
	SEXP RET, RET_NAMES, T_OUT, Q_OUT;
	char CS_JOB = CHARPT(JOB, 0)[0], CS_COMPQ = CHARPT(COMPQ, 0)[0];
	int CF_iwrap;

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
	if(CS_JOB == 'B' && CS_COMPQ == 'V'){
		CF_iwrap = 0;
	} else if (CS_JOB == 'V' && CS_COMPQ == 'V'){
		CF_iwrap = 1;
	} else if (CS_JOB == 'E' && CS_COMPQ == 'V'){
		CF_iwrap = 2;
	} else if (CS_JOB == 'N' && CS_COMPQ == 'V'){
		CF_iwrap = 3;
	} else if (CS_JOB == 'B' && CS_COMPQ == 'N'){
		CF_iwrap = 4;
	} else if (CS_JOB == 'V' && CS_COMPQ == 'N'){
		CF_iwrap = 5;
	} else if (CS_JOB == 'E' && CS_COMPQ == 'N'){
		CF_iwrap = 6;
	} else if (CS_JOB == 'N' && CS_COMPQ == 'N'){
		CF_iwrap = 7;
	} else{
		REprintf("Input (CHARACTER) types are not implemented.\n");
	}
	F77_CALL(wztrsen)(&CF_iwrap,
		INTEGER(SELECT), INTEGER(N),
		COMPLEX(T_OUT), INTEGER(LDT),
		COMPLEX(Q_OUT), INTEGER(LDQ),
		COMPLEX(W), INTEGER(M), REAL(S), REAL(SEP),
		COMPLEX(WORK), INTEGER(LWORK), INTEGER(INFO));

	/* Return. */
	UNPROTECT(4);
	return(RET);
} /* End of R_ztrsen(). */

