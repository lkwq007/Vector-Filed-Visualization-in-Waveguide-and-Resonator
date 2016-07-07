% Filename    : cirwg_gather.m
% Author      : Lnyan
% Email       : i@llonely.com
% =============================================================================
% Description :
% 圆波导场量叠加
function [ephi,erho,ez,hphi,hrho,hz,jphi,jrho,jz]=rectwg_gather(mode_list,phi,rho,z,t,f,a,A,epsilon_r,mu_r)
	m=mode_list{1}(1);
	n=mode_list{1}(2);
	mode_type=mode_list{1}(3);
	omega=f*2*pi;
	if ~mode_type
		[ephi,erho,ez,hphi,hrho,hz]=cirwg_te(phi,rho,z,t,m,n,a,omega,A,epsilon_r,mu_r);
	else
		[ephi,erho,ez,hphi,hrho,hz]=cirwg_tm(phi,rho,z,t,m,n,a,omega,A,epsilon_r,mu_r);
	end
	for i=2:length(mode_list)
		m=mode_list{i}(1);
		n=mode_list{i}(2);
		mode_type=mode_list{i}(3);
		if ~mode_type
			[ephi_temp,erho_temp,ez_temp,hphi_temp,hrho_temp,hz_temp]=cirwg_te(phi,rho,z,t,m,n,a,omega,A,epsilon_r,mu_r);
		else
			[ephi_temp,erho_temp,ez_temp,hphi_temp,hrho_temp,hz_temp]=cirwg_tm(phi,rho,z,t,m,n,a,omega,A,epsilon_r,mu_r);
		end
		ephi=ephi+ephi_temp;
		erho=erho+erho_temp;
		ez=ez+ez_temp;
		hphi=hphi+hphi_temp;
		hrho=hrho+hrho_temp;
		hz=hz+hz_temp;
	end
	jphi=hz.*(rho==a);
	jz=-hphi.*(rho==a);
	jrho=rho*0;
