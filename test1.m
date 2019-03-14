function test1(n,r,k)
g = createRandRegGraph(n, r)
%g = ZzxUBG(n,r)
g = Zzxadtodis(g);

alnodepair = nchoosek(1:n,2);
setofedg = [];
for i = 1:size(alnodepair,1)
    b = Zzxkspset(g, alnodepair(i,1), alnodepair(i,2),k);
    setofedg = [setofedg;b];
end

for j = 1 : size(setofedg,1)
    if setofedg(j,1) > setofedg(j,2)
        middle1 = setofedg(j,2);
        setofedg(j,2) = setofedg(j,1);
        setofedg(j,1) = middle1;
    end
end
setofedg   %all edges of n,r UBG each pair k-sp need 

setofedg = unique(setofedg,'rows')
n = size(setofedg,1)
% p = 0:0.05:1
% y = p.^n
% plot(p,y)