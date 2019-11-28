      SUBROUTINE WZTRSEN( IWRAP, ISELECT, N, T, LDT, Q, LDQ, W, M, S,
     $                   SEP, WORK, LWORK, INFO )
*     .. Scalar Arguments ..
      INTEGER            IWRAP, I
      INTEGER            INFO, LDQ, LDT, LWORK, M, N
      DOUBLE PRECISION   S, SEP
*     ..
*     .. Array Arguments ..
      INTEGER            ISELECT( * )
      LOGICAL            SELECT( N )
      COMPLEX*16         Q( LDQ, * ), T( LDT, * ), W( * ), WORK( * )
*     ..
*     .. External Subroutines ..
      EXTERNAL           ZTRSEN

      CHARACTER          COMPQ, JOB
*
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
      DO 10 I = 1, N
         IF (ISELECT(I) .EQ. 1) THEN
            SELECT(I) = .TRUE.
         ELSE
            SELECT(I) = .FALSE.
         END IF
   10 CONTINUE
*
      CALL ZTRSEN( JOB, COMPQ, SELECT, N, T, LDT, Q, LDQ, W, M, S,
     $             SEP, WORK, LWORK, INFO )
*
      RETURN
*
      END
