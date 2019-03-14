function Zzxgra1
r = 20
N = 2:9000
y = ceil( log(N.*(r-1)+1)./log(r) ) - 1
plot(N,y)