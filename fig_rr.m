function fig_rr

% hold off
% n = 50;
% k = 3;
% p = 0.9;

r = 3:10
gdbgw = [0.9189,0.9348,0.9623,0.9753,...
    0.9670,0.9549,0.9599,0.9813]

gdbgo = [0.9458,0.9705,0.9729,0.9854,...
    0.9871,0.9884,0.9898,0.9913]

rrgw = [0.8652,0.9200,0.9389,0.9584,...
    0.9600,0.9556,0.9591,0.9639 ]

rrgo = [0.8913,0.9530,0.9725,0.9796,...
    0.9850,0.9872,0.9890,0.9902]

plot(r,gdbgo,'r')
hold on
plot(r,gdbgw,'g')
hold on 

plot(r,rrgo,'b')
grid on
plot(r,rrgw,'y')
hold on

xlabel('r')
%ylabel('Rst')
legend('GDBG-RB','GDBG-RW','RRG-RB','RRG-RW')
title('n=50,k=3,p=0.9')

%设置中间间隔的刻度，修改0.4即可
%set( gca, 'xtick', [1:1:6])

