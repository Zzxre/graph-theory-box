function fig_nn

hold off
r = 5;
k = 3;
p = 0.9;

n = 20:70
gdbgw = [0.9746,0.9771,0.9749,0.9734,0.9602,0.9703,...
    0.9688,0.9674,0.9664,0.9644,0.9597,0.9617,...
    0.9636,0.9593,0.9540,0.9515,0.9407,0.9471,...
    0.9445,0.9461,0.9402,0.9402,0.9409,0.9374,...
    0.9369,0.9411,0.9356,0.9346,0.9130,0.9347,...
    0.9348,0.9412,0.9352,0.9351,0.9405,0.9363,...
    0.9361,0.9412,0.9371,0.9370,0.9303,0.9381,...
    0.9382,0.9449,0.9396,0.9407,0.9437,0.9412,...
    0.9422,0.9466,0.9428]
gdbgo = [0.9813,0.9825,0.9807,0.9804,0.9701,0.9792,...
    0.9788,0.9792,0.9774,0.9770,0.9742,0.9752,...
    0.9702,0.9749,0.9739,0.9738,0.9719,0.9740,...
    0.9740,0.9746,0.9737,0.9740,0.9738,0.9736,...
    0.9728,0.9729,0.9719,0.9711,0.9601,0.9706,...
    0.9705,0.9709,0.9707,0.9707,0.9709,0.9707,...
    0.9705,0.9711,0.9707,0.9707,0.9690,0.9707,...
    0.9708,0.9713,0.9709,0.9703,0.9698,0.9693,...
    0.9688,0.9689,0.9677]
rrgw = [0.9544,0.9630,0.9378,0.9501,0.9571,0.9446,...
    0.9515,0.9404,0.9394,0.9351,0.9383,0.9270,...
    0.9435,0.9403,0.9366,0.9428,0.9355,0.9335,...
    0.9348,0.9374,0.9334,0.9334,0.9466,0.9311,...
    0.9241,0.9046,0.9287,0.9362,0.9209,0.9236,...
    0.9305,0.9217,0.9221,0.9161,0.9142,0.9193,...
    0.9168,0.9139,0.9191,0.9206,0.9126,0.9037,...
    0.9146,0.9163,0.9153,0.9160,0.9094,0.9098,...
    0.9124,0.9147,0.9158]
rrgo = [0.9765,0.9784,0.9680,0.9749,0.9755,0.9719,...
    0.9754,0.9708,0.9681,0.9661,0.9679,0.9587,...
    0.9685,0.9670,0.9647,0.9669,0.9634,0.9595,...
    0.9611,0.9626,0.9605,0.9609,0.9662,0.9584,...
    0.9566,0.9440,0.9585,0.9593,0.9539,0.9543,...
    0.9575,0.9542,0.9530,0.9504,0.9488,0.9516,...
    0.9511,0.9488,0.9509,0.9520,0.9471,0.9447,...
    0.9489,0.9492,0.9479,0.9490,0.9450,0.9464,...
    0.9473,0.9482,0.9487]

plot(n,gdbgo,'r')
hold on
plot(n,gdbgw,'g')
hold on 

plot(n,rrgo,'b')
grid on
plot(n,rrgw,'y')
hold on

xlabel('n')
%ylabel('Rst')
legend('GDBG-RB','GDBG-RW','RRG-RB','RRG-RW')
title('r = 5,k = 3,p = 0.9')

%设置中间间隔的刻度，修改0.4即可
%set( gca, 'xtick', [1:1:6])

