      SUBROUTINE WZGEES( IWRAP, SELECT, N, A, LDA, SDIM, W, VS,
     $                  LDVS, WORK, LWORK, RWORK, IBWORK, INFO )
*     .. Scalar Arguments ..
      INTEGER            IWRAP, I
      INTEGER            INFO, LDA, LDVS, LWORK, N, SDIM
*     .. Array Arguments ..
      INTEGER            IBWORK( * )
      LOGICAL            BWORK( N )
      DOUBLE PRECISION   RWORK( * )
      COMPLEX*16         A( LDA, * ), VS( LDVS, * ), W( * ), WORK( * )
*     .. Function Arguments ..
      LOGICAL            SELECT
      EXTERNAL           SELECT
*     .. External Subroutines ..
      EXTERNAL           ZGEES
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
      CALL ZGEES( JOBVS, SORT, SELECT, N, A, LDA, SDIM, W, VS,
     $            LDVS, WORK, LWORK, RWORK, BWORK, INFO )
*
      RETURN
*
      END
