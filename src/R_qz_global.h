#ifndef __QZ_
#define __QZ_

/* R objects. */
#include <R.h>
#include <Rinternals.h>


/* Obtain character pointers. */
#define CHARPT(x,i)	((char*)CHAR(STRING_ELT(x,i)))


#ifdef  __cplusplus
extern "C" {
#endif

/* Complex matrix A. */
extern void F77_NAME(wzgees)(int *CF_iwrap,
	int (*SELECT)(Rcomplex*), /* function pointer */
	int *N, Rcomplex *A, int *LDA,
	int *SDIM, Rcomplex *W,
	Rcomplex *VS, int *LDVS,
	Rcomplex *WORK, int *LWORK, double *RWORK,
	int *BWORK, /* logical */
	int *INFO);
extern void F77_NAME(wzgeev)(int *CF_iwrap,
	int *N, Rcomplex *A, int *LDA,
	Rcomplex *W,
	Rcomplex *VL, int *LDVL, Rcomplex *VR, int *LDVR,
	Rcomplex *WORK, int *LWORK, double *RWORK,
	int *INFO);
extern void F77_NAME(wztrsen)(int *CF_iwrap, int *SELECT,
	int *N, Rcomplex *T, int *LDT,
	Rcomplex *Q, int *LDQ, Rcomplex *W, int *M, double *S,
	double *SEP, Rcomplex *WORK, int *LWORK, int *INFO);


/* Complex paired matrices (A,B). */
extern void F77_NAME(wzgges)(int *CF_iwrap,
	int (*SELCTG)(Rcomplex*, Rcomplex*), /* function pointer */
	int *N, Rcomplex *A, int *LDA, Rcomplex *B, int *LDB,
	int *SDIM, Rcomplex *ALPHA, Rcomplex *BETA,
	Rcomplex *VSL, int *LDVSL, Rcomplex *VSR, int *LDVSR,
	Rcomplex *WORK, int *LWORK, double *RWORK,
	int *BWORK, /* logical */
	int *INFO);
extern void F77_NAME(wzggev)(int *CF_iwrap,
	int *N, Rcomplex *A, int *LDA, Rcomplex *B, int *LDB,
	Rcomplex *ALPHA, Rcomplex *BETA,
	Rcomplex *VL, int *LDVL, Rcomplex *VR, int *LDVR,
	Rcomplex *WORK, int *LWORK, double *RWORK,
	int *INFO);
extern void F77_NAME(ztgsen)(int *IJOB, int *WANTQ, int *WANTZ, int *SELECT,
	int *N, Rcomplex *A, int *LDA, Rcomplex *B, int *LDB,
	/* (A,B) is in (S,T). */
	Rcomplex *ALPHA, Rcomplex *BETA, Rcomplex *Q, int *LDQ,
	Rcomplex *Z, int *LDZ, int *M, double *PL, double *PR, double *DIF,
	Rcomplex *WORK, int *LWORK, int *IWORK, int *LIWORK, int *INFO);


/* Double matrix A. */
extern void F77_NAME(wdgees)(int *CF_iwrap,
	int (*SELECT)(double*, double*), /* function pointer */
	int *N, double *A, int *LDA,
	int *SDIM, double *WR, double *WI,
	double *VS, int *LDVS,
	double *WORK, int *LWORK,
	int *BWORK, /* logical */
	int *INFO);
extern void F77_NAME(wdgeev)(int *CF_iwrap,
	int *N, double *A, int *LDA,
	double *WR, double *WI,
	double *VL, int *LDVL, double *VR, int *LDVR,
	double *WORK, int *LWORK,
	int *INFO);
extern void F77_NAME(wdtrsen)(int *CF_iwrap, int *SELECT,
	int *N, double *T, int *LDT,
	double *Q, int *LDQ,
	double *WR, double *WI,
	int *M, double *S, double *SEP,
	double *WORK, int *LWORK, int *IWORK, int *LIWORK, int *INFO);


/* Double paired matrices (A,B). */
extern void F77_NAME(wdgges)(int *CF_iwrap,
	int (*SELCTG)(double*, double*, double*), /* function pointer */
	int *N, double *A, int *LDA, double *B, int *LDB,
	int *SDIM, double *ALPHAR, double *ALPHAI, double *BETA,
	double *VSL, int *LDVSL, double *VSR, int *LDVSR,
	double *WORK, int *LWORK,
	int *BWORK, /* logical */
	int *INFO);
extern void F77_NAME(wdggev)(int *CF_iwrap,
	int *N, double *A, int *LDA, double *B, int *LDB,
	double *ALPHAR, double *ALPHAI, double *BETA,
	double *VL, int *LDVL, double *VR, int *LDVR,
	double *WORK, int *LWORK,
	int *INFO);
extern void F77_NAME(dtgsen)(int *IJOB, int *WANTQ, int *WANTZ, int *SELECT,
	int *N, double *A, int *LDA, double *B, int *LDB,
	/* (A,B) is in (S,T). */
	double *ALPHAR, double *ALPHAI, double *BETA, double *Q, int *LDQ,
	double *Z, int *LDZ, int *M, double *PL, double *PR, double *DIF,
	double *WORK, int *LWORK, int *IWORK, int *LIWORK, int *INFO);

#ifdef  __cplusplus
}
#endif

#endif

