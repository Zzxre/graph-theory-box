function G = ZzxUBG(n,r)
% n :the numbers of nodes,r : the degree of each nodes
% G :the adjacency matrix of the Undirectd De Druijn Graph
G = ZzxGDBG(n,(r/2));
%delete self loop
for i = 1:n
    G(i,i) = 0;
end

%delete parallel edges
G = G + G'; % G = The number of links
idx = find(G==2); %find all 2
G(idx) = 1; % set 1 to these indexes


