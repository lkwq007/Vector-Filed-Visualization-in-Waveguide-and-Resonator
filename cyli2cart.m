% Filename    : cyli2cart.m
% Author      : Lnyan
% Email       : i@llonely.com
% =============================================================================
% Description :
% 柱坐标转换
function [x y ex ey hx hy]=cyli2cart(phi,rho,ephi,erho,hphi,hrho)
	[x y]=pol2cart(phi,rho);
	ex=cos(phi).*erho-sin(phi).*ephi;
	ey=sin(phi).*erho+cos(phi).*ephi;
	hx=cos(phi).*hrho-sin(phi).*hphi;
	hy=sin(phi).*hrho+cos(phi).*hphi;