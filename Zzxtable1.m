function f = Zzxtable1(G,k,F)
tic;
%G :the adjancecy matrix of a graph UNDIRECTED GRAPH
%f = the number of graphs which removal k edges still connnected
% F: 1:Undirected graph  0:gdbg
n = size(G,1);
G1 = zeros(n,n);

if F == 1
    % extract the upp triangle matrix of G
    for i1 = 1:n
        G1(i1,i1:n) = G(i1,i1:n);
    end
    G = G1;
    ind = find( G == 1 );
    m = size(ind,1); % the number of total edges
    a = nchoosek( 1:m,k );
    f = [0];
    G2=G;
    for i = 1:size(a,1)
        b = ind(a(i,:));
        G(b)=0;
        G = G+G';
        %ind1 = find(G == 2);
        %     G(ind1) = 1
        a1 = Zzxisconnected(G);
        if a1 == 1 
           f = f + 1;
        else
        end
        G = G2;
    end
else 
end



if F == 0
   ind = find( G == 1 );
   m = size(ind,1); % the number of total edges
   a = nchoosek( 1:m,(m-k) );
   f = [0];
   G2 = G1;
   for i = 1:size(a,1)
       b = ind(a(i,:));
       G1( b ) = 1;
       a1 = Zzxisconnected(G1);
       if a1 == 1 
           f = f + 1;
       else
       G1 = G2;
       end
   end
end
toc

        
        