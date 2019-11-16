      SUBROUTINE WZGEEV( IWRAP, N, A, LDA, W, VL, LDVL, VR, LDVR,
     $                  WORK, LWORK, RWORK, INFO ) 
*     .. Scalar Arguments ..
      INTEGER            IWRAP
      INTEGER            INFO, LDA, LDVL, LDVR, LWORK, N
*     .. Array Arguments ..
      DOUBLE PRECISION   RWORK( * )
      COMPLEX*16         A( LDA, * ), VL( LDVL, * ), VR( LDVR, * ),
     $                   W( * ), WORK( * )
*     .. External Subroutines ..
      EXTERNAL           ZGEEV
*
      CHARACTER          JOBVL, JOBVR
      IF (IWRAP .EQ. 0) THEN
          JOBVL = 'V'
          JOBVR = 'V'
      ELSE IF (IWRAP .EQ. 1) THEN
          JOBVL = 'N'
          JOBVR = 'V'
      ELSE IF (IWRAP .EQ. 2) THEN
          JOBVL = 'V'
          JOBVR = 'N'
      ELSE IF (IWRAP .EQ. 3) THEN
          JOBVL = 'N'
          JOBVR = 'N'
      END IF
*
      CALL ZGEEV( JOBVL, JOBVR, N, A, LDA, W, VL, LDVL, VR, LDVR,
     $            WORK, LWORK, RWORK, INFO ) 
*
      RETURN
      END
