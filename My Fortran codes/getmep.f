      program GETMEP
      parameter (IU=4, ILOG=3, mxPT=2000)
      integer narg,npts,nmep,natom, num,nfreql
      double precision s(mxPT),vmep(mxPT),vag,vmu,freq(7),rmass
      character*8 csym
      character*132 cline, chknam, cvmep
      external nargs


       narg=nargs()
       if (narg .eq. 2) then
          call getarg (1, cline)
       else if (narg.eq.3) then
          call getarg (1, cline)
          call getarg (2, chknam)
          read (chknam,*) nmep
       else
	  call abort ('Usage: getmep filename [ith MEP]')
       end if
       chknam=cline

       open (ILOG, file=trim(cline),status='old')
       call search (ILOG, 'POLYRATE', cline, info)
       read (cline (index(cline,'ver')+7: index (cline,'(')),*) ver
       if (ver.ge.2008) then
          cvmep=')VMEP'
       else
          cvmep=') VMEP'
       end if
c      write (6,*) cvmep
       call search (ILOG, 'Atomic information:', cline, info)
       read (ILOG, '(A80)') cline
       read (ILOG, '(A80)') cline
       do i=1,120 
          read (ILOG, *, err=110) natom, num, csym, rmass       
       end do
  110 continue
       nfreql=int((3*natom-8)/7)
c      write (6,*) natom,nfreql,nmep

       if (nmep.eq.2) then
            call search (ILOG, trim(cvmep), cline, info)
            read (ILOG, '(A80)') cline
       end if
       call search (ILOG, trim(cvmep), cline, info)
       read (ILOG, '(A80)') cline
       do i=1,1000
          read (ILOG, '(A80)') cline
          read (cline, *,err=120,end=120) s(i), vmep(i)
          do j=1, nfreql
              read (ILOG, '(A80)') cline
          end do
        end do
  120  npts=i-1
        do i = 1, npts
           write(6,*) s(i),vmep(i)
        end do

        end

      subroutine search (IU,cstring,cline, info)
      character*(*) cstring,cline
c      rewind (IU)
      info=1
      do while (index(cline,cstring).eq.0)
         read (IU,'(a)',end=10) cline
      end do
      return

 10   info=-1
      do i=1,80
         cline(i:i)=' '
      end do
      return
      end
