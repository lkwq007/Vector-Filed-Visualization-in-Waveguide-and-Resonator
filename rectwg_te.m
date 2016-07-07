% Filename    : rectwg_te.m
% Author      : Lnyan
% Email       : i@llonely.com
% =============================================================================
% Description :
% 矩形波导 TE 模场量公式
function [ex,ey,ez,hx,hy,hz] = rectwg_te(x,y,z,t,m,n,a,b,omega,A,epsilon_r,mu_r)
	epsilon=8.854187817*1e-12*epsilon_r;
	mu=4*pi*1e-7*mu_r;
	k=omega*sqrt(epsilon*mu);
	%m*pi/a=m*pi/a;%kx是库函数
	%n*pi/b=n*pi/b;
	kt=sqrt((m*pi/a)^2+(n*pi/b)^2);
	kz=sqrt(k^2-kt^2);
	u=exp(1j*(omega*t-kz*z));
	Y=kz/(omega*mu);
	ex=A*n*pi/b*cos(m*pi/a*x).*sin(n*pi/b*y).*u;
	ey=-A*m*pi/a*sin(m*pi/a*x).*cos(n*pi/b*y).*u;
	ez=x*0;
	hx=A*Y*m*pi/a*sin(m*pi/a*x).*cos(n*pi/b*y).*u;
	hy=A*Y*n*pi/b*cos(m*pi/a*x).*sin(n*pi/b*y).*u;
	hz=-1j*A/(omega*mu)*((m*pi/a)^2+(n*pi/b)^2)*cos(m*pi/a*x).*cos(n*pi/b*y).*u;
	ex(isnan(ex))=0;
	ey(isnan(ey))=0;
	ez(isnan(ez))=0;
	hx(isnan(hx))=0;
	hy(isnan(hy))=0;
	hz(isnan(hz))=0;