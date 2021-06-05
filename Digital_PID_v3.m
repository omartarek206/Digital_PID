function varargout = Digital_PID_v3(varargin)
% DIGITAL_PID_V3 MATLAB code for Digital_PID_v3.fig
%      DIGITAL_PID_V3, by itself, creates a new DIGITAL_PID_V3 or raises the existing
%      singleton*.
%
%      H = DIGITAL_PID_V3 returns the handle to a new DIGITAL_PID_V3 or the handle to
%      the existing singleton*.
%
%      DIGITAL_PID_V3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DIGITAL_PID_V3.M with the given input arguments.
%
%      DIGITAL_PID_V3('Property','Value',...) creates a new DIGITAL_PID_V3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Digital_PID_v3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Digital_PID_v3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Digital_PID_v3

% Last Modified by GUIDE v2.5 28-May-2021 05:08:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Digital_PID_v3_OpeningFcn, ...
                   'gui_OutputFcn',  @Digital_PID_v3_OutputFcn, ...
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


% --- Executes just before Digital_PID_v3 is made visible.
function Digital_PID_v3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Digital_PID_v3 (see VARARGIN)

% Choose default command line output for Digital_PID_v3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Digital_PID_v3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

%figure1 uipanel1 output
%radiobutton1 radiobutton2 radiobutton3 radiobutton4
%text1 text2 text3 text4 text5 text6
%edit1 edit2 edit3 edit4 edit5 edit6 edit7 edit8 edit9 edit10
%axes1 axes2

%figure1 uipanel1 output
%plant type (cont: radiobutton1, disc: radiobutton2)
%PID type (R(z): radiobutton3, R(1): radiobutton4)
%plant (num: text1/edit1, den: text2/edit2)
%delay  text4/edit4
%Ts     text3/edit3
%regulation (w0: text5/edit5, zeta: text6/edit6)
%regulation P(z) edit7
%R: edit8, S: edit9, T: edit10
%digitized plant (num: edit11, den: edit12)


%initial values
% {
set(handles.radiobutton1, 'value', 1);%continuous plant
    %continuous plant
set(handles.edit1, 'string','1');%numerator
set(handles.edit2, 'string','[10 1]');%denominator
set(handles.edit4, 'string','3');%plant delay tau (or d for discrete plant)

% 'Ashry - Add auxilary poles'
set(handles.edit14, 'string','0');
set(handles.edit15, 'string','0');
% 'Ashry - Add auxilary poles'

%}
%{
set(handles.radiobutton2, 'value', 1);%discrete plant
    %discrete plant
set(handles.edit1, 'string','[0 0.1813 0.2122]');%numerator
set(handles.edit2, 'string','[1 -0.6065]');%denominator
set(handles.edit4, 'string','0');%plant delay d (or tau for continuous plant)
%}
set(handles.edit3, 'string','5');%Ts
    %regulation
set(handles.edit5, 'string','0.05');%w0
set(handles.edit6, 'string','0.8');%zeta
pushbutton1_Callback(handles.pushbutton1, 0, handles);


% --- Outputs from this function are returned to the command line.
function varargout = Digital_PID_v3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes when figure1 is resized.
function figure1_ResizeFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit1_Callback(hObject, eventdata, handles)%plant numerator
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



function edit2_Callback(hObject, eventdata, handles)%plant denominator
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



function edit3_Callback(hObject, eventdata, handles)%sampling time Ts
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



function edit4_Callback(hObject, eventdata, handles)%plant delay d
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



function edit5_Callback(hObject, eventdata, handles)%regulation w0
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



function edit6_Callback(hObject, eventdata, handles)%regulation zeta
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



function edit7_Callback(hObject, eventdata, handles)%regulation P(z)
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



function edit8_Callback(hObject, eventdata, handles)%R(z)
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



function edit9_Callback(hObject, eventdata, handles)%S(z)
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



function edit10_Callback(hObject, eventdata, handles)%T(z)
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



function edit11_Callback(hObject, eventdata, handles)
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



function edit12_Callback(hObject, eventdata, handles)
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


% --------------------------------------------------------------------
function uipanel1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uipanel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% if get(handles.radiobutton1, 'value')%continuous plant
%     set(handles.text4, 'string','Plant delay (sec)');
% else
%     set(handles.text4, 'string','Plant delay (int)');
% end




function P=z_polynomial(w0, zeta, Ts, handles)
s=w0*(-zeta+i*sqrt(1-zeta*zeta));
z=exp(s*Ts);
rez=real(z); imz=imag(z);

