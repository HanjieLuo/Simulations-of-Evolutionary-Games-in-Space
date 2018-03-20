function varargout = Panel_3D(varargin)
% PANEL_3D M-file for Panel_3D.fig
%      PANEL_3D, by itself, creates a new PANEL_3D or raises the existing
%      singleton*.
%
%      H = PANEL_3D returns the handle to a new PANEL_3D or the handle to
%      the existing singleton*.
%
%      PANEL_3D('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PANEL_3D.M with the given input arguments.
%
%      PANEL_3D('Property','Value',...) creates a new PANEL_3D or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Panel_3D_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Panel_3D_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Panel_3D

% Last Modified by GUIDE v2.5 07-Jan-2012 02:39:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Panel_3D_OpeningFcn, ...
                   'gui_OutputFcn',  @Panel_3D_OutputFcn, ...
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


% --- Executes just before Panel_3D is made visible.
function Panel_3D_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Panel_3D (see VARARGIN)

% Choose default command line output for Panel_3D
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

setappdata(0,'patterns',0);
setappdata(0,'frequency',0);
setappdata(0,'length',0);
setappdata(0,'width',0);
setappdata(0,'hight',0);
setappdata(0,'maxN',0);
% setappdata(0,'x_val',0);
% setappdata(0,'y_val',0);
% setappdata(0,'z_val',0);

% UIWAIT makes Panel_3D wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Panel_3D_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function b_val_Callback(hObject, eventdata, handles)
% hObject    handle to b_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of b_val as text
%        str2double(get(hObject,'String')) returns contents of b_val as a double


% --- Executes during object creation, after setting all properties.
function b_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to b_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function generations_Callback(hObject, eventdata, handles)
% hObject    handle to generations (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of generations as text
%        str2double(get(hObject,'String')) returns contents of generations as a double


% --- Executes during object creation, after setting all properties.
function generations_CreateFcn(hObject, eventdata, handles)
% hObject    handle to generations (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function length_val_Callback(hObject, eventdata, handles)
% hObject    handle to length_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of length_val as text
%        str2double(get(hObject,'String')) returns contents of length_val as a double


% --- Executes during object creation, after setting all properties.
function length_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to length_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function width_val_Callback(hObject, eventdata, handles)
% hObject    handle to width_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of width_val as text
%        str2double(get(hObject,'String')) returns contents of width_val as a double


% --- Executes during object creation, after setting all properties.
function width_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to width_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function hight_val_Callback(hObject, eventdata, handles)
% hObject    handle to hight_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hight_val as text
%        str2double(get(hObject,'String')) returns contents of hight_val as a double


% --- Executes during object creation, after setting all properties.
function hight_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hight_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

h=msgbox('Computing, please wait...','Computing');

b=str2num(get(handles.b_val,'String'));
generations_str=get(handles.generations,'String');
generations=str2num(generations_str);
length=str2num(get(handles.length_val,'String'));
width=str2num(get(handles.width_val,'String'));
hight=str2num(get(handles.hight_val,'String'));

if(get(handles.in1,'Value')==1)
    inint_condition=1;
    inint_value=get(handles.in1_val,'Value');
else
    inint_condition=2;
    inint_value=str2num(get(handles.in2_val,'String'))*0.01;
end



patterns=ones(length,width,hight,generations);
frequency=zeros(1,generations);



[patterns frequency]= PD_3D(generations,b,length,width,hight,inint_condition,inint_value);



setappdata(0,'frequency',frequency);
setappdata(0,'length',length);
setappdata(0,'width',width);
setappdata(0,'hight',hight);




set(handles.gen_slider,'Enable','on');
set(handles.gen_btn,'Enable','on');
set(handles.gen_val,'Enable','on');

set(handles.x,'Enable','on');
set(handles.y,'Enable','on');
set(handles.z,'Enable','on');
set(handles.z_val,'Enable','on');
set(handles.z_btn,'Enable','on');
set(handles.z_slider,'Enable','on');


set(handles.x_val,'Enable','off');
set(handles.x_btn,'Enable','off');
set(handles.x_slider,'Enable','off');

set(handles.y_val,'Enable','off');
set(handles.y_btn,'Enable','off');
set(handles.y_slider,'Enable','off');


set(handles.gen_slider,'Sliderstep',[1/generations 1/generations]);
set(handles.gen_slider,'Max',generations);
set(handles.gen_slider,'Value',generations);
set(handles.gen_val,'String',generations_str);


zval=round(hight/2);
set(handles.z_slider,'Sliderstep',[1/hight 1/hight]);
set(handles.z_slider,'Max',hight);
set(handles.z_slider,'Value',zval);
set(handles.z_val,'String',num2str(zval));

xval=round(width/2);
set(handles.x_slider,'Sliderstep',[1/width 1/width]);
set(handles.x_slider,'Max',width);
set(handles.x_slider,'Value',xval);
set(handles.x_val,'String',num2str(xval));

yval=round(length/2);
set(handles.y_slider,'Sliderstep',[1/length 1/length]);
set(handles.y_slider,'Max',length);
set(handles.y_slider,'Value',yval);
set(handles.y_val,'String',num2str(yval));




% setappdata(0,'x_val',round(length/2));
% setappdata(0,'y_val',round(width/2));
% setappdata(0,'z_val',zval);





axes(handles.axes_result);

[x,y,z] = meshgrid(1:width+1,1:length+1,1:hight+1);

patterns2=ones(length+1,width+1,hight+1,generations);
patterns2(1:length,1:width,1:hight,:)=patterns(:,:,:,:);

patterns2(length+1,:,:,:)=patterns2(length,:,:,:);
patterns2(:,width+1,:,:)=patterns2(:,width,:,:);
patterns2(:,:,hight+1,:)=patterns2(:,:,hight,:);

setappdata(0,'patterns',patterns2);


xslice = []; yslice =[]; zslice =[zval];


patterns2(length+1,width+1,1,generations)=1;
patterns2(length+1,width+1,2,generations)=2;
patterns2(length+1,width+1,3,generations)=3;
patterns2(length+1,width+1,4,generations)=4;

s=slice(x,y,z,patterns2(:,:,:,generations),xslice,yslice,zslice);


map=[1 0 0;1 1 0;0 0 1;0 1 0];
colormap(map);
caxis([1 4]);

%
maxN=max([length width hight])+1;
setappdata(0,'maxN',maxN);
xlim([1 maxN]);
ylim([1 maxN]);
zlim([1 maxN]);
%

set(s, 'LineStyle','none');
alpha(0.9);


axes(handles.axes_f);
plot(frequency);
xlim([1 generations]);
ylim([0 1]);

delete(h);



function gen_val_Callback(hObject, eventdata, handles)
% hObject    handle to gen_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of gen_val as text
%        str2double(get(hObject,'String')) returns contents of gen_val as a double


% --- Executes during object creation, after setting all properties.
function gen_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gen_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in gen_btn.
function gen_btn_Callback(hObject, eventdata, handles)
% hObject    handle to gen_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

patterns=getappdata(0,'patterns');
hight=getappdata(0,'hight');
width=getappdata(0,'width');
length=getappdata(0,'length');

frequency=getappdata(0,'frequency');
generations=str2num(get(handles.generations,'String'));

gen_val=str2num(get(handles.gen_val,'String'));


set(handles.gen_slider,'Value',gen_val);


axes(handles.axes_result);



if(get(handles.x,'Value')==1)
    xslice = [get(handles.x_slider,'Value')]; yslice =[]; zslice =[];    
elseif(get(handles.y,'Value')==1)
    xslice = []; yslice =[get(handles.y_slider,'Value')]; zslice =[];  
else
    xslice = []; yslice =[]; zslice =[get(handles.z_slider,'Value')];  
end


[x,y,z] = meshgrid(1:width+1,1:length+1,1:hight+1);

patterns(length+1,width+1,1,gen_val)=1;
patterns(length+1,width+1,2,gen_val)=2;
patterns(length+1,width+1,3,gen_val)=3;
patterns(length+1,width+1,4,gen_val)=4;

s=slice(x,y,z,patterns(:,:,:,gen_val),xslice,yslice,zslice);
set(s, 'LineStyle','none');

map=[1 0 0;1 1 0;0 0 1;0 1 0];
colormap(map);

maxN=getappdata(0,'maxN');
xlim([1 maxN]);
ylim([1 maxN]);
zlim([1 maxN]);
caxis([1 4]);
alpha(0.9);


axes(handles.axes_f);
plot(frequency(1:gen_val));
xlim([1 generations]);
ylim([0 1]);


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function gen_slider_Callback(hObject, eventdata, handles)
% hObject    handle to gen_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

patterns=getappdata(0,'patterns');
hight=getappdata(0,'hight');
width=getappdata(0,'width');
length=getappdata(0,'length');
frequency=getappdata(0,'frequency');
generations=str2num(get(handles.generations,'String'));

gen_val=get(handles.gen_slider,'Value');

if rem(gen_val,1)~=0
    gen_val=round(gen_val);
    set(handles.gen_slider,'Value',gen_val)
end

set(handles.gen_val,'String',num2str(gen_val));


axes(handles.axes_result);



if(get(handles.x,'Value')==1)
    xslice = [get(handles.x_slider,'Value')]; yslice =[]; zslice =[];    
elseif(get(handles.y,'Value')==1)
    xslice = []; yslice =[get(handles.y_slider,'Value')]; zslice =[];  
else
    xslice = []; yslice =[]; zslice =[get(handles.z_slider,'Value')];  
end


[x,y,z] = meshgrid(1:width+1,1:length+1,1:hight+1);

patterns(length+1,width+1,1,gen_val)=1;
patterns(length+1,width+1,2,gen_val)=2;
patterns(length+1,width+1,3,gen_val)=3;
patterns(length+1,width+1,4,gen_val)=4;

s=slice(x,y,z,patterns(:,:,:,gen_val),xslice,yslice,zslice);
set(s, 'LineStyle','none');

map=[1 0 0;1 1 0;0 0 1;0 1 0];
colormap(map);

maxN=getappdata(0,'maxN');
xlim([1 maxN]);
ylim([1 maxN]);
zlim([1 maxN]);
caxis([1 4]);
alpha(0.9);



axes(handles.axes_f);
plot(frequency(1:gen_val));
xlim([1 generations]);
ylim([0 1]);







% --- Executes during object creation, after setting all properties.
function gen_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gen_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function x_val_Callback(hObject, eventdata, handles)
% hObject    handle to x_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x_val as text
%        str2double(get(hObject,'String')) returns contents of x_val as a double


% --- Executes during object creation, after setting all properties.
function x_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in x_btn.
function x_btn_Callback(hObject, eventdata, handles)
% hObject    handle to x_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
patterns=getappdata(0,'patterns');
hight=getappdata(0,'hight');
width=getappdata(0,'width');
length=getappdata(0,'length');
gen_val=get(handles.gen_slider,'Value');

x_val=str2num(get(handles.x_val,'String'));


set(handles.x_slider,'Value',x_val);

axes(handles.axes_result);

xslice = [x_val]; yslice =[]; zslice =[];
[x,y,z] = meshgrid(1:width+1,1:length+1,1:hight+1);

patterns(length+1,width+1,1,gen_val)=1;
patterns(length+1,width+1,2,gen_val)=2;
patterns(length+1,width+1,3,gen_val)=3;
patterns(length+1,width+1,4,gen_val)=4;


s=slice(x,y,z,patterns(:,:,:,gen_val),xslice,yslice,zslice);
set(s, 'LineStyle','none');

map=[1 0 0;1 1 0;0 0 1;0 1 0];
colormap(map);


maxN=getappdata(0,'maxN');
xlim([1 maxN]);
ylim([1 maxN]);
zlim([1 maxN]);
caxis([1 4]);
alpha(0.9);

% --- Executes on slider movement.
function x_slider_Callback(hObject, eventdata, handles)
% hObject    handle to x_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
patterns=getappdata(0,'patterns');
hight=getappdata(0,'hight');
width=getappdata(0,'width');
length=getappdata(0,'length');
gen_val=get(handles.gen_slider,'Value');

x_val=get(handles.x_slider,'Value');

if rem(x_val,1)~=0
    x_val=round(x_val);
    set(handles.x_slider,'Value',x_val)
end



set(handles.x_val,'String',num2str(x_val));

axes(handles.axes_result);

xslice = [x_val]; yslice =[]; zslice =[];
[x,y,z] = meshgrid(1:width+1,1:length+1,1:hight+1);

patterns(length+1,width+1,1,gen_val)=1;
patterns(length+1,width+1,2,gen_val)=2;
patterns(length+1,width+1,3,gen_val)=3;
patterns(length+1,width+1,4,gen_val)=4;

s=slice(x,y,z,patterns(:,:,:,gen_val),xslice,yslice,zslice);


map=[1 0 0;1 1 0;0 0 1;0 1 0];
colormap(map);

set(s, 'LineStyle','none');

maxN=getappdata(0,'maxN');
xlim([1 maxN]);
ylim([1 maxN]);
zlim([1 maxN]);
caxis([1 4]);
alpha(0.9);

% --- Executes during object creation, after setting all properties.
function x_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function y_val_Callback(hObject, eventdata, handles)
% hObject    handle to y_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of y_val as text
%        str2double(get(hObject,'String')) returns contents of y_val as a double


% --- Executes during object creation, after setting all properties.
function y_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in y_btn.
function y_btn_Callback(hObject, eventdata, handles)
% hObject    handle to y_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



patterns=getappdata(0,'patterns');
hight=getappdata(0,'hight');
width=getappdata(0,'width');
length=getappdata(0,'length');
gen_val=get(handles.gen_slider,'Value');

y_val=str2num(get(handles.y_val,'String'));


set(handles.y_slider,'Value',y_val);

axes(handles.axes_result);

xslice = []; yslice =[y_val]; zslice =[];
[x,y,z] = meshgrid(1:width+1,1:length+1,1:hight+1);

patterns(length+1,width+1,1,gen_val)=1;
patterns(length+1,width+1,2,gen_val)=2;
patterns(length+1,width+1,3,gen_val)=3;
patterns(length+1,width+1,4,gen_val)=4;


s=slice(x,y,z,patterns(:,:,:,gen_val),xslice,yslice,zslice);
set(s, 'LineStyle','none');

map=[1 0 0;1 1 0;0 0 1;0 1 0];
colormap(map);


maxN=getappdata(0,'maxN');
xlim([1 maxN]);
ylim([1 maxN]);
zlim([1 maxN]);
caxis([1 4]);
alpha(0.9);


% --- Executes on slider movement.
function y_slider_Callback(hObject, eventdata, handles)
% hObject    handle to y_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
patterns=getappdata(0,'patterns');
hight=getappdata(0,'hight');
width=getappdata(0,'width');
length=getappdata(0,'length');
gen_val=get(handles.gen_slider,'Value');

y_val=get(handles.y_slider,'Value');

if rem(y_val,1)~=0
    y_val=round(y_val);
    set(handles.y_slider,'Value',y_val)
end



set(handles.y_val,'String',num2str(y_val));

axes(handles.axes_result);

xslice = []; yslice =[y_val]; zslice =[];
[x,y,z] = meshgrid(1:width+1,1:length+1,1:hight+1);

patterns(length+1,width+1,1,gen_val)=1;
patterns(length+1,width+1,2,gen_val)=2;
patterns(length+1,width+1,3,gen_val)=3;
patterns(length+1,width+1,4,gen_val)=4;

s=slice(x,y,z,patterns(:,:,:,gen_val),xslice,yslice,zslice);
set(s, 'LineStyle','none');

map=[1 0 0;1 1 0;0 0 1;0 1 0];
colormap(map);


maxN=getappdata(0,'maxN');
xlim([1 maxN]);
ylim([1 maxN]);
zlim([1 maxN]);
caxis([1 4]);
alpha(0.9);

% --- Executes during object creation, after setting all properties.
function y_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function z_val_Callback(hObject, eventdata, handles)
% hObject    handle to z_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of z_val as text
%        str2double(get(hObject,'String')) returns contents of z_val as a double


% --- Executes during object creation, after setting all properties.
function z_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to z_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in z_btn.
function z_btn_Callback(hObject, eventdata, handles)
% hObject    handle to z_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
patterns=getappdata(0,'patterns');
hight=getappdata(0,'hight');
width=getappdata(0,'width');
length=getappdata(0,'length');
gen_val=get(handles.gen_slider,'Value');

z_val=str2num(get(handles.z_val,'String'));


set(handles.z_slider,'Value',z_val);

axes(handles.axes_result);

xslice = []; yslice =[]; zslice =[z_val];
[x,y,z] = meshgrid(1:width+1,1:length+1,1:hight+1);

patterns(length+1,width+1,1,gen_val)=1;
patterns(length+1,width+1,2,gen_val)=2;
patterns(length+1,width+1,3,gen_val)=3;
patterns(length+1,width+1,4,gen_val)=4;

s=slice(x,y,z,patterns(:,:,:,gen_val),xslice,yslice,zslice);
set(s, 'LineStyle','none');

map=[1 0 0;1 1 0;0 0 1;0 1 0];
colormap(map);


maxN=getappdata(0,'maxN');
xlim([1 maxN]);
ylim([1 maxN]);
zlim([1 maxN]);
caxis([1 4]);
alpha(0.9);


% --- Executes on slider movement.
function z_slider_Callback(hObject, eventdata, handles)
% hObject    handle to z_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

patterns=getappdata(0,'patterns');
hight=getappdata(0,'hight');
width=getappdata(0,'width');
length=getappdata(0,'length');
gen_val=get(handles.gen_slider,'Value');

z_val=get(handles.z_slider,'Value');

if rem(z_val,1)~=0
    z_val=round(z_val);
    set(handles.z_slider,'Value',z_val)
end



set(handles.z_val,'String',num2str(z_val));

axes(handles.axes_result);

xslice = []; yslice =[]; zslice =[z_val];
[x,y,z] = meshgrid(1:width+1,1:length+1,1:hight+1);

patterns(length+1,width+1,1,gen_val)=1;
patterns(length+1,width+1,2,gen_val)=2;
patterns(length+1,width+1,3,gen_val)=3;
patterns(length+1,width+1,4,gen_val)=4;

s=slice(x,y,z,patterns(:,:,:,gen_val),xslice,yslice,zslice);
set(s, 'LineStyle','none');

map=[1 0 0;1 1 0;0 0 1;0 1 0];
colormap(map);


maxN=getappdata(0,'maxN');
xlim([1 maxN]);
ylim([1 maxN]);
zlim([1 maxN]);
caxis([1 4]);
alpha(0.9);





% --- Executes during object creation, after setting all properties.
function z_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to z_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function in2_val_Callback(hObject, eventdata, handles)
% hObject    handle to in2_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of in2_val as text
%        str2double(get(hObject,'String')) returns contents of in2_val as a double


% --- Executes during object creation, after setting all properties.
function in2_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to in2_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in in1_val.
function in1_val_Callback(hObject, eventdata, handles)
% hObject    handle to in1_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns in1_val contents as cell array
%        contents{get(hObject,'Value')} returns selected item from in1_val


% --- Executes during object creation, after setting all properties.
function in1_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to in1_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in z.
function z_Callback(hObject, eventdata, handles)
% hObject    handle to z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of z

set(handles.x_val,'Enable','off');
set(handles.x_btn,'Enable','off');
set(handles.x_slider,'Enable','off');

set(handles.y_val,'Enable','off');
set(handles.y_btn,'Enable','off');
set(handles.y_slider,'Enable','off');

set(handles.z_val,'Enable','on');
set(handles.z_btn,'Enable','on');
set(handles.z_slider,'Enable','on');

patterns=getappdata(0,'patterns');
hight=getappdata(0,'hight');
width=getappdata(0,'width');
length=getappdata(0,'length');
gen_val=get(handles.gen_slider,'Value');
z_val=get(handles.z_slider,'Value');

% set(handles.z_slider,'Value',z_val);
% set(handles.z_val,'String',num2str(z_val));

axes(handles.axes_result);
xslice = []; yslice =[]; zslice =[z_val];

[x,y,z] = meshgrid(1:width+1,1:length+1,1:hight+1);

patterns(length+1,width+1,1,gen_val)=1;
patterns(length+1,width+1,2,gen_val)=2;
patterns(length+1,width+1,3,gen_val)=3;
patterns(length+1,width+1,4,gen_val)=4;

s=slice(x,y,z,patterns(:,:,:,gen_val),xslice,yslice,zslice);

set(s, 'LineStyle','none');
map=[1 0 0;1 1 0;0 0 1;0 1 0];
colormap(map);


maxN=getappdata(0,'maxN');
xlim([1 maxN]);
ylim([1 maxN]);
zlim([1 maxN]);
caxis([1 4]);
alpha(0.9);


% --- Executes on button press in y.
function y_Callback(hObject, eventdata, handles)
% hObject    handle to y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of y

set(handles.y_val,'Enable','on');
set(handles.y_btn,'Enable','on');
set(handles.y_slider,'Enable','on');


set(handles.x_val,'Enable','off');
set(handles.x_btn,'Enable','off');
set(handles.x_slider,'Enable','off');

set(handles.z_val,'Enable','off');
set(handles.z_btn,'Enable','off');
set(handles.z_slider,'Enable','off');




patterns=getappdata(0,'patterns');
hight=getappdata(0,'hight');
width=getappdata(0,'width');
length=getappdata(0,'length');
gen_val=get(handles.gen_slider,'Value');
y_val=get(handles.y_slider,'Value');


% set(handles.y_slider,'Value',y_val);
% set(handles.y_val,'String',num2str(y_val));


axes(handles.axes_result);
xslice = []; yslice =[y_val]; zslice =[];

[x,y,z] = meshgrid(1:width+1,1:length+1,1:hight+1);

patterns(length+1,width+1,1,gen_val)=1;
patterns(length+1,width+1,2,gen_val)=2;
patterns(length+1,width+1,3,gen_val)=3;
patterns(length+1,width+1,4,gen_val)=4;


s=slice(x,y,z,patterns(:,:,:,gen_val),xslice,yslice,zslice);

set(s, 'LineStyle','none');
map=[1 0 0;1 1 0;0 0 1;0 1 0];
colormap(map);


maxN=getappdata(0,'maxN');
xlim([1 maxN]);
ylim([1 maxN]);
zlim([1 maxN]);
caxis([1 4]);
alpha(0.9);


% --- Executes on button press in x.
function x_Callback(hObject, eventdata, handles)
% hObject    handle to x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of x


set(handles.x_val,'Enable','on');
set(handles.x_btn,'Enable','on');
set(handles.x_slider,'Enable','on');


set(handles.y_val,'Enable','off');
set(handles.y_btn,'Enable','off');
set(handles.y_slider,'Enable','off');

set(handles.z_val,'Enable','off');
set(handles.z_btn,'Enable','off');
set(handles.z_slider,'Enable','off');




patterns=getappdata(0,'patterns');
hight=getappdata(0,'hight');
width=getappdata(0,'width');
length=getappdata(0,'length');
gen_val=get(handles.gen_slider,'Value');
x_val=get(handles.x_slider,'Value');


% set(handles.x_slider,'Value',x_val);
% set(handles.x_val,'String',num2str(x_val));



axes(handles.axes_result);

xslice = [x_val]; yslice =[]; zslice =[];

[x,y,z] = meshgrid(1:width+1,1:length+1,1:hight+1);

patterns(length+1,width+1,1,gen_val)=1;
patterns(length+1,width+1,2,gen_val)=2;
patterns(length+1,width+1,3,gen_val)=3;
patterns(length+1,width+1,4,gen_val)=4;

s=slice(x,y,z,patterns(:,:,:,gen_val),xslice,yslice,zslice);
set(s, 'LineStyle','none');

map=[1 0 0;1 1 0;0 0 1;0 1 0];
colormap(map);

maxN=getappdata(0,'maxN');
xlim([1 maxN]);
ylim([1 maxN]);
zlim([1 maxN]);
caxis([1 4]);
alpha(0.9);


% --- Executes on button press in in2.
function in2_Callback(hObject, eventdata, handles)
% hObject    handle to in2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of in2

set(handles.in1_val,'Enable','off');
set(handles.in2_val,'Enable','on');


% --- Executes on button press in in1.
function in1_Callback(hObject, eventdata, handles)
% hObject    handle to in1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of in1
set(handles.in1_val,'Enable','on');
set(handles.in2_val,'Enable','off');


% --------------------------------------------------------------------
function fuke_Callback(hObject, eventdata, handles)
% hObject    handle to fuke (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Save_Callback(hObject, eventdata, handles)
% hObject    handle to Save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname]=uiputfile({ '*.bmp' , 'BMP files'; '*.jpg;','JPG files'},'Pick an Image');

if isequal(filename,0)||isequal(pathname,0)
    return ;
else

    fpath=fullfile(pathname,filename);

end

patterns=getappdata(0,'patterns');
gen_val=get(handles.gen_slider,'Value');
hight=getappdata(0,'hight');
width=getappdata(0,'width');
length=getappdata(0,'length');


map=[1 0 0;1 1 0;0 0 1;0 1 0];

if(get(handles.x,'Value')==1)
    I=ind2rgb(patterns(1:length,width,get(handles.x_slider,'Value'),gen_val),map);
elseif(get(handles.y,'Value')==1)
    I=ind2rgb(patterns(get(handles.y_slider,'Value'),1:width,1:hight,gen_val),map);
else
    kk=patterns(1:length,1:width,get(handles.z_slider,'Value'),gen_val);
    I=ind2rgb(patterns(1:length,1:width,get(handles.z_slider,'Value'),gen_val),map);
end



imwrite(I,fpath);

