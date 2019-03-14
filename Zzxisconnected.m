function  a = Zzxisconnected(G)
%G:the adjancecy matrix of a graph
%a: connected return 1,else return 0
a = [];
d = Zzxdiam(G);
if d == Inf
    a = 0;
else
    a = 1;
end