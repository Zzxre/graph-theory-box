function fig_k
%%%n = 50;r = 5;p = 0.9;
%k = 1:10
clc

k = 1:10

gdbg = [2.3139, 2.6261, 2.8937, 3.0648, 3.2379, 3.3570, 3.4438, 3.5109, 3.5648, 3.6113]

rrg = [2.4685, 2.8312, 3.0809, 3.2715, 3.4112, 3.5210, 3.6143, 3.7003, 3.7825, 3.8633]
optimal = [2.2422, 2.6064, 2.7342, 2.9835, 3.1704, 3.2992, 3.3933, 3.4652, 3.5219, 3.5677]

plot(k,gdbg,'b')
hold on 
plot(k,rrg,'g')
hold on 
plot(k, optimal,'r')
grid on
legend('GDBG','RRG','Optimal')
xlabel('k')
ylabel('EPL')
title('n = 50, r = 5, p = 0.9')
