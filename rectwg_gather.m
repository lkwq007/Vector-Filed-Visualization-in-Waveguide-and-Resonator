% Filename    : rectwg_gather.m
% Author      : Lnyan
% Email       : i@llonely.com
% =============================================================================
% Description :
% 所有模式的场量叠加
function [ex,ey,ez,hx,hy,hz,jx,jy,jz]=rectwg_gather(mode_list,x,y,z,t,f,a,b,A,epsilon_r,mu_r)
	m=mode_list{1}(1);
	n=mode_list{1}(2);
	mode_type=mode_list{1}(3);
	omega=f*2*pi;
	if ~mode_type
		[ex,ey,ez,hx,hy,hz]=rectwg_te(x,y,z,t,m,n,a,b,omega,A,epsilon_r,mu_r);
	else
		[ex,ey,ez,hx,hy,hz]=rectwg_tm(x,y,z,t,m,n,a,b,omega,A,epsilon_r,mu_r);
	end
	for i=2:length(mode_list)
		m=mode_list{i}(1);
		n=mode_list{i}(2);
		mode_type=mode_list{i}(3);
		if ~mode_type
			[ex_temp,ey_temp,ez_temp,hx_temp,hy_temp,hz_temp]=rectwg_te(x,y,z,t,m,n,a,b,omega,A,epsilon_r,mu_r);
		else
			[ex_temp,ey_temp,ez_temp,hx_temp,hy_temp,hz_temp]=rectwg_tm(x,y,z,t,m,n,a,b,omega,A,epsilon_r,mu_r);
		end
		ex=ex+ex_temp;
		ey=ey+ey_temp;
		ez=ez+ez_temp;
		hx=hx+hx_temp;
		hy=hy+hy_temp;
		hz=hz+hz_temp;
	end
	jx=(y==0).*hz-(y==b).*hz;
	jy=(x==0).*(-hz)+(x==a).*hz;
	jz=(x==0).*(hy)-(x==a).*hy-(y==0).*hx+(y==b).*hx;