function rstmeanr
clc
tic
n = 50;
k = 3;
p = 0.9;

a = nchoosek(1:n,2);
a1 = a(:,[2,1]);
b = [a;a1];  %all combination of nodes
b_n = size(b,1);

rstworse = [];
rstoptim = [];
for r = 7:10
    r
    rworse = [];
    roptim = [];
    gdbg = ZzxGDBG(n,r);
    for i = 1:b_n
        b1 = b(i,1);
        b2 = b(i,2);
        Reli = Zzxoptimalksp(gdbg,b1,b2,k,p);
        rworse = [rworse,min(Reli)];
        roptim = [roptim,max(Reli)];
    end
    rstworse(1,r) = sum(rworse) / b_n
    rstoptim(1,r) = sum(roptim) / b_n
end
rstworse
rstoptim
toc
fid2=fopen('C:\Users\Zzx\Desktop\新建文本文档 (12).txt','wt');
for i=1:length(rstworse)
    fprintf(fid2,'%-10.4f\n ',rstworse(1,i));
end
fclose(fid2);

fid2=fopen('C:\Users\Zzx\Desktop\新建文本文档 (19).txt','wt');
for i=1:length(rstoptim)
    fprintf(fid2,'%-10.4f\n ',rstoptim(1,i));
end
fclose(fid2);
       