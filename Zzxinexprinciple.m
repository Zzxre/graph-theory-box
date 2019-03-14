function [Reli,p_p]= Zzxinexprinciple(A,p)
%A:the matrix of event set,p:probability
%Rel:the probability of (a1 U a2 U ... U an)
%tic
n = size(A,1);           % A is a cell and size is (n*1)

vn = 1:n;               % vector of 1:n
p_p = [];

r = zeros(n,1);
for j = 1:n
    m = nchoosek( vn,j );
    [n1,n2] = size(m);
    for k = 1:n1
        b = [];
        for h = 1:n2
            m1 = m(k,h);
            b = [b , A{ m1,1 } ];             
        end
        b = unique(b);
        mi = length(b);
        p_p = [p_p, mi];
        r(j,1) = r(j,1) + p^( mi );
    end
%         mi = length(b)
%         p_p(j,1) = [mi]
%         r(j,1) = r(j,1) + p^( mi )
end

Reli = 0;
for i = 1:n 
    Reli = Reli + (-1)^(i+1)*r(i,1);
end
%toc