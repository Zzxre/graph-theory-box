function [e] = kspset_2

tic
G = [0 1 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0;
 1 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
 0 1 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0;
 0 1 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0;
 0 0 1 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0;
 0 0 0 1 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0;
 0 0 1 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 0;
 0 0 0 1 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0;
 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0;
 0 0 0 0 1 0 0 0 0 0 1 0 0 0 1 0 0 0 0 0;
 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 0 1;
 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 1;
 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 1 0 0 0;
 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0;
 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 1 0 1 0 0;
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 1;
 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 1 0 0 1 0;
 0 0 0 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 1 0;
 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 1 1 0 0;
 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 1 0 0 0 0;];

S = 1;
T = 20;
K = 5;
p = 0.9;

G = Zzxadtodis(G);
a = Zzxkspset(G ,S, T, 30);

ind1 =  find(a == S) ;
ind2 =  find(a == T) ;
a_leng = ind2-ind1;
a_le_id1 = find(a_leng > a_leng(K),1);
a_le_id1 = a_le_id1 - 1;
a_le_id2 = find(a_leng < a_leng(K),1);
a_le_id2 = 0;
a_n = a_le_id1 - a_le_id2;
b = nchoosek([1:a_n],K);
b = [b,1:a_le_id2];
g_1 = zeros(size(G,1),size(G,1),size(b,1));
size(b,1);
size(b,2);
for i_1 = 1:size(b,1)
    
        for j = 1:size(b,2)
            c = b(i_1,j);

            for j_1 = ind1(c):(ind1(c+1)-1)
                a_1 = a(j_1,1);
                a_2 = a(j_1,2);
                g_1( a_1, a_2, i_1) = 1;
                g_1( a_2, a_1, i_1) = 1;
            end
            
        end
    
end

for i = 1:size(g_1,3)
    G_ndis(:,:,i) = Zzxadtodis(g_1(:,:,i));
end

syms c
for i_3 = 1:size(G_ndis,3)
    c = Zzxkspset(G_ndis(:, :, i_3) ,S, T, 1000);
    c_ind = find(c == S);
    c_ind1 = [c_ind; length(c) + 1];
    
    for i_4 = 1:length(c_ind)
        d = [];
        for i_5 = c_ind1(i_4): c_ind1(i_4 + 1) - 1
            
            d = [d, (c(i_5,1) - 1) * 20 + c(i_5,2)];
        end
        A{i_4,1,i_3} = d;
    end
        
end

for i_5 = 1:size(G_ndis,3)
    e(i_5) = Zzxinexprinciple(A(:,1,i_5),p);
end
e
toc





