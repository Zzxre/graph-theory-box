function fig_kk

% hold off
% n = 50;
% r = 5;
% p = 0.9;
k = 1:6
gdbgw = [0.7817,0.9209,0.9623,0.9763,0.9824,0.9872]
gdbgo = [0.7817,0.9411,0.9729,0.9881,0.9942,0.9974]
rrgw = [0.7653,0.8884,0.9343,0.9610,0.9758,0.9850]
rrgo = [0.7653,0.9256,0.9715,0.9873,0.9932,0.9959]

plot(k,gdbgo,'r')
hold on
plot(k,gdbgw,'g')
hold on 

plot(k,rrgo,'b')
grid on
plot(k,rrgw,'y')
hold on

xlabel('k')
%ylabel('Rst')
legend('GDBG-RB','GDBG-RW','RRG-RB','RRG-RW')
title('n=50,r=5,p=0.9')

%设置中间间隔的刻度，修改0.4即可
set( gca, 'xtick', [1:1:6])

