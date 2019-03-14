function [epl,kspld] = Zzxepl(G,k,p)
%epl = expected path length,G:adjancecy matrix, k = k-shortest paths,

%p:edge probability
tic
G = Zzxadtodis(G);   % adjancecy matrix to distance matrix
G_n = size(G,1);

a = nchoosek( 1:G_n,2 );
a1 = a(:,[2,1]);
b = [a;a1];  %all combination of nodes

b_n = size(b,1);
kspld = [];  % the sequence of the length of ksp;  row vertor
for i = 1:b_n
    b1 = b(i,1);
    b2 = b(i,2);
    kspset = kShortestPath(G,b1,b2,k);
    kspset = cell2mat(kspset);
    idx1 = find (kspset == b1);  %row vector of the location of start point b1
    idx2 = find (kspset == b2);  %the location of end point b2
    kspld = [kspld,idx2-idx1];
end

%epl = sum(li*pi) li=nk(n-1)
kspld_n = size(kspld,2);
if kspld_n ~= G_n*k*(G_n-1)
    fprintf('some nodes combination do not have k paths!/n')
    return
end


p_i = [];   %column vector
psum = 0;  %the sum of pi
for j = 1:kspld_n
    kspld_j = kspld(1,j);
    p1 = p^kspld_j;
    p_i = [p_i;p1];
    psum = psum + p1;
end

epl = kspld*p_i/psum;
toc