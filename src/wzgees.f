      SUBROUTINE WZGEES( WRAP, SELECT, N, A, LDA, SDIM, W, VS,
     $                  LDVS, WORK, LWORK, RWORK, BWORK, INFO )
*     .. Scalar Arguments ..
      INTEGER            WRAP
      INTEGER            INFO, LDA, LDVS, LWORK, N, SDIM
*     .. Array Arguments ..
      LOGICAL            BWORK( * )
      DOUBLE PRECISION   RWORK( * )
      COMPLEX*16         A( LDA, * ), VS( LDVS, * ), W( * ), WORK( * )
*     .. Function Arguments ..
      LOGICAL            SELECT
      EXTERNAL           SELECT
*     .. External Subroutines ..
      EXTERNAL           ZGEES
*
      CHARACTER          JOBVS, SORT
      IF (WRAP .EQ. 0) THEN
          JOBVS = 'V'
          SORT = 'N'
      ELSE IF (WRAP .EQ. 1) THEN
          JOBVS = 'N'
          SORT = 'N'
      END IF
*
      CALL ZGEES( JOBVS, SORT, SELECT, N, A, LDA, SDIM, W, VS,
     $            LDVS, WORK, LWORK, RWORK, BWORK, INFO )
*
      RETURN
*
      END
