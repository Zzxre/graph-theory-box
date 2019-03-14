function P = Zzxnodestopaths(G,N)
%G is the adjancecy matrix of the graph
%N is a cell contain s,t paths
%P is a cell contain s,t paths'number

n = size(G,1);
n_m = size(N,1);  %N is n_m rows
n_m1 = size(N,3);

Pathnum = cell(n_m,1,n_m1);
for i = 1:n_m1
    for i1 = 1:n_m
        a = N(i1,:,i);
        a = cell2mat(a);
        a_n = size(a,2);
        for j = 1:(a_n-1)
            path_1(1,j) = (a(1,j)-1) * n + a(1,j+1);
        end
        path_2 = mat2cell( path_1,1,(a_n-1) );
        path_1 = [];
        pathnum1(i1,1)= path_2;
    end
    Pathnum(:,:,i) = pathnum1;
end 
    
