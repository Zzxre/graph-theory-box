%dcm�ļ���ȡ
function my_dcmgg_jpg(path,GS,GI)
close
%��ȡdcm�ļ���Ϣ����ʾΪ�Ҷ�ͼ
%dicominfo('C:\Users\Lenovo\Desktop\Matting\nature image\�½��ļ���\0031.dcm');


% path = 'C:\Users\Lenovo\Desktop\Matting\nature image\�½��ļ���\0037.dcm';
% GS = 200;
% GI = 100;

%X = dicomread(path);
X = imread(path);

%X = dicomread('C:\Users\Lenovo\Desktop\Matting\nature image\�½��ļ���\0132.dcm');
size(X);           %��ʾx�ľ����С��2ά��֪xΪ�Ҷ�ͼ
class(X);           %��ʾx�ľ������ͣ���֪xΪint16
if ndims(X) == 3%�������ά����ɫ��
    X = rgb2gray(X);% ��ɺڰ�ͼ
end%����

X = double(X);
class(X);

a = max(max(X));    %�õ�X�����ֵ
b = min(min(X));    %�õ�X����Сֵ

%����ǰ�ĻҶȹ淶��0-255��
X = X + abs(b);
a = max(max(X));    %�õ�X�����ֵ
b = min(min(X));
X = floor(X/(a + abs(b))*255);   %����ע��255*2000���ܻ�Խint16���Ͻ磬double���ᡣ
a = max(max(X));    %�õ�X�����ֵ
b = min(min(X));
X1 = X;
% subplot(131)
% y = X(:);
% hist(y,256);

%X = round(X*255);
X = uint8(X);     %imshow0-255��Ҫunit8��ʽ
subplot(1,2,1)      
imshow(X)
title('nature image')

[a1,b1] = size(X);  %�õ�ͼ��I�ĻҶȾ����Сa1,b1
%�Ҷ��к�ɫΪ0����ɫΪ255

for i = 1:a1
     for j = 1:b1
         if  X(i,j) <= GI 
             X(i,j) = 255;
         end
     end
end

%imagesc(X)      %imagesc���ͼƬ�ҶȽ�������

subplot(1,2,2)
imshow(X)
title('matting image')


% X1 = double(X1);
% C = zeros(1,256);
% D = zeros(1,256);
% 
% for m = 0:255;
%     for i = 1:a1
%         for j = 1:b1
%             if X1(i,j) == m
%                C(1,m + 1) =  C(1,m + 1) + 1;
%             end
%         end
%     end
% end
% sum = a1*b1
% for i = 1:256
%     D(1,i) = C(1,i)/sum;
% end
% 
% D;
% subplot(133)
% % X = X(:);
% % hist(X,256)
% plot(0:255,D(:))
% title('gailv')
