function  zzxtest1
n = 20;
epl3 = [];
for i = 0:2:80
    n+i
    [epl] = Zzxoptimalepl(n+i,4,3,0.9);
    epl3=[epl3,epl];
    
end
format short
epl3

% n = 20;
% epl1 = [];
% for i = 2:2:80
%     n+i
%     
%     GDBG = ZzxGDBG(n+i,4);
%     [epl] = Zzxepl(GDBG,3,0.9);
%     epl1=[epl1,epl];
%     
% end
% 
% epl1
% fid1=fopen('C:\Users\Zzx\Desktop\新建文本文档 (2).txt','wt');
% for i=1:length(epl1)
%     fprintf(fid1,'%-10.4f\n ',epl1(i));
% end
% fclose(fid1);
% 
% epl2 = [];
% for i = 2:2:80
%     n+i
%     rrg = createRandRegGraph(n+i,4);
%     [epl] = Zzxepl(rrg,3,0.9);
%     epl2=[epl2,epl];
%     
% end
% epl2
% fid2=fopen('C:\Users\Zzx\Desktop\新建文本文档 (4).txt','wt');
% for i=1:length(epl2)
%     fprintf(fid2,'%-10.4f\n ',epl2(i));
% end
% fclose(fid2);
%save('C:\Users\Zzx\Desktop\新建文本文档 (2).txt')
% 
% set(gca,'GridLineStyle',':','GridColor','k', 'GridAlpha',1)