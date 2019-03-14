function D = Zzxmetricdiam(G,p)
%G: adjancecy matrix; p:edge functional probability
tic;
D = 0;
if G == G' & G(1,1)==0
    %G is udirected graph
    ind = find(G == 1);
    E = size(ind,1)/2; % THE number of edges
    e = round(E*p);
    b = 1;
else
    %G is gdbg
    ind = find(G == 1);
    E = size(ind,1); % the number of edges  
    e = round(E*p);
    b = 0;
end 

n = size(G,1);
if e < n-1
    return
else
end

a1 = nchoosek( E ,e );
a = zeros(a1,e);
a = nchoosek(1:E ,e);
na = size(a,1);

d = zeros(1,na);
G2 = zeros(n,n);
G3 = G2;
if b == 1
    %G is rrg
    G1 = zeros(n,n);
    for i1 = 1:n
        G1(i1,i1:n) = G(i1,i1:n);%extract upper triangle matrix of G
    end
    ind1 = find(G1==1);
    
    for i = 1:size(a,1)
        G2(ind1(a(i,:)))=1;
        G2 = G2+G2';
        d(i) = Zzxdiam(G2);% the diameter of G2
        G2 = G3;
    end
%     ind3=find(d == inf)
%     d(ind3)=0
%     max( max(d) )
%     c = mean(d)
    d = d.^(-1);
    size(d)
    D = mean(d);
    
else
    %G is gebg
    ind2 = find(G == 1);
    for i = 1:na
        G2( ind2( a(i,:) ) ) = 1;
        d(i) = Zzxdiam(G2);
        G2 = G3;
        fprintf('progress: edges=%d/%d\n', i, na);    
    end
    ind3=find(d == inf)
    d(ind3)=0
    max( max(d) )
    c = mean(d)
    d = d.^(-1);
    D = mean(d);
end
toc