program test_gcpm
    use ISO_FORTRAN_ENV
    implicit none

    real*4 outn(4),den(201,201),pp_profile
    real*4 r,al,alatr,a_mlt,akp,ne_inner_ps
    integer*4 itime(2), ihr, imin, isec
    character name*40
    integer*4 z_mlt, mlt_n, mlt_p, i, j
    real*4 x,z
    real*4 babs, dpl
    
! default params
    itime(1)=2002001
    ihr=12
    imin=0
    isec=0
    itime(2)=(ihr*3600 + imin*60 + isec) * 1000
    akp=1.0

    print *, "GCPM Tester!"

    
    r=1.1
    alatr=0*3.14159/(180.0)
    a_mlt=0

    ! print *,'igrf test:'

    
    ! call igrf_sub(alatr, a_mlt, 2002.5, r, 2.5, 1, dpl, babs)



    print *,'pre-call:'
    call gcpm_v24(itime, r, a_mlt, alatr, akp, outn)
    print *,"outn", outn

    ! do z_mlt= 0,0
    !     ! print *,'z_mlt: ',z_mlt
    !     mlt_n=z_mlt
    !     mlt_p=z_mlt+12.0
    !     if (mlt_p.ge.24.0) mlt_p=mlt_p-24.0
    
    !     do i=0,200
    !         x=float(i-100)/10.0
    !         a_mlt=mlt_n
    !         if (x .ge. 0.0) a_mlt=mlt_p
    !         ! print *,'x,zmlt: ',x,z_mlt

    !         do j=0,200
    !             z=float(j-100)/10.0
    !             r=sqrt(x*x+z*z)
    !             den(i+1,j+1)=0.0

    !             if (r.gt.1.0) then
    !                 alatr=atan2(z,abs(x))
    !                 print *,'itime', itime, 'r', r, 'mlt',a_mlt,'lat',(180./3.14159)*alatr
                    
    !                 ! call gcpm_v24(itime,r,a_mlt,alatr,akp,outn)
    !                 ! den(i+1,j+1)=outn(1)
    !             endif
    !         enddo
    !     enddo
    ! enddo





end program test_gcpm
