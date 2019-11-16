      SUBROUTINE WDGEES( IWRAP, SELECT, N, A, LDA, SDIM, WR, WI,
     $                  VS, LDVS, WORK, LWORK, BWORK, INFO )
*     .. Scalar Arguments ..
      INTEGER            IWRAP
      INTEGER            INFO, LDA, LDVS, LWORK, N, SDIM
*     .. Array Arguments ..
      LOGICAL            BWORK( * )
      DOUBLE PRECISION   A( LDA, * ), VS( LDVS, * ), WI( * ), WORK( * ),
     $                   WR( * )
*     .. Function Arguments ..
      LOGICAL            SELECT
      EXTERNAL           SELECT
*     .. External Subroutines ..
      EXTERNAL           DGEES
*
      CHARACTER          JOBVS, SORT
      IF (IWRAP .EQ. 0) THEN
          JOBVS = 'V'
          SORT = 'N'
      ELSE IF (IWRAP .EQ. 1) THEN
          JOBVS = 'N'
          SORT = 'N'
      END IF
*
      CALL DGEES( JOBVS, SORT, SELECT, N, A, LDA, SDIM, WR, WI,
     $            VS, LDVS, WORK, LWORK, BWORK, INFO )
*
      RETURN
*
      END
