% Filename    : cirwg_tm.m
% Author      : Lnyan
% Email       : i@llonely.com
% =============================================================================
% Description :
% 圆波导 TM 模场量分布
function [ephi,erho,ez,hphi,hrho,hz]=cirwg_tm(phi,rho,z,t,m,n,a,omega,A,epsilon_r,mu_r)
	epsilon=8.854187817*1e-12*epsilon_r;
	mu=4*pi*1e-7*mu_r;
	k=omega*sqrt(epsilon*mu);
	Jzero=zerobess('J',m,n);
	umn=Jzero(n);
	kt=umn/a;
	kz=sqrt(k^2-kt^2);
	J=besselj(m,kt*rho);
	dJ=(besselj(m-1,kt*rho)-besselj(m+1,kt*rho))/2;
	u=exp(1j*(omega*t-kz*z))
	erho=-1j*kz/kt*A*dJ.*cos(m*phi).*u;
	ephi=1j*kz*m/(kt^2)*A*J.*sin(m*phi).*u;
	ez=A*J.*cos(m*phi).*u;
	hrho=-1j*omega*epsilon*m/(kt^2)*A/rho.*J.*sin(m*phi).*u;
	hphi=-1j*omega*epsilon/kt*A*dJ.*cos(m*phi).*u;
	hz=0*phi;
	erho(isnan(erho))=0;
	ephi(isnan(ephi))=0;
	ez(isnan(ez))=0;
	hrho(isnan(hrho))=0;
	hphi(isnan(hphi))=0;
	hz(isnan(hz))=0;