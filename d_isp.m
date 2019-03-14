E=2;
I=3;
kr=0.5;
kh=0.8;
l=4;
A=2;

B=3;
syms w r1 r2 r3 r4 C;
C = -w^2;
r1=sqrt(-B - sqrt(B^2-4*A*C) );
r2=-sqrt(-B - sqrt(B^2-4*A*C) );
r3 = sqrt(-B + sqrt(B^2-4*A*C) );
r4 = -sqrt(-B + sqrt(B^2-4*A*C) );
%W = @(x) x^2-5*x
W=[r1^2 r2^2 r3^2 r4^2;r1^3 r2^3 r3^3 r4^3;(r1^2-kr/(E*I))*exp(r1*l) (r2^2-kr/(E*I))*exp(r2*l) (r3^2-kr/(E*I))*exp(r3*l) (r4^2-kr/(E*I))*exp(r4*l);(r1^3+kh/(E*I))*exp(r1*l) (r2^3+kh/(E*I))*exp(r2*l) (r3^3+kh/(E*I))*exp(r3*l) (r4^3+kh/(E*I))*exp(r4*l)];
y = det(W);
%[w]= vpasolve([y==0])

y
%muller(myf,[0.0,0.1,0.2],[10000],[1e-3],[],'both')
%[res,fval,it] = muller (W,[0,0.1,0.2],1000)