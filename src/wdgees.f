      SUBROUTINE WDGEES( IWRAP, SELECT, N, A, LDA, SDIM, WR, WI,
     $                  VS, LDVS, WORK, LWORK, IBWORK, INFO )
*     .. Scalar Arguments ..
      INTEGER            IWRAP, I
      INTEGER            INFO, LDA, LDVS, LWORK, N, SDIM
*     .. Array Arguments ..
      INTEGER            IBWORK( * )
      LOGICAL            BWORK( N )
      DOUBLE PRECISION   A( LDA, * ), VS( LDVS, * ), WI( * ), WORK( * ),
     $                   WR( * )
*     .. Function Arguments ..
      LOGICAL            SELECT
      EXTERNAL           SELECT
*     .. External Subroutines ..
      EXTERNAL           DGEES
*
      CHARACTER          JOBVS, SORT
*
      IF (IWRAP .EQ. 0) THEN
          JOBVS = 'V'
          SORT = 'N'
      ELSE IF (IWRAP .EQ. 1) THEN
          JOBVS = 'N'
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
      CALL DGEES( JOBVS, SORT, SELECT, N, A, LDA, SDIM, WR, WI,
     $            VS, LDVS, WORK, LWORK, BWORK, INFO )
*
      RETURN
*
      END
