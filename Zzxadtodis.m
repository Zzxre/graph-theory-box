function  G = Zzxadtodis(G)

% adjacency matrix transfer to distance matrix
idx = G == 0;
%idx = find(G == 0);
G(idx) = inf;
