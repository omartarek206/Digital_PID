function varargout = RST_PP_ID(varargin)
% RST_PP_ID MATLAB code for RST_PP_ID.fig
%      RST_PP_ID, by itself, creates a new RST_PP_ID or raises the existing
%      singleton*.
%
%      H = RST_PP_ID returns the handle to a new RST_PP_ID or the handle to
%      the existing singleton*.
%
%      RST_PP_ID('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RST_PP_ID.M with the given input arguments.
%
%      RST_PP_ID('Property','Value',...) creates a new RST_PP_ID or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before RST_PP_ID_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to RST_PP_ID_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help RST_PP_ID

% Last Modified by GUIDE v2.5 07-Jun-2021 21:40:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @RST_PP_ID_OpeningFcn, ...
                   'gui_OutputFcn',  @RST_PP_ID_OutputFcn, ...
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


% --- Executes just before RST_PP_ID is made visible.
function RST_PP_ID_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to RST_PP_ID (see VARARGIN)

% Choose default command line output for RST_PP_ID
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes RST_PP_ID wait for user response (see UIRESUME)
% uiwait(handles.figure1);
%handles
%figure1 output
%text1~19   edit1~19
%checkbox1 checkbox2 checkbox3
%pushbutton1 pushbutton2
%axes1 axes2

%Ts             text1/edit1
%Plant          delay: text2/edit2, num: text3/edit3, den: text4/edit4
%               B(z): text5/edit5, A(z): text6/edit6
%Regulation     w0: text7/edit7, zeta: text8/edit8, P(z): text11/edit11
%Tracking       w0: text9/edit9, zeta:text10/edit10
%               Bm(z): text12/edit12, Am(z): text13/edit13
%Hr: text14/edit14, Hs: text15/edit15, dist. freq.: text16/edit16
%R: text17/edit17, S: text18/edit18, T: text19/edit19
%Continuous plant: checkbox1, Cont. criteria: checkbox2
%Rem. zeros: checkbox3
%Update plant: pushbutton1, Solve: pushbutton2

set(handles.edit1, 'string','1');%Ts

        %continuous plant
set(handles.edit2, 'string','0.6');%delay   %3 0.6
set(handles.edit3, 'string','1');%num
set(handles.edit4, 'string','[10 1]');%den

set(handles.checkbox1, 'value',0);%continuous plant

        %discrete plant
set(handles.edit5, 'string','[0 0.1 0.2]');%Bp
set(handles.edit6, 'string','[1 -1.3 0.42]');%Ap

set(handles.checkbox2, 'value',1);%continuous design criteria

        %reguation P(z)
set(handles.edit7, 'string','0.4');%w0
set(handles.edit8, 'string','0.9');%zeta
set(handles.edit11, 'string','[1 -1.3741 0.4867]');%P (just in case)

        %tracking Bm(z)/Am(z)
set(handles.edit9, 'string','0.5');%w0
set(handles.edit10, 'string','0.9');%zeta
set(handles.edit12, 'string','[0.0927 0.0687]');%Bm
set(handles.edit13, 'string','[1 -1.2451 0.4066]');%Am (just in case)

set(handles.edit14, 'string','1');%Hr
set(handles.edit15, 'string','1');%Hs
set(handles.edit16, 'string','0');%disturcance cosine frequency
%set(handles.edit16, 'string','[1 -1]');%disturbance den

set(handles.checkbox3, 'value',0);
%set(handles.checkbox3, 'string','Unused');%cancel zeros
pushbutton2_Callback(0, 0, handles);
set(handles.edit20, 'string','0');
set(handles.edit21, 'string','0');


% --- Outputs from this function are returned to the command line.
function varargout = RST_PP_ID_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)%Ts
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



function edit2_Callback(hObject, eventdata, handles)%Plant cont delay
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



function edit3_Callback(hObject, eventdata, handles)%Plant cont num
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)%Plant cont den
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)%Bp(z)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)%Ap(z)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)%Reg. w0
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)%Reg. zeta
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)%Track w0
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)%Track zeta
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)%P(z)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)%Bm(z)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)%Am(z)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)%Hr
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit15_Callback(hObject, eventdata, handles)%Hs
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit16_Callback(hObject, eventdata, handles)%Disturbance den
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit17_Callback(hObject, eventdata, handles)%R
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit17 as text
%        str2double(get(hObject,'String')) returns contents of edit17 as a double


