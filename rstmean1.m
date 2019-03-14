function rstmean1(rrg)
tic
n = 50;
r = 5;
p = 0.9;

%rrg = createRandRegGraph(n,r);

a = nchoosek(1:n,2);
% a1 = a(:,[2,1]);
 b = a;
% b = [a;a1];  %all combination of nodes
b_n = size(b,1);

rstworse = [];
rstoptim = [];
 k = 7
    
    rworse = [];
    roptim = [];
   for i = 1:b_n
       b1 = b(i,1);
       b2 = b(i,2);
        
        Reli = Zzxoptimalksp(rrg,b1,b2,k,p);
        if mod(i,50) == 0
            fprintf('%07.4f\n',i)
        end
        rworse = [rworse,min(Reli)];
        roptim = [roptim,max(Reli)];
   end
    rstworse(1,k) = sum(rworse) / b_n
    rstoptim(1,k) = sum(roptim) / b_n

rstworse
rstoptim
toc

fid2=fopen('C:\Users\Zzx\Desktop\新建文本文档 (6).txt','wt');
for i=1:length(rstworse)
    fprintf(fid2,'%-10.4f\n ',rstworse(1,i));
end
fclose(fid2);

fid2=fopen('C:\Users\Zzx\Desktop\新建文本文档 (7).txt','wt');
for i=1:length(rstoptim)
    fprintf(fid2,'%-10.4f\n ',rstoptim(1,i));
end
fclose(fid2);

       