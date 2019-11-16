      SUBROUTINE WDGEEV( IWRAP, N, A, LDA, WR, WI, VL, LDVL, VR,
     $                  LDVR, WORK, LWORK, INFO )
*     .. Scalar Arguments ..
      INTEGER            IWRAP
      INTEGER            INFO, LDA, LDVL, LDVR, LWORK, N
*     ..
*     .. Array Arguments ..
      DOUBLE PRECISION   A( LDA, * ), VL( LDVL, * ), VR( LDVR, * ),
     $                   WI( * ), WORK( * ), WR( * )
*     .. External Subroutines ..
      EXTERNAL           DGEEV
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
      CALL DGEEV( JOBVL, JOBVR, N, A, LDA, WR, WI, VL, LDVL, VR,
     $            LDVR, WORK, LWORK, INFO )
*
      RETURN
      END
