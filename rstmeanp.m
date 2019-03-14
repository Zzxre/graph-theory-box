function rstmeanp

tic
n = 50;
r = 5;
k = 2;

gdbg = ZzxGDBG(n,r);

a = nchoosek(1:n,2);
a1 = a(:,[2,1]);
b = [a;a1];  %all combination of nodes
b_n = size(b,1);

rstworse = [];
rstoptim = [];
j = 1;
for p = 0.83:0.01:1
    p
    rworse = [];
    roptim = [];
    for i = 1:b_n
        b1 = b(i,1);
        b2 = b(i,2);
        Reli = Zzxoptimalksp(gdbg,b1,b2,k,p);
         if mod(i,50) == 0
            fprintf('%07.4f\n',i)
        end
        rworse = [rworse,min(Reli)];
        roptim = [roptim,max(Reli)];
    end
    rstworse(1,j) = sum(rworse) / b_n
    rstoptim(1,j) = sum(roptim) / b_n
    j = j + 1;
end
rstworse
rstoptim
toc
fid2=fopen('C:\Users\Zzx\Desktop\新建文本文档 (8).txt','wt');
for i=1:length(rstworse)
    fprintf(fid2,'%-10.4f\n ',rstworse(1,i));
end
fclose(fid2);

fid2=fopen('C:\Users\Zzx\Desktop\新建文本文档 (9).txt','wt');
for i=1:length(rstoptim)
    fprintf(fid2,'%-10.4f\n ',rstoptim(1,i));
end
fclose(fid2);
       