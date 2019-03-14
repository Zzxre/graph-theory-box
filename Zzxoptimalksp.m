function [Reli,optksp] = Zzxoptimalksp(G,s,t,k,p)
%G:adjancecy matrix of graph; s,t:start/end point; k: the number of ksp
%p: the probability of edge; optimalksp = optimal ksp set; Ropt: reliability
%tic
G_dis = Zzxadtodis(G);  %adjancrcy to distance matirx
h = k + 1;
kspset = kShortestPath(G_dis,s,t,h);
kspset = cell2mat(kspset);
if size(kspset,2) == 0
    fprintf('Attention, s and t are not connected!')
    return
end

indt = find(kspset == t);
inds = find(kspset == s);
kspsetld = indt-inds;  % kspsetld: the length degree of kspset, row vector

size(kspsetld,2);
if size(kspsetld,2) < k
    disp('s and t have no ksps!')
    return
end
%if size(kspsetld,2) ~= 1
   while  kspsetld(1,end) == kspsetld(1,end-1)
        %%%%% endless loop
        h = h + 1;
        %%%l1 and l2 are avoid endless loop
        l1 = size(kspsetld,2);
        kspset = kShortestPath(G_dis,s,t,h);
        kspset = cell2mat(kspset);
        indt = find(kspset == t);
        inds = find(kspset == s);
        kspsetld = indt-inds;  % kspsetld: the length degree of kspset
        l2 = size(kspsetld,2);
        if l1 == l2
            break
        else
        end
   end 
%    else
% end
    

%     break
% else


kspsetld_1 = kspsetld;
inds_s = find(kspset == s);  % 
% delete the last h kspset iff |Ah|>|Ah-1|
if size(kspsetld,2) ~= 1
    if kspsetld(1,end) > kspsetld(1,end-1)
        kspset = kspset( 1 , 1:(inds_s(end)-1) );  %delete the last(h) kspset
        kspsetld = kspsetld(1,1:(end-1) );       %delete the AH length
    end
end


% if size(kspsetld,2) < k
%     fprintf('there are no k paths!')
%     return
% end

kspsetld_k = kspsetld_1(1,k);   %kspsetld_1 k-th ksp length
kspsetld
kspseti = find( kspsetld ~= kspsetld_k );  %  find the index of different of k-th ksp

%kspseti = kspseti(1,end) + 1; 

%%% kspseti = 1 when A1=Ak, kspseti = i when Ai-1 < Ai
a = [0,kspseti];
if size(a,2) > 1
    kspseti = kspseti(1,end)+1;
%     inds_d1 = inds_s (1,kspseti) - 1;
%     kspset_f = kspset(1, 1:inds_d1 );     %kspset_f: A1->Ai-1
%     kspset_g = kspset(1, inds_d1+1:end);  %kspset_g: Ai->Ah-1
else
    kspseti = 1;
%     %inds_d1 = inds_s (1,kspseti) - 1;
%     kspset_f = [];     %kspset_f: A1->Ai-1
%     kspset_g = kspset(1, 1:end);  %kspset_g: Ai->Ah-1

end

%kspset
%kspseti
inds_d1 = inds_s (1,kspseti) - 1;
kspset_f = kspset(1, 1:inds_d1 );     %kspset_f: A1->Ai-1
kspset_g = kspset(1, inds_d1+1:end);  %kspset_g: Ai->Ah-1


% kspset_f segment and store into ksps
inds_1 = find(kspset_f == s);
indt_1 = find(kspset_f == t);
ksps = {};
for i = 1:size(indt_1,2)
    a1 = kspset_f( 1 , inds_1(i) : indt_1(i) );
    ksps{i,1} = a1;
end

%%%kspset_g segment and store into kspe

alpha = size(kspsetld,2) - kspseti+1;  %alpha is the number of ksp's length is Ak
b = nchoosek(1:alpha , k - kspseti + 1 );

b_m = size(b,1);
b_n = size(b,2);
kspe = cell(b_n,1,b_m);   % b_m cells of b_n rows and 1 column

inds_2 = find(kspset_g == s);
indt_2 = find(kspset_g == t);

for i = 1:b_m
    bi = b(i,:);   %get the i row of b
    bi_n = size(bi,2);
    kspe_array = [];
    for j = 1:bi_n
        c = b(i,j);
        
        kspe_array = [ kspe_array ; kspset_g( inds_2(c):indt_2(c) ) ];
    end
    kspem = ones(1,b_n);
    kspen = kspsetld_k + 1;
    kspe(:,:,i) = mat2cell( kspe_array,kspem,kspen ); 
    %kspe_array to cell, kspem row and kspen column 
end
%%%%

ksp = cell(k,1,b_m);   % b_m cells of b_n rows and 1 column

for i = 1:b_m
    kspei = kspe(:,:,i);
    %ksps
    %ksp1 = [ksps;kspei]
    ksp(:,:,i) = [ksps;kspei];
end


%%%nodes transform to paths
N = ksp;
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
%%%

%size of Pathnum are  n_m,1,n_m1
n_m1
for i = 1:n_m1
    A = Pathnum(:,:,i);
    [Reli(i)] = Zzxinexprinciple(A,p);
end
Reli
R_var = var(Reli);
Ropt = max(Reli);
Rwor = min(Reli);
Reli;
ind_r =  find( abs(Reli - Ropt)<1e-10 );
op_n = size(ind_r,2);
optimalksp = cell(k,1,op_n);

for i = 1:op_n
    optimalksp(:,:,i) = ksp(:,:,i);
end

%cell to mat

for j = 1:op_n
    opa1 = [];
    for i = 1:k
        opa = optimalksp(i,1,j);
        opa = cell2mat(opa);
        opa1 = [opa1,opa];
    end
    opa2(j,:)=opa1;
end
optksp = opa2;
%toc



