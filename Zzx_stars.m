function Zzx_stars
[filename,pathname] = uigetfile('C:\Users\Lenovo\Desktop\*.*')
path = [pathname,filename]
X = imread([path]);
size(X)% 3024        4032 
max(max(X))
min(min(X))
if ndims(X) == 3%�������ά����ɫ��
    X = rgb2gray(X);% ��ɺڰ�ͼ
end%����
max(max(X))
min(min(X))
size(X)