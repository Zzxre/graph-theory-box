function rel_sk_main(G,s,K,C_AB,C_B,C0)
G_len = length(G)

%G_AA IS THE ADJACENCY MATRIX FROM VA TO VA
G_AA = G(1:(G_len/2),1:(G_len/2))
%G_AB is the adjacency matrix from VA to VB
G_AB = G(1:(G_len/2),(G_len/2+1:end))
%G_BB is the adjacency matrix form VB TO VB
G_BB = G((G_len/2+1:end),(G_len/2+1:end))

%G_AB_S,G_BB_S ARE SHADOWS OF G_AB,G_BB
G_AA_S = G_AA;
G_AB_S = G_AB; 
G_BB_S = G_BB;

%G_AB_IND is a column vertor denotes the places where G_AB=1(COLUMN ORDER)
G_AB_1 = [G_AB;zeros(G_len/2,G_len/2)]
G_AB_1IND = find(G_AB_1==1)

%G_AA_1 = zeros( G_len,G_len ) where except G_AA, all elements are 0
G_AA_1 = [G_AA,zeros(G_len/2,G_len/2)]
G_AA_1 = [G_AA_1;zeros(G_len/2,G_len)]

%get the edge which such that the minmize the cost function
syms a
cost = C0
G_AB_b = G_AA_1
for i = 1:length(G_AB_1IND)
    G_AB_a = G_AA_1
    a = G_AB_1IND(i)
    G_AB_a( a + G_len*(G_len/2) ) = 1
    G_AB_a = G_AB_a + G_AB_a'
    G_AB_a(G_AB_a~=0) = 1
    Cost = sk_cost( G_AB_a,C_AB,C_B )
    if Cost < cost
        cost = Cost
        G_AB_b = G_AB_a
    end
end
G_AB_b


