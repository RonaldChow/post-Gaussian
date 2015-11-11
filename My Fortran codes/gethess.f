      PROGRAM gethess
c
      REAL*8 g1(305),g2(305),g3(305),g4(305),g5(305),g6(305)
c
      OPEN (2,file='hess')
      OPEN (11,file='hessian.txt',status='new')
c
      WRITE (*,230)
230   FORMAT (1x,'Enter number of row of the Hessian:')
      READ (*,240) nrow
240   FORMAT (i3)
      IF (nrow .le. 305) THEN
      	DO 20 i=1,nrow
      		READ (2,200,end=100) g1(i),g2(i),g3(i),g4(i),g5(i),g6(i)
200   		FORMAT (6(5x,f15.12))
20    	CONTINUE
      	DO 30 i=1,nrow
      		WRITE (11,210) g1(i),g2(i),g3(i),g4(i),g5(i),g6(i)
210     	FORMAT (6(1x,E15.8))
30    	CONTINUE
      ELSE
      	WRITE (*,250)
250	FORMAT (1x,'number of row is too large--program stopped')
      ENDIF
100   CLOSE(2)
      STOP
      END
