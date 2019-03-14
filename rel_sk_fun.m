function Rel = rel_sk_fun(G,s,K)
%calculate the s,k reliability of functional part
%G is the adjacent matrix and s is the contol center k is the set of remote
%dive; Rel = s,k reliability

%%%s, K-reliability R of G
% R ← 0, S←?, r←|K|+3;
% Find all s, K-connected subgroups with number r, and store them into set S;
% For each subgraph belonging to S, if it is not a functioning part, delete it;
% Sr ← |S|, R ← R +(1-q?)(|K|+1)? Sr? pr-|K|-1? qn-r;
% r ← r + 1, S ← ?, go to Step 1.%%%

%先判断G是不是联通的
G_connect = Zzxisconnected(G)
if G_connect == 0 
    fprintf("The graph is not connected!")
    return
end
Rel = 0
S = 0
%r_1 = length(K) + 3 % K is row vector
n = length(G)
n_1 = [1:n]
n_1( n_1==s ) = []
for i_1 = 1:length(K)
    K_i = K(i_1)
    n_1(n_1 == (K_i)) = []
end

for r_1 = 2:n
    a_1 = nchoosek(n_1,r_1)
    n_1 = size(a_1,1)
    s_1 = ones(n_1,1).*s
    K_1 = ones(n_1,length(K)).*K
    b_1 = [a_1,s_1]
    b_1 = [b_1,K_1]
    if b_1 is functional
        s = s+1
         R ← R +(1-q?)(|K|+1)? Sr? pr-|K|-1? qn-r;
          r ← r + 1, S ← ?, go to Step 1
        
    

    

