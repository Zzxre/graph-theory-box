function d = Zzxdiam(G)
%G : the adjancy matrix of a graph
%d : the diameter of the graph

G = sparse(G);
G = graphallshortestpaths(G);
d = max( max( G ) );