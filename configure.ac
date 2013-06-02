dnl Process this file with autoconf to produce a configure script
AC_INIT(DESCRIPTION)

dnl Determine R_HOME.
: ${R_HOME=‘R RHOME‘}
if test -z "${R_HOME}"; then
  echo "could not determine R_HOME"
  exit 1
fi

dnl Check external.
R_SCMD="${R_HOME}/bin/R CMD config"
CC=`${R_SCMD} CC`
F77=`${R_SCMD} F77`
CFLAGS=`${R_SCMD} CFLAGS`
FFLAGS=`${R_SCMD} FFLAGS`
LDFLAGS=`${R_SCMD} LDFLAGS`
FLIBS=`${R_SCMD} FLIBS`
BLAS_LIBS=`${R_SCMD} BLAS_LIBS`
LAPACK_LIBS=`${R_SCMD} LAPACK_LIBS`

save_LIBS="$LIBS"; LIBS="$LAPACK_LIBS $BLAS_LIBS $FLIBS"
# AC_LANG(Fortran)
# AC_FC_FUNC(zgeev)
# AC_CHECK_FUNC(zgeev)
# AC_MSG_RESULT($LIBS)
# AC_TRY_LINK_FUNC($zgeev, [zgeev_ok=yes], [zgeev_ok=no])
# AC_MSG_RESULT(zgeev $zgeev_ok)
LIBS="$save_LIBS"

# AC_CHECK_LIB(, [DGEMM], [a_ok=yes], [a_ok=no],
#              [$LAPACK_LIBS $BLAS_LIBS $FLIBS])
AC_CHECK_FUNC(dgeev)
AC_MSG_RESULT(a $a_ok)

dnl Start to substitute templates
AC_OUTPUT(src/Makevars)
