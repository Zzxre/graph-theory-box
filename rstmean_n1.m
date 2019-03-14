function rstmean_n1
tic

r = 4;
k = 3;
p = 0.9;



rstworse = [];
rstoptim = [];
for n = 20:1:70
    n
    a = nchoosek(1:n,2);
    b = a;
    %a1 = a(:,[2,1]);
    %b = [a;a1];  %all combination of nodes
    b_n = size(b,1);
    
    rworse = [];
    roptim = [];
    rrg = createRandRegGraph(n,r);
    for i = 1:b_n
        b1 = b(i,1);
        b2 = b(i,2);
        Reli = Zzxoptimalksp(rrg,b1,b2,k,p);
        rworse = [rworse,min(Reli)];
        roptim = [roptim,max(Reli)];
    end
    rstworse(1,n) = sum(rworse) / b_n
    rstoptim(1,n) = sum(roptim) / b_n
end
rstworse
rstoptim
toc
fid2=fopen('C:\Users\Zzx\Desktop\新建文本文档 (17).txt','wt');
for i=1:length(rstworse)
    fprintf(fid2,'%-10.4f\n ',rstworse(1,i));
end
fclose(fid2);

fid2=fopen('C:\Users\Zzx\Desktop\新建文本文档 (18).txt','wt');
for i=1:length(rstoptim)
    fprintf(fid2,'%-10.4f\n ',rstoptim(1,i));
end
fclose(fid2);
       