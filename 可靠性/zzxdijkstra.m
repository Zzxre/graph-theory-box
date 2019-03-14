function [pl,path] = zzxdijkstra(D,sp,ep)  
% D the matrix of weighted distance; sp: start point;  ep: end point
D = [0 ,6  ,3  ,1  ,inf,inf,inf,inf,inf;
    inf,0  ,inf,inf,1  ,inf,inf,inf,inf;
    inf,2  ,0  ,2  ,inf,inf,inf,inf,inf;
    inf,inf,inf,0  ,inf,10 ,inf,inf,inf;
    inf,inf,inf,6  ,0  ,4  ,3  ,6  ,inf;
    inf,inf,inf,inf,10 ,0  ,2  ,inf,inf;
    inf,inf,inf,inf,inf,inf,0  ,4  ,inf;
    inf,inf,inf,inf,inf,inf,inf,0  ,inf;
    inf,inf,inf,inf,2  ,inf,inf,3  ,0  ;]
sp = 1; ep = 9;
p = inf(1,size(D,1))%distance from sp to ep
spd = 0;
i=1
if sp == ep
    return
else
    for i = 1:size(D,1)
   [d,index] = min( D(sp , :) )
   p(index) = d
   D(:,index) = []
   i = i+1
    end
end
