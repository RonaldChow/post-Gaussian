      PROGRAM getgrad
c
      REAL*8 g1(10),g2(10),g3(10),g4(10),g5(10),g6(10)
c
      OPEN (2,file='grad')
      OPEN (11,file='gradient.txt',status='new')
c
      WRITE (*,230)
230   FORMAT (1x,'Enter number of row of the geometry:')
      READ (*,240) nrow
240   FORMAT (i2)
      IF (nrow .le. 10) THEN
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
