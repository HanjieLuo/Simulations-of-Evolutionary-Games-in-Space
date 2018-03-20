function varargout = Panel(varargin)
% PANEL M-file for Panel.fig
%      PANEL, by itself, creates a new PANEL or raises the existing
%      singleton*.
%
%      H = PANEL returns the handle to a new PANEL or the handle to
%      the existing singleton*.
%
%      PANEL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PANEL.M with the given input arguments.
%
%      PANEL('Property','Value',...) creates a new PANEL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Panel_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Panel_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Panel

% Last Modified by GUIDE v2.5 23-Dec-2011 02:50:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @Panel_OpeningFcn, ...
    'gui_OutputFcn',  @Panel_OutputFcn, ...
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


% --- Executes just before Panel is made visible.
function Panel_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Panel (see VARARGIN)

% Choose default command line output for Panel
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

setappdata(0,'patterns',0);
setappdata(0,'frequency',0);



% UIWAIT makes Panel wait for user response (see UIRESUME)
% uiwait(handles.panel);


% --- Outputs from this function are returned to the command line.
function varargout = Panel_OutputFcn(hObject, eventdata, handles)
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



function generations_val_Callback(hObject, eventdata, handles)
% hObject    handle to generations_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of generations_val as text
%        str2double(get(hObject,'String')) returns contents of generations_val as a double


% --- Executes during object creation, after setting all properties.
function generations_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to generations_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in start_btn.
function start_btn_Callback(hObject, eventdata, handles)
% hObject    handle to start_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

h=msgbox('Computing, please wait...','Computing');

b=str2num(get(handles.b_val,'String'));
generations_str=get(handles.generations_val,'String');
generations=str2num(generations_str);
n=str2num(get(handles.hight_val,'String'));
m=str2num(get(handles.width_val,'String'));

if(get(handles.in1,'Value')==1)
    inint_condition=1;
    inint_value=get(handles.in1_val,'Value');
else
    inint_condition=2;
    inint_value=str2num(get(handles.in2_val,'String'))*0.01;
end

if(get(handles.s1,'Value')==1)
    interact_condition=1;
elseif(get(handles.s2,'Value')==1)
    interact_condition=2;
else
    interact_condition=3;
end


patterns=ones(m,n,generations);
frequency=zeros(1,generations);


if(get(handles.syn,'Value')==1)
    [patterns frequency]= PD(generations,b,n,m,inint_condition,inint_value,interact_condition);
else
    [patterns frequency]= PD_asy(generations,b,n,m,inint_condition,inint_value,interact_condition);
end

setappdata(0,'patterns',patterns);
setappdata(0,'frequency',frequency);

set(handles.slider_val,'Enable','on');
set(handles.View_btn,'Enable','on');

set(handles.slider_r,'Sliderstep',[1/generations 1/generations]);
set(handles.slider_r,'Max',generations);
set(handles.slider_r,'Value',generations);
set(handles.slider_val,'String',generations_str);

map=[1 0 0;1 1 0;0 0 1;0 1 0];
%imwrite(patterns(:,:,generations),map,'test.bmp');
I=ind2rgb(patterns(:,:,generations),map);
axes(handles.axes_r);
imshow(I);

axes(handles.axes_f);
plot(frequency);
xlim([1 generations]);
ylim([0 1]);



delete(h);
%colormap(map);\
%p=pcolor(patterns(:,:,generations));
%set(p, 'LineStyle','none');

%image(I);










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


% --- Executes on slider movement.
function slider_r_Callback(hObject, eventdata, handles)
% hObject    handle to slider_r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
gen_val=get(handles.slider_r,'Value');
if rem(gen_val,1)~=0
    gen_val=round(gen_val);
    set(handles.slider_r,'Value',gen_val)
end
set(handles.slider_val,'String',num2str(gen_val));

patterns= getappdata(0,'patterns');
map=[1 0 0;1 1 0;0 0 1;0 1 0];
I=ind2rgb(patterns(:,:,gen_val),map);
axes(handles.axes_r);
imshow(I);

generations=str2num(get(handles.generations_val,'String'));
frequency=getappdata(0,'frequency');
axes(handles.axes_f);
plot(frequency(1:gen_val));
xlim([1 generations]);
ylim([0 1]);


% --- Executes during object creation, after setting all properties.
function slider_r_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function slider_val_Callback(hObject, eventdata, handles)
% hObject    handle to slider_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of slider_val as text
%        str2double(get(hObject,'String')) returns contents of slider_val as a double


% --- Executes during object creation, after setting all properties.
function slider_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in View_btn.
function View_btn_Callback(hObject, eventdata, handles)
% hObject    handle to View_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gen_val=str2num(get(handles.slider_val,'String'));
set(handles.slider_r,'Value',gen_val);

patterns= getappdata(0,'patterns');
map=[1 0 0;1 1 0;0 0 1;0 1 0];
I=ind2rgb(patterns(:,:,gen_val),map);
axes(handles.axes_r);
imshow(I);

generations=str2num(get(handles.generations_val,'String'));
frequency=getappdata(0,'frequency');
axes(handles.axes_f);
plot(frequency(1:gen_val));
xlim([1 generations]);
ylim([0 1]);


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


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over in2.
function in2_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to in2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in in2.
function in2_Callback(hObject, eventdata, handles)
% hObject    handle to in2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of in2
set(handles.in2_val,'Enable','on');
set(handles.in1_val,'Enable','off');


% --- Executes on button press in in1.
function in1_Callback(hObject, eventdata, handles)
% hObject    handle to in1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of in1
set(handles.in2_val,'Enable','off');
set(handles.in1_val,'Enable','on');


% --- Executes on button press in s3.
function s3_Callback(hObject, eventdata, handles)
% hObject    handle to s3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of s3


% --- Executes on button press in s1.
function s1_Callback(hObject, eventdata, handles)
% hObject    handle to s1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of s1


% --- Executes on button press in s2.
function s2_Callback(hObject, eventdata, handles)
% hObject    handle to s2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of s2


% --------------------------------------------------------------------
function file_Callback(hObject, eventdata, handles)
% hObject    handle to file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename,pathname]=uiputfile({ '*.bmp' , 'BMP files'; '*.jpg;','JPG files'},'Pick an Image');

if isequal(filename,0)||isequal(pathname,0)
    return ;
else

    fpath=fullfile(pathname,filename);

end

gen_val=str2num(get(handles.slider_val,'String'));

patterns= getappdata(0,'patterns');
map=[1 0 0;1 1 0;0 0 1;0 1 0];
I=ind2rgb(patterns(:,:,gen_val),map);

imwrite(I,fpath);


% --------------------------------------------------------------------
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in syn.
function syn_Callback(hObject, eventdata, handles)
% hObject    handle to syn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of syn


% --- Executes on button press in asy.
function asy_Callback(hObject, eventdata, handles)
% hObject    handle to asy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of asy


% --- Executes on button press in radiobutton13.
function radiobutton13_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton13


% --- Executes on button press in radiobutton14.
function radiobutton14_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton14


% --- Executes on button press in radiobutton15.
function radiobutton15_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton15


% --- Executes on button press in radiobutton16.
function radiobutton16_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton16