% --- Executes during object creation, after setting all properties.
function edit17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit18_Callback(hObject, eventdata, handles)%S
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit18 as text
%        str2double(get(hObject,'String')) returns contents of edit18 as a double


% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit19_Callback(hObject, eventdata, handles)%T
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit19 as text
%        str2double(get(hObject,'String')) returns contents of edit19 as a double


% --- Executes during object creation, after setting all properties.
function edit19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)%[ ] cont. plant
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)%[ ] cont. criteria
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)%[ ] remove zeros
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3


% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)%continuous curve
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4
[Ts Bp Ap Hr Hs dist P Bm Am]=acquire_data(handles);

R=str2num(get(handles.edit17, 'string'));%full R S T values
S=str2num(get(handles.edit18, 'string'));
T=str2num(get(handles.edit19, 'string'));

R=conv(R, Hr);
S=conv(S, Hs);
simulate_RST(Ts, Bp, Ap, R, S, T, Bm, Am, dist, handles);




function P=z_polynomial(w0, zeta, Ts, handles)
s=w0*(-zeta+1i*sqrt(1-zeta*zeta));
z=exp(s*Ts);
rez=real(z); imz=imag(z);
P_No_aux=[1, -2*rez, rez*rez+imz*imz];
plant_order = length(str2num(get(handles.edit4, 'string')));



alpha_1 = str2double(get(handles.edit20, 'string'));
alpha_2 = str2double(get(handles.edit21, 'string'));

if plant_order == 2
    P = conv(P_No_aux,[1 -alpha_1]);
end

if plant_order == 3
    P = conv(P_No_aux,conv([1 -alpha_1],[1 -alpha_2]));
    
end

function lz=count_leading_zeros(v)
size_v=size(v);
if size_v(1)<size_v(2)%horizontal vector
    v=v';
end
size_v=size(v);
lz=0;
for k=1:size_v(1)
    if v(k)==0
        lz=lz+1;
    else
        break;
    end
end

function [Ts B A Hr Hs dist P Bm Am]=acquire_data(handles)
c=clock;
iteration_time=sprintf('%d-%d-%d %d:%d:%f', c(1), c(2), c(3), c(4), c(5), c(6))

