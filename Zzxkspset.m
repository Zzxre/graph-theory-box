function kspedset = Zzxkspset(G ,S, T, K)
%G:the distance matrix of the graph,S: source number,T: terminal number,K:k-sp's number
%kspedset = k-sp edges set. 1 row, n column
a = kShortestPath(G, S, T, K);  %get the path as cell

a = cell2mat(a);   %turn the cell to array

idx1 = find( a == S);
idx2 = find( a == T);
% if length(idx1) < K
%     fprintf('there is no ksp!')
%     return
% end
n = size(idx1,2);
kspedset = [];
for i = 1:n
    b1 = a( idx1(i): idx2(i));
    nsizeb1 = size(b1,2);
    for j = 1:( nsizeb1-1)
        kspedset = [ kspedset;b1(1,j),b1(1,j+1)];
    end
end
