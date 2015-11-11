       Program mvhess
       INTEGER i,j,ndim
       REAL*8 Hess(36,36)       
       ndim = 36
       OPEN(20, file='hess.txt')
       READ(20, *) ((Hess(i,j),j=1,i), i=1,ndim)
       close(20)
       DO i=1, ndim
          WRITE (6, '(5E16.8)') (Hess(i,j), j=1,i)
       END DO
       END