function LE = Zzxoptimalepl(n,r,k,p)
% the optimal epl of DRG(n,r)% the lower bound
%LE = SIGMA(FROM j=1 TO h-1) (n*j*(r*p)^j+Rhp^h)/(sump)
% the key is to calculate the h

h = floor( log( k*(n-1)*(r-1)+r ) / log(r) );
sump = n*((r*p)^h-r*p)/(r*p-1)+( n*k*(n-1)-n*(r^h-r)/(r-1) )*p^h; 
syms j1

y = n*j1*r^j1*(p^j1);
a = symsum(y,j1,1,h-1);
y1 = n*r^j1;
b = symsum(y1,j1,1,h-1);
R = n*k*(n-1)-b;
RHP = R*h*p^h;
LE = (a + RHP)/sump;
LE = vpa(LE);
