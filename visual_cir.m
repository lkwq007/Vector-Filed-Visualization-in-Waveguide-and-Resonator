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
n=1;
a=0.025;
b=0.025;
f=20.84*1e9;
l=3e8/f*2;
omega=2*pi*f;
rs=0:a/6:a;
ps=0:pi/6:2*pi;
zs=0:l/6:l;
cxs=0:a/10:a;
cys=0:b/10:b;
czs=0:l/10:l;
A=1;
[p r z]=meshgrid(ps,rs,zs);
%[x, y, z] = meshgrid(0:0.005:0.025);
%[x, y, z] = meshgrid(0:0.005:0.025);
[cx,cy,cz] = meshgrid(cxs,cys,czs);
timelist=0:1/f/30:1/f;
modes={[1,1,0]};
for i=1:1
	%[ex ey ez hx hy hz]=rect_te(x,y,z,timelist(i),m,n,a,b,omega,A,1,1);
	[ep er ez hp hr hz]=cirwg_te(p,r,z,timelist(i),m,1,a,omega,1,1,1);
    %[ex ey ez hx hy hz]=mode_gather(modes,x,y,z,timelist(i),f,a,b,A,1,1);
    [x,y,ex,ey,hx,hy]=cyli2cart(p,r,ep,er,hp,hr);
	quiver3(z,x,y,real(ez),real(ex),real(ey));
    %coneplot(x,y,z,ex,ey,ez,cx,cy,cz,'quiver');
	hold on;
	quiver3(z,x,y,real(hz),real(hx),real(hy),'r:');
    set(gcf, 'position', [0 0 800 600]);
    %coneplot(x,y,z,hx,hy,hz,cx,cy,cz,'quiver')
	hold off;
    box on;
    axis square;
	%F(i)=getframe(gcf);
	%clf;
end
%movie(gcf,F,10);