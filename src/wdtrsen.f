      SUBROUTINE WDTRSEN( WRAP, SELECT, N, T, LDT, Q, LDQ, WR, WI,
     $                   M, S, SEP, WORK, LWORK, IWORK, LIWORK, INFO )
*     .. Scalar Arguments ..
      INTEGER            WRAP
      INTEGER            INFO, LDQ, LDT, LIWORK, LWORK, M, N
      DOUBLE PRECISION   S, SEP
*     ..
*     .. Array Arguments ..
      LOGICAL            SELECT( * )
      INTEGER            IWORK( * )
      DOUBLE PRECISION   Q( LDQ, * ), T( LDT, * ), WI( * ), WORK( * ),
     $                   WR( * )
*     .. External Subroutines ..
      EXTERNAL           DTRSEN
*
      CHARACTER          COMPQ, JOB
      IF (WRAP .EQ. 0) THEN
          JOB = 'B'
          COMPQ = 'V'
      ELSE IF (WRAP .EQ. 1) THEN
          JOB = 'V'
          COMPQ = 'V'
      ELSE IF (WRAP .EQ. 2) THEN
          JOB = 'E'
          COMPQ = 'V'
      ELSE IF (WRAP .EQ. 3) THEN
          JOB = 'N'
          COMPQ = 'V'
      ELSE IF (WRAP .EQ. 4) THEN
          JOB = 'B'
          COMPQ = 'N'
      ELSE IF (WRAP .EQ. 5) THEN
          JOB = 'V'
          COMPQ = 'N'
      ELSE IF (WRAP .EQ. 6) THEN
          JOB = 'E'
          COMPQ = 'N'
      ELSE IF (WRAP .EQ. 7) THEN
          JOB = 'N'
          COMPQ = 'N'
      END IF
*
      CALL DTRSEN( JOB, COMPQ, SELECT, N, T, LDT, Q, LDQ, WR, WI,
     $             M, S, SEP, WORK, LWORK, IWORK, LIWORK, INFO )
*
      RETURN
*
      END
