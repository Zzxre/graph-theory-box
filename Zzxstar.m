function varargout = Zzxstar(varargin)
% DICOMMATTING MATLAB code for DicomMatting.fig
%      DICOMMATTING, by itself, creates a new DICOMMATTING or raises the existing
%      singleton*.
%
%      H = DICOMMATTING returns the handle to a new DICOMMATTING or the handle to
%      the existing singleton*.
%
%      DICOMMATTING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DICOMMATTING.M with the given input arguments.
%
%      DICOMMATTING('Property','Value',...) creates a new DICOMMATTING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DicomMatting_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DicomMatting_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DicomMatting

% Last Modified by GUIDE v2.5 02-Mar-2019 23:11:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Zzxstar_OpeningFcn, ...
                   'gui_OutputFcn',  @Zzxstar_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before DicomMatting is made visible.
function Zzxstar_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DicomMatting (see VARARGIN)

% Choose default command line output for DicomMatting
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DicomMatting wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Zzxstar_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc
clear all
close(gcf)

% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global X
%得到slider的当前数值
sdvalue = get(handles.slider1,'value');
handles.sdvalue = floor(sdvalue);

%取得图像显示的坐标轴
axes(handles.axes3)

[a,b] = size(X);  %得到图像I的灰度矩阵大小a,b
%灰度中黑色为0，白色为255
Y = X;
for i = 1:a
     for j = 1:b
         if  Y(i,j) <= sdvalue
             Y(i,j) = 255; 
         else
             Y(i,j) = 0; 
         end
     end
end
imshow(Y,'InitialMagnification',100);
%imshow(Y);

set(handles.edit2,'string',num2str(handles.sdvalue));

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%定义全局变量
global X
global X1

%选择图片路径
[filename,pathname] = ...
    uigetfile('C:\Users\Lenovo\Desktop\*.*','选择图片');

%合成路径+文件名
path = [pathname,filename];

%读取图片
X = imread([path]);
if ndims(X) == 3%如果是三维（彩色）
    X = rgb2gray(X);% 变成黑白图
end%结束

size(X);            %显示x的矩阵大小，2维可知x为灰度图
class(X);           %显示x的矩阵类型，可知x为int16
%global X
X = double(X);
X1 = X;
class(X);

a = max(max(X));    %得到X的最大值
b = min(min(X));    %得到X的最小值

%将以前的灰度规范到0-255内
% X = X + abs(b);
% X = floor(X/(a + abs(b))*255);   %这里注意255*2000可能会越int16的上界，double不会。

X = uint8(X);     %imshow0-255需要unit8格式
X1 = X;
%使用第二个axes
axes(handles.axes2);

%显示图片
imshow(X);


[a1,b1] = size(X1);

% X1 = X1(:)
% hist(X1,256);

C = zeros(1,256);
D = zeros(1,256);

% for m = 0:255;
%     for i = 1:a1
%         for j = 1:b1
%             if X1(i,j) == m
%                C(1,m + 1) =  C(1,m + 1) + 1;
%             end
%         end
%     end
% end
% sum = a1*b1;
% %得到0-255的概率值
% for i = 1:256
%     D(1,i) = C(1,i)/sum;
% end
% %使用第二个axes
% axes(handles.axes6);
% %画出nature image 的概率分布
% plot(0:255,D(:))


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2


% --- Executes during object creation, after setting all properties.
function axes5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes5





function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double





% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton2.
function pushbutton2_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object deletion, before destroying properties.

% hObject    handle to axes6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
