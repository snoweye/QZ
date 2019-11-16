dnl Process this file with autoconf to produce a configure script
AC_INIT(DESCRIPTION)

dnl Check chmod
chmod +x ./inst/ex_verify/run_all.sh

dnl Determine R_HOME.
: ${R_HOME=‘R RHOME‘}
echo ${R_HOME}
if test -z "${R_HOME}"; then
  echo "could not determine R_HOME"
  exit 1
fi

dnl Obtain from R.
R_SCMD="${R_HOME}/bin/R CMD config"
FLIBS=`${R_SCMD} FLIBS`
BLAS_LIBS=`${R_SCMD} BLAS_LIBS`
LAPACK_LIBS=`${R_SCMD} LAPACK_LIBS`

dnl Check tools.
AC_CHECK_PROG([ls_ok], [ls], [yes], [no], ,)
AC_CHECK_PROG([echo_ok], [echo], [yes], [no], ,)
AC_CHECK_PROG([sed_ok], [sed], [yes], [no], ,)
AC_CHECK_PROG([grep_ok], [grep], [yes], [no], ,)

dnl Check Rlapack.
if test "X$echo_ok" = "Xyes" -a "X$grep_ok" = "Xyes"; then
  Rlapack_ok=`echo ${LAPACK_LIBS} | grep "\-lRlapack"`
  if test "X$Rlapack_ok" = "X"; then
    dnl Rlapack is not found.
    Rlapack_ok="NA"
  else
    echo "Found Rlpack from ${Rlapack_ok}"
  fi
else
  dnl echo and grep are not found.
  Rlapack_ok="NA"
fi

if test "X$Rlapack_ok" = "XNA"; then
  dnl An external LAPACK is used in run time.
  QZ_OBJS=""
else
  dnl Rlapack is used.

  ### XERBLA_ is not available.
  # AC_LANG(Fortran)
  # AC_SEARCH_LIBS([zgeev], [Rlapack], [zgeev_ok=yes], [zgeev_ok=no],
  #                [$LAPACK_LIBS $BLAS_LIBS $FLIBS])
  # AC_CHECK_FUNC([zgeev], [zgeev_ok=yes], [zgeev_ok=no])

  ### F77_CALL() is not available.
  # R_INCLUDE="${R_HOME}/include/"
  # CPPFLAGS="-I${R_INCLUDE}"
  # AC_CHECK_HEADER([R.h])
  # AC_CHECK_HEADER([Rinternals.h])
  # AC_CHECK_HEADER([R_ext/Lapack.h])
  # AC_CHECK_FUNC([zgeev], [zgeev_ok=yes], [zgeev_ok=no])

  if test "X$ls_ok" = "Xyes" -a "X$sed_ok" = "Xyes" -a "X$grep_ok" = "Xyes"; then
    QZ_OBJS=""
    # funcs=`ls src/qz/*.f | sed -e "s/.*\/\(.*\)\.f/\\1/"`

    ### Check R_ext/Lapack.h
    # LAPACK_HEADER="${R_HOME}/include/R_ext/Lapack.h"
    # echo "LAPACK_HEADER=${LAPACK_HEADER}"
    # for func in ${funcs}
    # do
    #   func_ok=`grep "F77_NAME($func)" ${LAPACK_HEADER}`
    #   echo "Found $func from ${func_ok}"
    #   if test "X${func_ok}" = "X"; then
    #     QZ_OBJS="${QZ_OBJS} qz/$func.o"
    #   fi
    # done

    ### Check lib/libRlapack.so using nm
    # RLAPACK_LIB="${R_HOME}/lib${R_ARCH}/libRlapack.*"
    # echo "RLAPACK_LIB=${RLAPACK_LIB}"
    # for func in ${funcs}
    # do
    #   func_ok=`nm ${RLAPACK_LIB} | grep " T $func"`
    #   echo "Found $func from ${func_ok}"
    #   if test "X${func_ok}" = "X"; then
    #     QZ_OBJS="${QZ_OBJS} qz/$func.o"
    #   fi
    # done
  else
    ### Use default if all above fail. 
    QZ_OBJS="\$(QZ_OBJS)"
  fi
fi


dnl Check enable internal QZ
AC_ARG_ENABLE(iqz,
  AC_HELP_STRING([--enable-iqz], [Enable internal QZ functions, default no.]),
                 [ENABLE_IQZ="yes"], [ENABLE_IQZ="no"])
if test "X$ENABLE_IQZ" = "Xyes" ; then
  ### Use default to overwrite all above regardless.
  QZ_OBJS="\$(QZ_OBJS)"
fi


dnl Start to substitute templates
AC_SUBST(QZ_OBJS)
AC_OUTPUT(src/Makevars)

