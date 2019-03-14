function rstmean
tic
n = 50;
r = 5;
p = 0.9;

gdbg = ZzxGDBG(n,r);

a = nchoosek(1:n,2);
a1 = a(:,[2,1]);
b = [a;a1];  %all combination of nodes
b_n = size(b,1);

rstworse = [];
rstoptim = [];
for k = 4:10
    k
    rworse = [];
    roptim = [];
    for i = 1:b_n
        b1 = b(i,1);
        b2 = b(i,2);
        Reli = Zzxoptimalksp(gdbg,b1,b2,k,p);
        if mod(i,100) == 0
            fprintf('%07.4f',i)
        end
        rworse = [rworse,min(Reli)];
        roptim = [roptim,max(Reli)];
    end
    rstworse(1,k) = sum(rworse) / b_n
    rstoptim(1,k) = sum(roptim) / b_n
end
rstworse
rstoptim
toc
%  fid1=fopen('C:\Users\Zzx\Desktop\新建文本文档 (6).txt','wt');
%  for i=1:length(epl1)
%      fprintf(fid1,'%-10.4f\n ',epl1(i));
%  end
%  fclose(fid1);
       