Ts=str2double(get(handles.edit1, 'string'));
BW=0;%rad/s
%GET PLANT PTF
if get(handles.checkbox1, 'value')%continuous plant
    num=str2num(get(handles.edit3, 'string'));
    den=str2num(get(handles.edit4, 'string'));
    delay=str2double(get(handles.edit2, 'string'));
    sysc=tf(num, den, 'iodelay', delay);
    sysd=c2d(sysc, Ts, 'zoh');
    [B A]=tfdata(sysd, 'v');
    
    %get bandwidth
    BW=max(abs(roots(den)));
    
    B=padarray(B', sysd.ioDelay, 0, 'pre')';
    %get discretized delay
    %r1=step(sysd, 0:Ts:100);
    %totaldelay=count_leading_zeros(r1);
    %Bdelay=count_leading_zeros(B);
    %B=padarray(B', totaldelay-Bdelay, 0, 'pre')';
    set(handles.edit5, 'string',['[' num2str(B) ']']);
    set(handles.edit6, 'string',['[' num2str(A) ']']);
else                                 %discrete plant
    B=str2num(get(handles.edit5, 'string'));
    A=str2num(get(handles.edit6, 'string'));
end
%GET REGULATION P(z) & TRACKING Bm(z)/Am(z)
if get(handles.checkbox2, 'value')%continuous design criteria
    w0  =str2double(get(handles.edit7, 'string'));
    zeta=str2double(get(handles.edit8, 'string'));
    P=z_polynomial(w0, zeta, Ts, handles);
    set(handles.edit11, 'string',['[' num2str(P) ']']);
    BW=max([BW w0]);
    
    w0  =str2double(get(handles.edit9, 'string'));
    zeta=str2double(get(handles.edit10, 'string'));
    Am=z_polynomial(w0, zeta, Ts, handles);
    set(handles.edit13, 'string',['[' num2str(Am) ']']);
    BW=max([BW w0]);
    
    Bm=sum(Am);%Bm(z)=Am(1)
    set(handles.edit12, 'string',['[' num2str(Bm) ']']);
else                            %discrete design criteria
    P =str2num(get(handles.edit11, 'string'));
    Am=str2num(get(handles.edit13, 'string'));
	Bm=str2num(get(handles.edit12, 'string'));
end
set(handles.figure1, 'NumberTitle','off', 'Name',sprintf('RST Pole Placement v2. Nyquist period=%fs.', pi/BW));%%

Hr=str2num(get(handles.edit14, 'string'));
Hs=str2num(get(handles.edit15, 'string'));
distf=str2double(get(handles.edit16, 'string'));
if distf==0
    dist=[1 -1];
else
    dist=[1, -2*cos(2*pi*distf*Ts), 1];
end

function no_int=has_no_integrator(A)%finds if A has no integrator
r=roots(A);
sr=size(r);
no_int=true;
tolerance=1e-6;
for k=1:sr(1)
    root=r(k);
    x=real(root); y=imag(root);
    if x>1-tolerance&&x<1+tolerance&&y>-tolerance&&y<tolerance
        no_int=false;
        break;
    end
end

function [B_stable B_unstable]=separate_B(B)
lz=count_leading_zeros(B);
gain=B(lz+1);%find polynomial gain
r=roots(B);
B_stable=1; B_unstable=1;
sr=size(r);
for k=1:sr(1)
    if abs(r(k))>=1 %unstable & critical zeros
        B_unstable=conv(B_unstable, [1 -r(k)]);
    else            %stable zeros
        B_stable=conv(B_stable, [1 -r(k)]);
    end
end
B_stable=B_stable*gain;%put the gain in the cancelled part
B_unstable=padarray(B_unstable', lz, 0, 'pre')';%put the delays in non-cancelled part

function [t X ref_size]=sim_response(sim_time, t_ref, t_dist, TF_ref, TF_dist, Ts)
res_ref =step(TF_ref, 0:(sim_time-t_ref));
res_dist=impulse(TF_dist, 0:(sim_time-t_dist));
ref_size=size(res_ref);
res_ref  =padarray(res_ref,  t_ref,  0, 'pre');
res_dist =padarray(res_dist, t_dist, 0, 'pre');
t=0:Ts:(sim_time*Ts);
X=res_ref-0.25*res_dist;%disturbance is a negative quarter-step

function simulate_RST(Ts, B, A, R, S, T, Bm, Am, dist, handles)
%CALCULATE TFs:
track=filt(Bm, Am);
AS=conv(A, S);
BR=conv(B, R);
size_AS=size(AS);
size_BR=size(BR);
if size_AS(2)>size_BR(2)%AS longer than BR
    BR=padarray(BR', size_AS(2)-size_BR(2), 0, 'post')';
else
    if size_AS(2)<size_BR(2)%BR longer than AS
        AS=padarray(AS', size_BR(2)-size_AS(2), 0, 'post')';
    end
end
den=AS+BR;

%'c(z)/r(z):'
c_r=minreal(track*filt(conv(T, B), den));

%'Output sensitivity fn c(z)/D(z):'
c_D=minreal(filt(AS, den));

%'U(z)/r(z):'
U_r=minreal(track*filt(conv(T, A), den));

%'U(z)/D(z):'
U_D=minreal(filt(conv(A, -R), den));

D=filt(1, dist);

%RESPONSE PLOTS
sim_time=100; t_ref=5; t_dist=50;
a1 = handles.axes1; a2 = handles.axes2; a3 = handles.axes3; a4 = handles.axes4;


continuous_curve=get(handles.checkbox4, 'value');
[t PlantOutput ref_size]=sim_response(sim_time, t_ref, t_dist, c_r, c_D*D, Ts);
reference=ones(ref_size);
reference=padarray(reference, t_ref, 0, 'pre');
%stairs(handles.axes1, t,PlantOutput);
if continuous_curve
    plot(a1, t,reference,'-', t,PlantOutput,'-');
else
    plot(a1, t,reference,'.', t,PlantOutput,'o');
end
set(a1, 'XMinorGrid','on', 'YMinorGrid','on');
title(a1, sprintf('Plant output, step disturbance at %g s', t_dist*Ts));

[t ControlSignal ref_size]=sim_response(sim_time, t_ref, t_dist, U_r, U_D*D, Ts);
%stairs(handles.axes2, t,ControlSignal);
if continuous_curve
    plot(a2, t,ControlSignal,'-');
else
    plot(a2, t,ControlSignal,'o');
end
set(a2, 'XMinorGrid','on', 'YMinorGrid','on');
title(a2, sprintf('Control signal, step disturbance at %g s', t_dist*Ts));


[H_Low_dB, F_Low] = robust_templates('L');
[H_Hi_dB, F_Hi] = robust_templates('H');

[H0,W0] = freqz(c_D.num{:}, c_D.den{:});
F = (W0)/(2*pi); H = 20*log10(abs(H0));
plot(a3, F, H, F_Low, H_Low_dB, '--black', F_Hi, H_Hi_dB, '--black');   %' Omar Tarek - Overlay figures'
a3.XLabel.String = 'Normalized Frequency (F/Fs)'; a3.YLabel.String = 'Amplitude (dB)';
a3.YLim = [-42 10];
set(a3, 'XMinorGrid','on', 'YMinorGrid','on');
title(a3, sprintf('Plant output senstivity function (Syp)'));

[H1, W1] = freqz(U_D.num{:}, U_D.den{:});
F = (W1)/(2*pi); H = 20*log10(abs(H1));
plot(a4, F, H);
a4.XLabel.String = 'Normalized Frequency (F/Fs)'; a4.YLabel.String = 'Amplitude (dB)';
set(a4, 'XMinorGrid','on', 'YMinorGrid','on');
title(a4, sprintf('Control signal senstivity function (Sup)'));


dcm = datacursormode;
dcm.Enable = 'on';
dcm.DisplayStyle = 'datatip';


%' Omar Tarek - Add Syp robust templates'
function [Hr, Fr] = robust_templates(selection)
if selection == 'H'
    [H_Hi,W_Hi] = freqz(1,[1 -1]);
    H_Hi_dB = 20*log10(1+abs(H_Hi)); F_Hi = (W_Hi)/(2*pi);
    for i = 1:size(H_Hi_dB)
        if (H_Hi_dB(i) > 6)
            H_Hi_dB(i) = 6 ;
        end
    end
    Hr = H_Hi_dB; Fr = F_Hi;
elseif selection == 'L'
    [H_Low,W_Low] = freqz(1,[1 -1]);
    H_Low_dB = 20*log10(1-abs(H_Low)); F_Low = (W_Low)/(2*pi);
    for i = 1:size(H_Low_dB)
        H_Low_dB(i) = -inf;
        if (H_Low_dB(i+1) < -55)
            break;
        end
    end
    Hr = H_Low_dB; Fr = F_Low;
end
%' Omar Tarek - Add Syp robust templates'


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)%update plant only
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[Ts Bp Ap Hr Hs dist P Bm Am]=acquire_data(handles);

R=str2num(get(handles.edit17, 'string'));%full R S T values
S=str2num(get(handles.edit18, 'string'));
T=str2num(get(handles.edit19, 'string'));

R=conv(R, Hr);
S=conv(S, Hs);
simulate_RST(Ts, Bp, Ap, R, S, T, Bm, Am, dist, handles);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)%solve
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[Ts Bp Ap Hr Hs dist P Bm Am]=acquire_data(handles);

Bps=[]; Bpu=[];
if get(handles.checkbox3, 'value')  %cancel stable zeros
    [Bps Bpu]=separate_B(Bp);
else                                %don't cancel
    Bps=1; Bpu=Bp;
end

%SOLUTION
%Ap Hs S + Bp Hr R = P      (no zeros cancelled)
S_has_integrator=has_no_integrator(Ap);
Hs_full=[];
if S_has_integrator
    Hs_full=conv(Hs, [1 -1]);
else
    Hs_full=Hs;
end
A=conv(Ap, Hs_full)';
B=conv(Bpu, Hr)';
nA=size(A); nA=nA(1)-1;%vertical vector size, power of z = size-1
nB=size(B); nB=nB(1)-1;
A=padarray(A, nB-1, 0, 'post');
B=padarray(B, nA-1, 0, 'post');
M=[];
for k=1:nB
    M=[M A];
    A=circshift(A, 1);
end
for k=(nB+1):(nB+nA)
    M=[M B];
    B=circshift(B, 1);
end
%M
n=size(M);  n=n(1);%M is a square matrix
nP=size(P); nP=nP(2);
P_full=padarray(P', n-nP, 0, 'post');
SR=M\P_full;

%Extract R, S, T
R=SR((nB+1):(nB+nA))';
S=SR(1:nB)';
if S_has_integrator
    S=conv(S, [1, -1]);
end
S=conv(S, Bps);
T=P/sum(Bpu);%(no zeros cancelled)
set(handles.edit17, 'string',['[' num2str(R) ']']);%full R S T values for Update plant & Simulink buttons
set(handles.edit18, 'string',['[' num2str(S) ']']);
set(handles.edit19, 'string',['[' num2str(T) ']']);

R=conv(R, Hr);
S=conv(S, Hs);
simulate_RST(Ts, Bp, Ap, R, S, T, Bm, Am, dist, handles);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)%generate Simulink model
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[Ts Bp Ap Hr Hs dist P Bm Am]=acquire_data(handles);

R=str2num(get(handles.edit17, 'string'));%full R S T values
S=str2num(get(handles.edit18, 'string'));
T=str2num(get(handles.edit19, 'string'));

%global it_counter;
%it_counter=it_counter+1;
c=clock;
name=sprintf('System_%d%02d%02d_%02d%02d_%02d', c(1), c(2), c(3), c(4), c(5), round(c(6)));

sim_time=100; t_ref=5; t_dist=50;
str_Ts=num2str(Ts);
x=0; y=0;
sys=new_system(name);
set_param(name, 'stoptime',num2str(sim_time));
x=x+0; y=y+100;%step position
add_block('Simulink/Sources/Step', [name '/Reference'], 'position',[x, y, x+30, y+30],...
    'time',num2str(t_ref*Ts), 'sampletime',str_Ts);
x=x+30;%step width

x=x+35;%spacing
add_block('simulink/Discrete/Discrete Filter', [name '/Bm(z)//Am(z)'], 'position',[x, y, x+195, y+30],...
    'numerator',['[' num2str(Bm) ']'], 'denominator',['[' num2str(Am) ']'], 'sampletime',str_Ts);
x=x+195;%tracking width
add_line(name, 'Reference/1', 'Bm(z)//Am(z)/1');

x=x+35;%spacing
add_block('simulink/Discrete/Discrete Filter', [name '/T(z)'], 'position',[x, y, x+195, y+30],...
    'numerator',['[' num2str(T) ']'], 'denominator','[1]', 'sampletime',str_Ts);
x=x+195;%T width
add_line(name, 'Bm(z)//Am(z)/1', 'T(z)/1');

x=x+25;%spacing
add_block('simulink/Math Operations/Sum', [name '/Sum1'], 'position',[x, y+5, x+20, y+5+20],...
    'inputs','|+-');
x=x+20;%sum width
add_line(name, 'T(z)/1', 'Sum1/1');

x=x+20;%spacing
add_block('simulink/Discrete/Discrete Filter', [name '/1//Hs(z)'], 'position',[x, y, x+195, y+30],...
    'numerator','[1]', 'denominator',['[' num2str(Hs) ']'], 'sampletime',str_Ts);
x=x+195;%Hs width
add_line(name, 'Sum1/1', '1//Hs(z)/1');

x=x+35;%spacing
add_block('simulink/Discrete/Discrete Filter', [name '/1//S(z)'], 'position',[x, y, x+195, y+30],...
    'numerator','[1]', 'denominator',['[' num2str(S) ']'], 'sampletime',str_Ts);
x=x+195;%S width
add_line(name, '1//Hs(z)/1', '1//S(z)/1');
%add_line(name, 'Sum1/1', '1//S(z)/1');

x=x+330;%make space for possible continuous plant
add_block('simulink/Math Operations/Sum', [name '/Sum2'], 'position',[x, y+5, x+20, y+5+20],...
    'inputs','++|');
x=x+20;%sum width

x=x-285;%return till after S
if get(handles.checkbox1, 'value')%continuous plant
    add_block('simulink/Discrete/Zero-Order Hold', [name '/Zero-Order Hold'], 'position',[x, y, x+35, y+30]);
    x=x+35;%ZOH width
    add_line(name, '1//S(z)/1', 'Zero-Order Hold/1');
    
    x=x+35;%spacing
    add_block('simulink/Continuous/Transport Delay', [name '/Plant Delay'], 'position',[x, y, x+30, y+30],...
        'delaytime',get(handles.edit2, 'string'));
    x=x+30;%delay width
    add_line(name, 'Zero-Order Hold/1', 'Plant Delay/1');
    
    x=x+35;%spacing
    add_block('simulink/Continuous/Transfer Fcn', [name '/Gp(s)'], 'position',[x, y, x+120, y+30],...
        'numerator',get(handles.edit3,'string'), 'denominator',get(handles.edit4,'string'));
    x=x+120;%Gp width
    add_line(name, 'Plant Delay/1', 'Gp(s)/1');
    add_line(name, 'Gp(s)/1', 'Sum2/2');
else%discrete plant
    add_block('simulink/Discrete/Discrete Filter', [name '/Bp(z)//Ap(z)'], 'position',[x, y, x+195, y+30],...
        'numerator',['[' num2str(Bp) ']'], 'denominator',['[' num2str(Ap) ']'], 'sampletime',str_Ts);
    x=x+195;%plant width
    add_line(name, '1//S(z)/1', 'Bp(z)//Ap(z)/1');
    add_line(name, 'Bp(z)//Ap(z)/1', 'Sum2/2');
end

x=x+35;%spacing till sum2
x=x-135;%new branch
add_block('simulink/Sources/Sine Wave', [name '/Disturbance'], 'position',[x, 0, x+30, 0+30],...
    'amplitude','-0.25', 'frequency',get(handles.edit16,'string'), 'phase','pi/2', 'sampletime',str_Ts);
x=x+30;%disturbance width

x=x+40;%spacing
add_block('simulink/Continuous/Transport Delay', [name '/Disturbance Delay'], 'position',[x, 0, x+30, 0+30],...
    'delaytime',num2str(t_dist*Ts));
x=x+30;%delay width
add_line(name, 'Disturbance/1', 'Disturbance Delay/1');
add_line(name, 'Disturbance Delay/1', 'Sum2/1');

x=x+125;%spacing from dist. delay till mux
add_block('simulink/Signal Routing/Mux', [name '/Mux'], 'position',[x, y-15, x+5, y-15+38]);
x=x+5;%mux width

x=x+35;%spacing
add_block('simulink/Sinks/Scope', [name '/Scope'], 'position',[x, y, x+30, y+32]);
add_line(name, '1//S(z)/1', 'Mux/1');
add_line(name, 'Sum2/1', 'Mux/2');
add_line(name, 'Mux/1', 'Scope/1');
%add_line(name, 'Sum2/1', 'Scope/1');

%feedback blocks
x=x-465; y=y+110;%from scope left edge to R
block_R=add_block('simulink/Discrete/Discrete Filter', [name '/R(z)'], 'position',[x, y, x+195, y+30],...
    'numerator',['[' num2str(R) ']'], 'denominator','[1]', 'sampletime',str_Ts, 'orientation','left');
%all=get(get_param(block_R, 'handle'))
x=x-195;%R width
add_line(name, 'Sum2/1', 'R(z)/1');

x=x-35;%spacing
add_block('simulink/Discrete/Discrete Filter', [name '/Hr(z)'], 'position',[x, y, x+195, y+30],...
    'numerator',['[' num2str(Hr) ']'], 'denominator','[1]', 'sampletime',str_Ts, 'orientation','left');
x=x-195;
add_line(name, 'R(z)/1', 'Hr(z)/1');
add_line(name, 'Hr(z)/1)', 'Sum1/2');
%add_line(name, 'R(z)/1)', 'Sum1/2');
open_system(sys);
%clear;




% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)%Import continuous plant from workspace
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tfname=input('Transfer function name in workspace: ', 's');
tfunc=evalin('base', tfname);
[num den]=tfdata(tfunc, 'v');
set(handles.checkbox1, 'value',1);%continuous plant
set(handles.edit2, 'string',num2str(tfunc.ioDelay));%delay
set(handles.edit3, 'string',['[' num2str(num) ']']);%num
set(handles.edit4, 'string',['[' num2str(den) ']']);%den


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)%Import discrete plant from workspace
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tfname=input('Transfer function name in workspace: ', 's');
tfunc=evalin('base', tfname);
[B A]=tfdata(tfunc, 'v');
B=padarray(B', tfunc.ioDelay, 0, 'pre')';
set(handles.checkbox1, 'value',0);%continuous plant
set(handles.edit5, 'string',['[' num2str(B) ']']);%Bp(z)
set(handles.edit6, 'string',['[' num2str(A) ']']);%Ap(z)

% 'Omar Tarek RST - Add clear button'
% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes1);
cla(handles.axes2);
cla(handles.axes3);
cla(handles.axes4);



function edit20_Callback(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit20 as text
%        str2double(get(hObject,'String')) returns contents of edit20 as a double


% --- Executes during object creation, after setting all properties.
function edit20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit21_Callback(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit21 as text
%        str2double(get(hObject,'String')) returns contents of edit21 as a double


% --- Executes during object creation, after setting all properties.
function edit21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
