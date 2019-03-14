%dcm文件读取
function my_dcmgg_jpg(path,GS,GI)
close
%读取dcm文件信息，显示为灰度图
%dicominfo('C:\Users\Lenovo\Desktop\Matting\nature image\新建文件夹\0031.dcm');


% path = 'C:\Users\Lenovo\Desktop\Matting\nature image\新建文件夹\0037.dcm';
% GS = 200;
% GI = 100;

%X = dicomread(path);
X = imread(path);

%X = dicomread('C:\Users\Lenovo\Desktop\Matting\nature image\新建文件夹\0132.dcm');
size(X);           %显示x的矩阵大小，2维可知x为灰度图
class(X);           %显示x的矩阵类型，可知x为int16
if ndims(X) == 3%如果是三维（彩色）
    X = rgb2gray(X);% 变成黑白图
end%结束

X = double(X);
class(X);

a = max(max(X));    %得到X的最大值
b = min(min(X));    %得到X的最小值

%将以前的灰度规范到0-255内
X = X + abs(b);
a = max(max(X));    %得到X的最大值
b = min(min(X));
X = floor(X/(a + abs(b))*255);   %这里注意255*2000可能会越int16的上界，double不会。
a = max(max(X));    %得到X的最大值
b = min(min(X));
X1 = X;
% subplot(131)
% y = X(:);
% hist(y,256);

%X = round(X*255);
X = uint8(X);     %imshow0-255需要unit8格式
subplot(1,2,1)      
imshow(X)
title('nature image')

[a1,b1] = size(X);  %得到图像I的灰度矩阵大小a1,b1
%灰度中黑色为0，白色为255

for i = 1:a1
     for j = 1:b1
         if  X(i,j) <= GI 
             X(i,j) = 255;
         end
     end
end

%imagesc(X)      %imagesc会对图片灰度进行缩放

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
