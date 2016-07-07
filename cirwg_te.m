% Filename    : cirwg_te.m
% Author      : Lnyan
% Email       : i@llonely.com
% =============================================================================
% Description :
% 原型波导
function [ephi,erho,ez,hphi,hrho,hz]=cirwg_te(phi,rho,z,t,m,n,a,omega,A,epsilon_r,mu_r)
	epsilon=8.854187817*1e-12*epsilon_r;
	mu=4*pi*1e-7*mu_r;
	k=omega*sqrt(epsilon*mu);
	dJzero=zerobess('DJ',m,n);
	umn_dot=dJzero(n);
	kt=umn_dot/a;
	kz=sqrt(k^2-kt^2);
	J=besselj(m,kt*rho);
	dJ=(besselj(m-1,kt*rho)-besselj(m+1,kt*rho))/2;
	u=exp(1j*(omega*t-kz*z))
	erho=1j*omega*mu*m/(kt^2)*A/rho.*J.*sin(m*phi).*u;
	ephi=1j*omega*mu*a/umn_dot*A*dJ.*cos(m*phi).*u;
	ez=0*phi;
	hrho=-1j*kz/kt*A*dJ.*cos(m*phi).*u;
	hphi=1j*kz*m/(kt^2)*A/rho.*J.*sin(m*phi).*u;
	hz=A*J.*cos(m*phi).*u;
	erho(isnan(erho))=0;
	ephi(isnan(ephi))=0;
	ez(isnan(ez))=0;
	hrho(isnan(hrho))=0;
	hphi(isnan(hphi))=0;
	hz(isnan(hz))=0;