      SUBROUTINE WZGGES( IWRAP, SELCTG, N, A, LDA, B, LDB,
     $                  SDIM, ALPHA, BETA, VSL, LDVSL, VSR, LDVSR, WORK,
     $                  LWORK, RWORK, IBWORK, INFO )
*     .. Scalar Arguments ..
      INTEGER            IWRAP, I
      INTEGER            INFO, LDA, LDB, LDVSL, LDVSR, LWORK, N, SDIM
*     .. Array Arguments ..
      INTEGER            IBWORK( * )
      LOGICAL            BWORK( N )
      DOUBLE PRECISION   RWORK( * )
      COMPLEX*16         A( LDA, * ), ALPHA( * ), B( LDB, * ),
     $                   BETA( * ), VSL( LDVSL, * ), VSR( LDVSR, * ),
     $                   WORK( * )
*     .. Function Arguments ..
      LOGICAL            SELCTG
      EXTERNAL           SELCTG
*     .. External Subroutines ..
      EXTERNAL           ZGGES
*
      CHARACTER          JOBVSL, JOBVSR, SORT
*
      IF (IWRAP .EQ. 0) THEN
          JOBVSL = 'V'
          JOBVSR = 'V'
          SORT = 'N'
      ELSE IF (IWRAP .EQ. 1) THEN
          JOBVSL = 'N'
          JOBVSR = 'V'
          SORT = 'N'
      ELSE IF (IWRAP .EQ. 2) THEN
          JOBVSL = 'V'
          JOBVSR = 'N'
          SORT = 'N'
      ELSE IF (IWRAP .EQ. 3) THEN
          JOBVSL = 'N'
          JOBVSR = 'N'
          SORT = 'N'
      END IF
*
      DO 10 I = 1, N
         IF (IBWORK(I) .EQ. 1) THEN
            BWORK(I) = .TRUE.
         ELSE
            BWORK(I) = .FALSE.
         END IF
   10 CONTINUE
*
      CALL ZGGES( JOBVSL, JOBVSR, SORT, SELCTG, N, A, LDA, B, LDB,
     $            SDIM, ALPHA, BETA, VSL, LDVSL, VSR, LDVSR, WORK,
     $            LWORK, RWORK, BWORK, INFO )
*
      RETURN
      END
