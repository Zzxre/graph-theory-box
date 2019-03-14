function Cost = sk_cost(G,C_AB,C_B)
%G:GRAPH C_AB:A->B COST MATRIX C_B:VB COST ROW VERTOR
G_len = length(G)

%G_AB IS THE ADJACENCY MATRIX FROM VA TO VB
G_AB = G(1:(G_len/2),(G_len/2+1:end))
%G_BAB is the adjacency matrix from VB to VA,VB
G_BAB = G((G_len/2+1:end),(1:end))
G_BABIND = zeros(G_len/2,1)
for i = 1:G_len/2
    for j = 1:G_len
        if G_BAB(i,j) == 1
            G_BABIND(i,1) = 1
        end
    end
end

Cost = sum(sum(G_AB.*C_AB))
Cost = Cost + sum( sum(C_B*G_BABIND) )
