function G = ZzxAGDBG(n,r)
% n:the number of nodes,r: the degree of a node
% G:the adjacency matrix of the Advanced GDBG
G = zeros(n,n);
for i = 1:n
    i1 = i - 1;
    j = mod( i1*r + (1:r) , n);
    G(i,j+1) = 1;
end
