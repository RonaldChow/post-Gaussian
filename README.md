mvhess.f
Transform a symmetric Hessian matrix to a lower triangular matrix

Real*8 Hess(36,36)
ndim = 36
! Actually Hess should be declared as Hess(ndim,ndim)
!where ndim =3*N, in this case, N=12, so ndim=36

WRITE (6, '(5E16.8)') (Hess(i,j), j=1,i)
!Use formatted write to limit the maximum matrix element in a row to be 5
-------------------------------------------------------------------------------------------------------------------------
getmep.f
modified from fu31-092.f to attempt to obtain the data in the VMEP section in the PolyRate output file
There is also a shell script which aims to serve the same purpose but I don't know where it is....
The search subroutine is also copied from fu31-092.f
-------------------------------------------------------------------------------------------------------------------------
gethess.f , getgeom.f and getgrad.f
I forget what they do.....
