dnl Process this file with autoconf to produce a configure script
AC_INIT(DESCRIPTION)

dnl Determine R_HOME.
: ${R_HOME=‘R RHOME‘}
echo ${R_HOME}
if test -z "${R_HOME}"; then
  echo "could not determine R_HOME"
  exit 1
fi

dnl Check LAPACK.
R_SCMD="${R_HOME}/bin/R CMD config"
FLIBS=`${R_SCMD} FLIBS`
BLAS_LIBS=`${R_SCMD} BLAS_LIBS`
LAPACK_LIBS=`${R_SCMD} LAPACK_LIBS`

if test "X$LAPACK_LIBS" = "X"; then
  dnl An external LAPACK is used in run time.
  QZ_OBJS=""
else
  dnl Check Rlapack.

  ### XERBLA is not available.
  # AC_LANG(Fortran)
  # AC_SEARCH_LIBS([zgeev], [Rlapack], [zgeev_ok=yes], [zgeev_ok=no],
  #                [$LAPACK_LIBS $BLAS_LIBS $FLIBS])
  # AC_CHECK_FUNC([zgeev], [zgeev_ok=yes], [zgeev_ok=no])

  ### F77_CALL is not available.
  # R_INCLUDE="${R_HOME}/include/"
  # CPPFLAGS="-I${R_INCLUDE}"
  # AC_CHECK_HEADER([R.h])
  # AC_CHECK_HEADER([Rinternals.h])
  # AC_CHECK_HEADER([R_ext/Lapack.h])
  # AC_CHECK_FUNC([zgeev], [zgeev_ok=yes], [zgeev_ok=no])

  AC_CHECK_PROG([ls_ok], [ls], [yes], [no], ,)
  AC_CHECK_PROG([sed_ok], [sed], [yes], [no], ,)
  AC_CHECK_PROG([grep_ok], [grep], [yes], [no], ,)
  if test "X$ls_ok" = "Xyes" -a "X$sed_ok" = "Xyes" -a "X$grep_ok" = "Xyes"; then
    ### Check R_ext/Lapack.h
    LAPACK_HEADER="${R_HOME}/include/R_ext/Lapack.h"

    funcs=`ls src/qz/*.f | sed -e "s/.*\/\(.*\)\.f/\\1/"`
    QZ_OBJS=""
    for func in ${funcs}
    do
      func_ok=`grep "F77_NAME($func)" ${LAPACK_HEADER}`
      echo "Found $func at ${func_ok}"
      if test "X${func_ok}" = "X"; then
        QZ_OBJS="${QZ_OBJS} qz/$func.o"
      fi
    done
  else
    ### Use default if all above fail. 
    QZ_OBJS="\$(QZ_OBJS)"
  fi
fi

dnl Start to substitute templates
AC_SUBST(QZ_OBJS)
AC_OUTPUT(src/Makevars)

