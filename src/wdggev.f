      SUBROUTINE WDGGEV( IWRAP, N, A, LDA, B, LDB, ALPHAR, ALPHAI,
     $                  BETA, VL, LDVL, VR, LDVR, WORK, LWORK, INFO )
*     .. Scalar Arguments ..
      INTEGER            IWRAP
      INTEGER            INFO, LDA, LDB, LDVL, LDVR, LWORK, N
*     ..
*     .. Array Arguments ..
      DOUBLE PRECISION   A( LDA, * ), ALPHAI( * ), ALPHAR( * ),
     $                   B( LDB, * ), BETA( * ), VL( LDVL, * ),
     $                   VR( LDVR, * ), WORK( * )
*     .. External Subroutines ..
      EXTERNAL           DGGEV
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
      CALL DGGEV( JOBVL, JOBVR, N, A, LDA, B, LDB, ALPHAR, ALPHAI,
     $            BETA, VL, LDVL, VR, LDVR, WORK, LWORK, INFO )
*
      RETURN
      END
