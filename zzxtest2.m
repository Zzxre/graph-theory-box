function zzxtest2(n,r)
g = createRandRegGraph(n, r);
a = sparse(g);
g = graphallshortestpaths(a);
max(max(g))


a = ZzxGDBG(n,r );
a = sparse(a);
g = graphallshortestpaths(a);
max(max(g))
