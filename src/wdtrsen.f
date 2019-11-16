      SUBROUTINE WDTRSEN( IWRAP, SELECT, N, T, LDT, Q, LDQ, WR, WI,
     $                   M, S, SEP, WORK, LWORK, IWORK, LIWORK, INFO )
*     .. Scalar Arguments ..
      INTEGER            IWRAP
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
      IF (IWRAP .EQ. 0) THEN
          JOB = 'B'
          COMPQ = 'V'
      ELSE IF (IWRAP .EQ. 1) THEN
          JOB = 'V'
          COMPQ = 'V'
      ELSE IF (IWRAP .EQ. 2) THEN
          JOB = 'E'
          COMPQ = 'V'
      ELSE IF (IWRAP .EQ. 3) THEN
          JOB = 'N'
          COMPQ = 'V'
      ELSE IF (IWRAP .EQ. 4) THEN
          JOB = 'B'
          COMPQ = 'N'
      ELSE IF (IWRAP .EQ. 5) THEN
          JOB = 'V'
          COMPQ = 'N'
      ELSE IF (IWRAP .EQ. 6) THEN
          JOB = 'E'
          COMPQ = 'N'
      ELSE IF (IWRAP .EQ. 7) THEN
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
