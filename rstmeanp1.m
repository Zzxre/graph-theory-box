function rstmeanp1

tic
n = 50;
r = 5;
k = 2;

rrg = createRandRegGraph(n,r);

a = nchoosek(1:n,2);
% a1 = a(:,[2,1]);
% b = [a;a1];  %all combination of nodes
b = a;
b_n = size(b,1);

rstworse = [];
rstoptim = [];
j = 1
for p = 0.8:0.01:1
    p
    rworse = [];
    roptim = [];
    for i = 1:b_n
        b1 = b(i,1);
        b2 = b(i,2);
        Reli = Zzxoptimalksp(rrg,b1,b2,k,p);
        rworse = [rworse,min(Reli)];
        roptim = [roptim,max(Reli)];
    end
    rstworse(1,j) = mean(rworse)
    rstoptim(1,j) = mean(roptim)
    j = j + 1;
end
rstworse
rstoptim
toc
fid2=fopen('C:\Users\Zzx\Desktop\新建文本文档 (10).txt','wt');
for i=1:length(rstworse)
    fprintf(fid2,'%-10.4f\n ',rstworse(1,i));
end
fclose(fid2);

fid2=fopen('C:\Users\Zzx\Desktop\新建文本文档 (11).txt','wt');
for i=1:length(rstoptim)
    fprintf(fid2,'%-10.4f\n ',rstoptim(1,i));
end
fclose(fid2);
       