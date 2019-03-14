function resu = zzxrrgrelup(n,r,p)
%the upp bound of rrg'reliability
q = 1 - p;
d = r.*ones(1,n)

resu = q^r
a = []
for i = 2:n
    mi = min(r,i-1)
    a = prod(1 - q.^( d(1:mi)-1 )) * prod(1-q.^d(mi+1:(i-1) ))
    resu = resu + ( q^d(i) ) * a
end
resu = 1-resu

G = ZzxUBG(n,r)
R = Rel(G,p.*G,[1:n])