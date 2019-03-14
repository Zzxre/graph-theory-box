function Zzx_stars
[filename,pathname] = uigetfile('C:\Users\Lenovo\Desktop\*.*')
path = [pathname,filename]
X = imread([path]);
size(X)% 3024        4032 
max(max(X))
min(min(X))
if ndims(X) == 3%如果是三维（彩色）
    X = rgb2gray(X);% 变成黑白图
end%结束
max(max(X))
min(min(X))
size(X)