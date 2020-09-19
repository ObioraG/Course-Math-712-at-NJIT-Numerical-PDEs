implicit double precision (a-h,o-z)

	dimension u(0:9500),d2u(0:9500),d4u(0:9500),dex(0:9500)
	!real u(0:9500),d2u(0:9500),d4u(0:9500),dex(0:9500)

	pi=4.0d0*datan(1.0d0)

	write(6,*)' enter wavenumber and max number of grid points (nmax)'
	read(5,*)xk,nmax

	do 50 n=6,nmax

	h=2.0d0*pi/dfloat(n)
	
	do 5 m=0,n-1
	u(m)=dsin(xk*dfloat(m)*h)
	dex(m)=xk*dcos(xk*dfloat(m)*h)
5	continue

	d2u(0)=(u(1)-u(n-1))/(2.0d0*h)
	do 10 m=1,n-2
	d2u(m)=(u(m+1)-u(m-1))/(2.0d0*h)
10	d2u(n-1)=(u(0)-u(n-2))/(2.0d0*h)

	d4u(0)=(-u(2)+8.0d0*u(1)-8.0d0*u(n-1)+u(n-2))/(12.0d0*h)
	d4u(1)=(-u(3)+8.0d0*u(2)-8.0d0*u(0)+u(n-1))/(12.0d0*h)
	do 20 m=2,n-3
20	d4u(m)=(-u(m+2)+8.0d0*u(m+1)-8.0d0*u(m-1)+u(m-2))/(12.0d0*h)
	d4u(n-2)=(-u(0)+8.0d0*u(n-1)-8.0d0*u(n-3)+u(n-4))/(12.0d0*h)
	d4u(n-1)=(-u(1)+8.0d0*u(0)-8.0d0*u(n-2)+u(n-3))/(12.0d0*h)

	err2=0.0d0
	err4=0.0d0
	do 30 m=0,n-1
	err2=err2+h*(d2u(m)-dex(m))**2
	err4=err4+h*(d4u(m)-dex(m))**2
30	continue
	err2=dsqrt(err2)
	err4=dsqrt(err4)

	write(1,*)h,err2
	write(2,*)h,err4

50	continue

	stop
	end


