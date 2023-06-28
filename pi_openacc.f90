! Code from Cray Programming Models Examples
!
! Fortran OpenACC

subroutine with_async(x, n, id)
    implicit none
    integer n, id, i
    real x(n)

    !$acc kernels copy(x) async(id)
    do i = 1, 5000
      x = x * 2 + 1
    end do
    !$acc end kernels
end subroutine


program main
    implicit none
    integer(selected_int_kind(9)),parameter :: i64=selected_int_kind(18)
    double precision, parameter :: pi=3.14159265358979323846264338327950288D0
    integer, parameter :: nmax=140000
    double precision diff,mypi,x,y
    integer i,j
    integer(kind=i64) count

    print '(a)',"PI approximation by OpenACC program"

    count=0
    !$acc parallel loop reduction(+:count)
    do i=0,nmax-1
        x=(i+0.5D0)/nmax
        do j=0,nmax-1
            y=(j+0.5D0)/nmax
            if (x*x+y*y<1d0) count=count+1
        end do
    end do
    !$acc end parallel loop

    mypi=4*dble(count)/nmax/nmax

    print "('   PI = ',f20.18/' myPI = ',f20.18/' diff = ',f10.8,'%')",pi,mypi,abs(mypi-pi)/pi*100
end program main
