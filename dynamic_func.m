% Filename    : visualization_func.m
% Author      : Lnyan
% Email       : i@llonely.com
% =============================================================================
% Description :
% 可视化函数
function [az el]=dynamic_func(types,content,mode_list,a,b,l,steps,m,n,p,f,A,epsilon_r,mu_r,az,el,time)
	timelist=0:1/f/30:1/f;
	for i=1:30
		switch types
		case 'rectwg'
			xs=0:a/steps(1):a;
			ys=0:b/steps(2):b;
			zs=0:l/steps(3):l;
			[x y z]=meshgrid(xs,ys,zs);
			[ex ey ez hx hy hz jx jy jz]=rectwg_gather(mode_list,x,y,z,timelist(i),f,a,b,A,epsilon_r,mu_r);
			if strcmp(content,'js')
				jx=jx.*(x==a);
				jy=jy.*(y==b);
				jz=jz.*(z==l);
			end
		case 'cirwg'
			phis=0:pi/steps(1):2*pi;
			rhos=0:a/steps(2):a;
			zs=0:l/steps(3):l;
			[phi rho z]=meshgrid(phis,rhos,zs);
			[ephi,erho,ez,hphi,hrho,hz,jphi,jrho,jz]=cirwg_gather(mode_list,phi,rho,z,timelist(i),f,a,A,epsilon_r,mu_r);
			[x,y,jx,jy]=cyli2cart(phi,rho,jphi,jrho,jphi,jrho);
			[x,y,ex,ey,hx,hy]=cyli2cart(phi,rho,ephi,erho,hphi,hrho);
		otherwise
			error('unknown type');
	    end
		switch content
		case 'e'
			quiver3(z,x,y,real(ez),real(ex),real(ey),'b');
		case 'h'
			quiver3(z,x,y,real(hz),real(hx),real(hy),'r');
		case 'eh'
			quiver3(z,x,y,real(ez),real(ex),real(ey),'b');
			hold on;
			quiver3(z,x,y,real(hz),real(hx),real(hy),'r:');
		otherwise
			quiver3(z,x,y,real(jz),real(jx),real(jy));
	    end
	    hold off;
	    view(az,el);
	    box on;
    	set(gcf,'position',[50 40 850 640]);
    	axis([-0.1*l,1.1*l,-0.1*a,1.1*a,-0.1*b,1.1*b]);
	    F(i)=getframe(gcf);
	end
	movie(gcf,F,time);