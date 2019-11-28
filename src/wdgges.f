      SUBROUTINE WDGGES( IWRAP, SELCTG, N, A, LDA, B, LDB,
     $                  SDIM, ALPHAR, ALPHAI, BETA, VSL, LDVSL, VSR,
     $                  LDVSR, WORK, LWORK, IBWORK, INFO )
*     .. Scalar Arguments ..
      INTEGER            IWRAP, I
      INTEGER            INFO, LDA, LDB, LDVSL, LDVSR, LWORK, N, SDIM
*     .. Array Arguments ..
      INTEGER            IBWORK( * )
      LOGICAL            BWORK( N )
      DOUBLE PRECISION   A( LDA, * ), ALPHAI( * ), ALPHAR( * ),
     $                   B( LDB, * ), BETA( * ), VSL( LDVSL, * ),
     $                   VSR( LDVSR, * ), WORK( * )
*     .. Function Arguments ..
      LOGICAL            SELCTG
      EXTERNAL           SELCTG
*     .. External Subroutines ..
      EXTERNAL           DGGES
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
      CALL DGGES( JOBVSL, JOBVSR, SORT, SELCTG, N, A, LDA, B, LDB,
     $            SDIM, ALPHAR, ALPHAI, BETA, VSL, LDVSL, VSR,
     $            LDVSR, WORK, LWORK, BWORK, INFO )
*
      RETURN
      END
