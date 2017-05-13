      SUBROUTINE WZGGES( WRAP, SELCTG, N, A, LDA, B, LDB,
     $                  SDIM, ALPHA, BETA, VSL, LDVSL, VSR, LDVSR, WORK,
     $                  LWORK, RWORK, BWORK, INFO )
*     .. Scalar Arguments ..
      INTEGER            WARP
      INTEGER            INFO, LDA, LDB, LDVSL, LDVSR, LWORK, N, SDIM
*     .. Array Arguments ..
      LOGICAL            BWORK( * )
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
      CALL ZGGES( JOBVSL, JOBVSR, SORT, SELCTG, N, A, LDA, B, LDB,
     $            SDIM, ALPHA, BETA, VSL, LDVSL, VSR, LDVSR, WORK,
     $            LWORK, RWORK, BWORK, INFO )
*
      RETURN
      END
