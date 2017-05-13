      SUBROUTINE WDGGES( WRAP, SELCTG, N, A, LDA, B, LDB,
     $                  SDIM, ALPHAR, ALPHAI, BETA, VSL, LDVSL, VSR,
     $                  LDVSR, WORK, LWORK, BWORK, INFO )
*     .. Scalar Arguments ..
      INTEGER            WRAP
      INTEGER            INFO, LDA, LDB, LDVSL, LDVSR, LWORK, N, SDIM
*     .. Array Arguments ..
      LOGICAL            BWORK( * )
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
      IF (WRAP .EQ. 0) THEN
          JOBVSL = 'V'
          JOBVSR = 'V'
          SORT = 'N'
      ELSE IF (WRAP .EQ. 1) THEN
          JOBVSL = 'N'
          JOBVSR = 'V'
          SORT = 'N'
      ELSE IF (WRAP .EQ. 2) THEN
          JOBVSL = 'V'
          JOBVSR = 'N'
          SORT = 'N'
      ELSE IF (WRAP .EQ. 3) THEN
          JOBVSL = 'N'
          JOBVSR = 'N'
          SORT = 'N'
      END IF
*
      CALL DGGES( JOBVSL, JOBVSR, SORT, SELCTG, N, A, LDA, B, LDB,
     $            SDIM, ALPHAR, ALPHAI, BETA, VSL, LDVSL, VSR,
     $            LDVSR, WORK, LWORK, BWORK, INFO )
*
      RETURN
      END
