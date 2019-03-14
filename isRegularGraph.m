%-------------------------------------------------

function msg=isRegularGraph(G)
%is G a simple d-regular graph the function returns []
%otherwise it returns a message describing the problem in G

msg=[];

%check symmetry
if (norm(G-G','fro')>0)
    msg=[msg,' is not symmetric, '];
end

%check parallel edged
if (max(G(:))>1)
    msg=[msg,sprintf(' has %d parallel edges, ',length(find(G(:)>1)) )];
end

%check that d is d-regular
d_vec=sum(G);
if min(d_vec)<d_vec(1) || max(d_vec)>d_vec(1)
    msg=[msg,' not d-regular, '];
end

%check that g doesn't contain any loops
if (norm(diag(G))>0)
    msg=[msg,sprintf(' has %d self loops, ',length(find(diag(G)>0)) )];
end