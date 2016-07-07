% Filename    : rectwg_tm.m
% Author      : Lnyan
% Email       : i@llonely.com
% =============================================================================
% Description :
% 矩形波导 TM 模场量公式
function [ex,ey,ez,hx,hy,hz] = rectwg_tm(x,y,z,t,m,n,a,b,omega,A,epsilon_r,mu_r)
	epsilon=8.854187817*1e-12*epsilon_r;
	mu=4*pi*1e-7*mu_r;
	k=omega*sqrt(epsilon*mu);
	kxx=m*pi/a;%kx是库函数
	ky=n*pi/b;
	kt=sqrt((kxx)^2+(ky)^2);
	kz=sqrt(k^2-kt^2);
	u=exp(1j*(omega*t-kz*z));
	Z=kz/(omega*epsilon);
	ex=-A*Z*kxx*cos(kxx*x).*sin(ky*y).*u;
	ey=-A*Z*ky*sin(kxx*x).*cos(ky*y).*u;
	ez=A/(1j*epsilon*omega)*(kxx^2+ky^2)*sin(kxx*x).*sin(ky*y).*u;
	hx=A*ky*sin(kxx*x).*cos(ky*y).*u;
	hy=-A*kxx*cos(kxx*x).*sin(ky*y).*u;
	hz=x*0;
	ex(isnan(ex))=0;
	ey(isnan(ey))=0;
	ez(isnan(ez))=0;
	hx(isnan(hx))=0;
	hy(isnan(hy))=0;
	hz(isnan(hz))=0;