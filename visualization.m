% Filename    : visualization.m
% Author      : Lnyan
% Email       : i@llonely.com
% =============================================================================
% Description :
% 
clc;
clear all;
close all;
m=1;
n=0;
a=0.025;
b=0.025;
f=20.84*1e9;
l=3e8/f*2;
omega=2*pi*f;
xs=0:a/6:a;
ys=0:b/6:b;
zs=0:l/6:l;
cxs=0:a/10:a;
cys=0:b/10:b;
czs=0:l/10:l;
A=1;
[x y z]=meshgrid(xs,ys,zs);
%[x, y, z] = meshgrid(0:0.005:0.025);
%[x, y, z] = meshgrid(0:0.005:0.025);
[cx,cy,cz] = meshgrid(cxs,cys,czs);
timelist=0:1/f/30:1/f;
modes={[1,0,0]};
% for i=1:30
% 	%[ex ey ez hx hy hz]=rect_te(x,y,z,timelist(i),m,n,a,b,omega,A,1,1);
%     [ex ey ez hx hy hz]=mode_gather(modes,x,y,z,timelist(i),f,a,b,A,1,1);
% 	quiver3(z,x,y,real(ez),real(ex),real(ey));
%     %coneplot(x,y,z,ex,ey,ez,cx,cy,cz,'quiver');
% 	hold on;
% 	quiver3(z,x,y,real(hz),real(hx),real(hy),'r:');
%     set(gcf, 'position', [0 0 800 600]);
%     %coneplot(x,y,z,hx,hy,hz,cx,cy,cz,'quiver')
% 	hold off;
%     box on;
%     axis square;
%     view(0,90);
% 	F(i)=getframe(gcf);
% 	clf;
% end
% movie(gcf,F,10);
p=1;
for i=1:30
	[ex ey ez hx hy hz]=rectwg_te(x,y,z,timelist(i),m,n,a,b,omega,A,1,1);
    %[ex ey ez hx hy hz]=mode_gather(modes,x,y,z,timelist(i),f,a,b,A,1,1);
     jx=(y==0).*hz-(y==b).*hz;
	 jy=(x==0).*(-hz)+(x==a).*hz;
	jz=(x==0).*(hy)-(x==a).*hy-(y==0).*hx+(y==b).*hx;
	%quiver3(z,x,y,ez,ex,ey);
    %[ex ey ez hx hy hz]=rectres_te(x,y,z,m,n,p,a,b,l,omega,1,1,1);
	quiver3(z,x,y,(jz),(jx),(jy));
    %coneplot(x,y,z,ex,ey,ez,cx,cy,cz,'quiver');
	hold on;
	%quiver3(z,x,y,(hz),(hx),(hy),'r:');
    set(gcf, 'position', [40 40 840 640]);
    %coneplot(x,y,z,hx,hy,hz,cx,cy,cz,'quiver')
	hold off;
    box on;
    axis([-0.1*a,1.1*a,-0.1*b,1.1*b,-0.1*l,1.1*l]);
    %view(145,45);
	F(i)=getframe(gcf);
    disp(View);
	%clf;
end
movie(gcf,F,10);

