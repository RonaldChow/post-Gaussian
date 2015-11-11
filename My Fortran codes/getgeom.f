      PROGRAM getgeom
c
      REAL*8 g1(10,6)
c
      OPEN (2,file='geom')
      OPEN (11,file='geometry.txt',status='new')
c
c      WRITE (*,230)
c 230   FORMAT (1x,'Enter number of geometry:')
c      READ (*,240) ngeom
c 240   FORMAT (i2)
c      IF (ngeom .le. 60) THEN
      	DO 20 i=1,10
           DO 40 j=1,6
      		READ (2,200,end=100) g1(i,j)
200   		FORMAT (6(5x,f15.12))
40	   CONTINUE
20    	CONTINUE
      	DO 30 i=1,10
      	   DO 50 j=1,6
      		WRITE (11,210) g1(i,j)
210     	FORMAT (6(1x,E15.8))
50         CONTINUE
30    	CONTINUE
c      ELSE
c      	WRITE (*,250)
c 250	FORMAT (1x,'number of geometry is too large--program stopped')
c      ENDIF
100   CLOSE(2)
      STOP
      END
