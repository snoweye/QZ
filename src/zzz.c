#include <R.h>
#include <R_ext/Rdynload.h>

#include "zzz.h"

static const R_CallMethodDef callMethods[] = {
	{"R_dgees", (DL_FUNC) &R_dgees, 15},
	{"R_dgeev", (DL_FUNC) &R_dgeev, 14},
	{"R_dgges", (DL_FUNC) &R_dgges, 21},
	{"R_dggev", (DL_FUNC) &R_dggev, 18},
	{"R_dtgsen", (DL_FUNC) &R_dtgsen, 25},
	{"R_dtrsen", (DL_FUNC) &R_dtrsen, 18},
	{"R_zgees", (DL_FUNC) &R_zgees, 15},
	{"R_zgeev", (DL_FUNC) &R_zgeev, 14},
	{"R_zgges", (DL_FUNC) &R_zgges, 21},
	{"R_zggev", (DL_FUNC) &R_zggev, 17},
	{"R_ztgsen", (DL_FUNC) &R_ztgsen, 24},
	{"R_ztrsen", (DL_FUNC) &R_ztrsen, 15},

	/* Finish R_CallMethodDef. */
	{NULL, NULL, 0}
};
/* End of the callMethods[]. */

void R_init_QZ(DllInfo *info){
	R_registerRoutines(info, NULL, callMethods, NULL, NULL);
	R_useDynamicSymbols(info, TRUE);
} /* End of R_init_QZ(). */