% 'Ashry - Add auxilary poles'
P_No_aux=[1, -2*rez, rez*rez+imz*imz];
plant_order = length(str2num(get(handles.edit2, 'string')));



alpha_1 = str2double(get(handles.edit14, 'string'));
alpha_2 = str2double(get(handles.edit15, 'string'));

if plant_order == 2
    P = conv(P_No_aux,[1 -alpha_1]);
end

if plant_order == 3
    P = conv(P_No_aux,conv([1 -alpha_1],[1 -alpha_2]));
    
end
% 'Ashry - Add auxilary poles'    

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

function [B A P Ts]=acquire_data(handles)%B: plant num, A: plant den, P: regulation char. pol., Ts: sampling time
c=clock;
iteration_time=sprintf('%d-%d-%d %d:%d:%f', c(1), c(2), c(3), c(4), c(5), c(6))
%GET PLANT PTF
% {
Ts=str2double(get(handles.edit3, 'string'));
BW=0;
if get(handles.radiobutton1, 'value')%continuous plant
    num=str2num(get(handles.edit1, 'string'));
    den=str2num(get(handles.edit2, 'string'));
    delay=str2double(get(handles.edit4, 'string'));
    sysc=tf(num, den, 'iodelay', delay);
    %c2dOptions
    sysd=c2d(sysc, Ts, 'zoh');
    [B A]=tfdata(sysd, 'v');
    set(handles.text4, 'string','Plant delay (sec)');
    
    %get bandwidth
    BW=max(abs(roots(den)));
    
    %get discretized delay
    r1=step(sysd, 0:Ts:100);
    totaldelay=count_leading_zeros(r1);
    Bdelay=count_leading_zeros(B);
    B=padarray(B', totaldelay-Bdelay, 0, 'pre')';
    set(handles.edit11, 'string',['[' num2str(B) ']']);
    set(handles.edit12, 'string',['[' num2str(A) ']']);
else                                 %discrete plant
    B=str2num(get(handles.edit11, 'string'));
    A=str2num(get(handles.edit12, 'string'));
    %set(handles.text4, 'string','Plant delay (int)');
end
%}
%{
num=str2num(get(handles.edit1, 'string'));
den=str2num(get(handles.edit2, 'string'));
Ts   =str2double(get(handles.edit3, 'string'));
delay=str2double(get(handles.edit4, 'string'));
BW=0;
if get(handles.radiobutton1, 'value')%continuous plant
    sysc=tf(num, den, 'iodelay', delay);
    %c2dOptions
    sysd=c2d(sysc, Ts, 'zoh');
    [B A]=tfdata(sysd, 'v');
    set(handles.text4, 'string','Plant delay (sec)');
    
    %get bandwidth
    BW=max(abs(roots(den)));
    
    %get discretized delay
    r1=step(sysd, 0:Ts:100);
    totaldelay=count_leading_zeros(r1);
    Bdelay=count_leading_zeros(B);
    B=padarray(B', totaldelay-Bdelay, 0, 'pre')';
else                                 %discrete plant
    delay=round(delay);
    B=padarray(num', delay, 0, 'pre')';
    A=den;
    set(handles.text4, 'string','Plant delay (int)');
end
set(handles.edit11, 'string',['[' num2str(B) ']']);
set(handles.edit12, 'string',['[' num2str(A) ']']);
%}

%GET REGULATION CHAR. POL.
w0  =str2double(get(handles.edit5, 'string'));
zeta=str2double(get(handles.edit6, 'string'));
P=z_polynomial(w0, zeta, Ts, handles);
set(handles.edit7, 'string',['[' num2str(P) ']']);
BW=max([BW w0]);%rad/s
set(handles.figure1, 'NumberTitle','off', 'Name',sprintf('Digital PID v3. Nyquist period=%fs.', pi/BW));%%

function [c_r c_D U_r U_D]=calculate_CLTFs(B, A, R, S, T)%r reference, c plant output, U control signal, D disturbance
%TRANSFER FUNCTIONS
%c/r=TB/(AS+BR)
%c/D=AS/(AS+BR)
%U/r=TA/(AS+BR)
%U/D=AR/(AS+BR)
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
c_r=minreal(filt(conv(T, B), den));

%'c(z)/D(z):'
c_D=minreal(filt(AS, den));

%'U(z)/r(z):'
U_r=minreal(filt(conv(T, A), den));

%'U(z)/D(z):'
U_D=minreal(filt(conv(A, -R), den));

function [t X ref_size]=sim_response(sim_time, t_ref, t_dist, TF_ref, TF_dist, Ts, title, axes)
%MATLAB R2018
res_ref =step(TF_ref, 0:(sim_time-t_ref));
res_dist=step(TF_dist, 0:(sim_time-t_dist));

%MATLAB R2011
%res_ref =step(TF_ref, 0:Ts:(sim_time-t_ref));
%res_dist=step(TF_dist, 0:Ts:(sim_time-t_dist));


ref_size=size(res_ref);
%reference=padarray(reference, t_ref, 0, 'pre');
res_ref  =padarray(res_ref,  t_ref,  0, 'pre');
res_dist =padarray(res_dist, t_dist, 0, 'pre');
t=0:Ts:(sim_time*Ts);
X=res_ref-0.25*res_dist;%disturbance is a negative quarter-step
%stairs(axes, 0:Ts:(sim_time*Ts), res_ref-0.25*res_dist);
%stem(axes, 0:Ts:(sim_time*Ts), res_ref-0.25*res_dist);
%plot(axes, t, res_ref-0.25*res_dist, 'o');

%title(axes, sprintf('%s, disturbance at %g s', title, t_dist*Ts));%CRASH: Subscript indices must either be real positive integers or logicals.
%set(axes, 'XMinorGrid','on', 'YMinorGrid','on', 'title',sprintf('%s, disturbance at %g s', title, t_dist*Ts));%CRASH: Value must be a handle
%set(axes, 'XMinorGrid','on', 'YMinorGrid','on');

function plot_responses(c_r, c_D, U_r, U_D, Ts, handles)
%RESPONSE PLOTS
sim_time=100; t_ref=5; t_dist=50;

[t PlantOutput ref_size]=sim_response(sim_time, t_ref, t_dist, c_r, c_D, Ts, 'Plant output', handles.axes1);
reference=ones(ref_size);
reference=padarray(reference, t_ref, 0, 'pre');
%stairs(handles.axes1, t,PlantOutput);
plot(handles.axes1, t,reference,'.', t,PlantOutput,'o');
set(handles.axes1, 'XMinorGrid','on', 'YMinorGrid','on');
title(handles.axes1, sprintf('Plant output, step disturbance at %g s', t_dist*Ts));

[t ControlSignal ref_size]=sim_response(sim_time, t_ref, t_dist, U_r, U_D, Ts, 'Control signal', handles.axes2);
%stairs(handles.axes2, t,ControlSignal);
plot(handles.axes2, t,ControlSignal,'o');
set(handles.axes2, 'XMinorGrid','on', 'YMinorGrid','on');
title(handles.axes2, sprintf('Control signal, step disturbance at %g s', t_dist*Ts));


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)          %solve
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[Bp Ap P Ts]=acquire_data(handles);

%SOLUTION
A=conv(Ap, [1 -1])';%integrator to reject step disturbance
B=Bp';
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

R=SR((nB+1):(nB+nA))';
S_dash=SR(1:nB)';
S=conv(S_dash, [1 -1]);
if get(handles.radiobutton3, 'value')
    T=R;
else
    T=sum(R);
end
%T=P/sum(Bp);

set(handles.edit8, 'string',['[' num2str(R) ']']);
set(handles.edit9, 'string',['[' num2str(S) ']']);
set(handles.edit10, 'string',['[' num2str(T) ']']);
%set(handles.edit8, 'string',['R = [' num2str(R) ']']);
%set(handles.edit9, 'string',['S = [' num2str(S) ']']);
%set(handles.edit10, 'string',['T = [' num2str(T) ']']);

[c_r c_D U_r U_D]=calculate_CLTFs(Bp, Ap, R, S, T);
plot_responses(c_r, c_D, U_r, U_D, Ts, handles);



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)          %update plant only
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[Bp Ap P Ts]=acquire_data(handles);

R=str2num(get(handles.edit8, 'string'));
S=str2num(get(handles.edit9, 'string'));
T=str2num(get(handles.edit10, 'string'));

[c_r c_D U_r U_D]=calculate_CLTFs(Bp, Ap, R, S, T);
plot_responses(c_r, c_D, U_r, U_D, Ts, handles);


% 'Ashry - Add auxilary poles'
function edit14_Callback(hObject, eventdata, handles)
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



function edit15_Callback(hObject, eventdata, handles)
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
% 'Ashry - Add auxilary poles'