function SEQ_0_1=seq_0_1(row,col)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%������������������һ��m*n��0,1����
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lev=0.5;
SEQ_0_1=unifrnd(0,1,row,col);
for i=1:row
    for j=1:col
        if SEQ_0_1(i,j)>=lev
            SEQ_0_1(i,j)=1;
        else
             SEQ_0_1(i,j)=0;
        end
    end
end
SEQ_0_1;
end