function [s_100,s_001,s_000,s_110,s_111,s_011,s_101,s_010] = modeltest_1(ps,s_nr,u1,u2)
syms u1 u2 sita1 sita2 x y

%ps = (1+sqrt(3))^2
%ps = 2
%s_nr = 10
pn =[];

pn = ps./( 10.^(s_nr./10) );
% u1 = 1+sqrt(3);
% u2 = 0;
u1 =1
u2 = 1
sita1 = sqrt(pn);
sita2 = sqrt(pn);
fx =  1./(sqrt(2.*pi).*sita1).*exp(- (x-u1).^2./(2.*sita1.^2) )
fy =  1./(sqrt(2.*pi).*sita2).*exp(- (y-u2).^2./(2.*sita2.^2) )

%%%blue area
%s_bt:000

s_000 = int( int(fy,y,sqrt(3).*(-x-1)-1,sqrt(3)./3.*(-x+1)+1).*fx,x,-(2+sqrt(3)),-(1+sqrt(3)./3))+...
    int( int(fy,y,0,sqrt(3)./3.*(-x+1)+1) .*fx,-(1+sqrt(3)/3),0 );
s_000 = vpa(s_000)
%s_bi:101

s_101 = int( int(fx,x,-sqrt(3)*(y-1)+1,sqrt(3).*(y-1)-1 ).*fy, y, 1+sqrt(3)./3,2+sqrt(3) )+...
    int( int(fx,x,-y,y).*fy,2+sqrt(3),inf )
s_101 = vpa(s_101)

%%% gray area

%001
s_001 = int( int( fy,y,0,sqrt(3)./3.*(x+1)+1 ).*fx, x, 0,sqrt(3)./3+1) +...
    int ( int( fy,y,sqrt(3).*(x-1)-1,sqrt(3)./3.*(x+1)+1 ).*fx, x, sqrt(3)./3+1,2+sqrt(3));

s_001 = vpa(s_001);



%s_gr :110
s_110 = int( int( fx,x,-sqrt(3).*(-y-1)+1,sqrt(3).*(-y-1)-1 ).*fy, y, -2-sqrt(3),-1-1/sqrt(3))+...
    int( int(fx,y,-y).*fy,-inf,-2-sqrt(3) )
s_110 = vpa(s_110);

%s_r3: 010
s_010 = int( int( fy,y,sqrt(3)./3.*(x-1)-1,-sqrt(3).*(-x-1)+1 ).*fx, x, -2-sqrt(3),-1-sqrt(3)/3)+...
    int( int(fy,y,sqrt(3)/3.*x-sqrt(3)/3-1,0).*fx,-1-sqrt(3)/3,0 );
s_010 = vpa(s_010)


s_100 = int( int(fy,y,1-sqrt(3)*(-x-1),sqrt(3)*(-x-1)-1).*fx,x,-2-sqrt(3),-1-1/sqrt(3) )+...
    int( int(fy,y,-x,x).*fx,x,-inf,-2-sqrt(3) )
s_100 = vpa(s_100)

s_111 = int( int(fy,y,-sqrt(3)*(x-1)+1,sqrt(3)*(x-1)-1).*fx,1+1/sqrt(3),2+sqrt(3) )+...
    int( int(fy,y,-x,x).*fx,x,2+sqrt(3),inf )
s_111 = vpa(s_111)


s_011 = int( int(fy,y,-sqrt(3)/3.*x-1-1/sqrt(3),0).*fx,0,1+1/sqrt(3) )+...
    int( int(fy,y,-sqrt(3)/3.*x-1-sqrt(3)/3,-sqrt(3).*x+sqrt(3)+1).*fx,1+1/sqrt(3),2+sqrt(3) )
s_011 = vpa(s_011)


s_100
s_001
s_000
s_110
s_111
s_011
s_101
s_010
s_100+s_001+s_000+s_110+s_111+s_011+s_101+s_010


% %%%total area



