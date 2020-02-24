function varargout = SpikingNeuronSimulation(varargin)
% SPIKINGNEURONSIMULATION MATLAB code for SpikingNeuronSimulation.fig
%      SPIKINGNEURONSIMULATION, by itself, creates a new SPIKINGNEURONSIMULATION or raises the existing
%      singleton*.
%
%      H = SPIKINGNEURONSIMULATION returns the handle to a new SPIKINGNEURONSIMULATION or the handle to
%      the existing singleton*.
%
%      SPIKINGNEURONSIMULATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SPIKINGNEURONSIMULATION.M with the given input arguments.
%
%      SPIKINGNEURONSIMULATION('Property','Value',...) creates a new SPIKINGNEURONSIMULATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SpikingNeuronSimulation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SpikingNeuronSimulation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SpikingNeuronSimulation

% Last Modified by GUIDE v2.5 09-Jan-2020 02:59:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @SpikingNeuronSimulation_OpeningFcn, ...
    'gui_OutputFcn',  @SpikingNeuronSimulation_OutputFcn, ...
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


% --- Executes just before SpikingNeuronSimulation is made visible.
function SpikingNeuronSimulation_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SpikingNeuronSimulation (see VARARGIN)

% Choose default command line output for SpikingNeuronSimulation
handles.output = hObject;

% set(handles.figure1,'Units','Pixels','Position',get(0,'ScreenSize'),'outerposition',[0 0 1 1])
set(handles.figure1, 'units','normalized','outerposition',[0 0 1 1]);

set(handles.noiseValue,'Enable','off')
a = 0.02; b = 0.2; c=-65; d=8;
set(handles.aValue,'String',a)
set(handles.bValue,'String',b)
set(handles.cValue,'String',c)
set(handles.dValue,'String',d)
set(handles.pushbutton1,'String','Start')
set(handles.pushbutton1,'BackgroundColor',[0,0.7,0])

axes(handles.axes3)
I = imread('Neuron.jpg');
imshow(I)
axes(handles.axes4)
I = imread('Modos.jpg');
imshow(I)
axes(handles.axes5)
I = imread('flecha-derecha.jpg');
imshow(I)
axes(handles.axes6)
I = imread('flecha-derecha.jpg');
imshow(I)

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SpikingNeuronSimulation wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SpikingNeuronSimulation_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function aValue_Callback(hObject, eventdata, handles)
% hObject    handle to aValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of aValue as text
%        str2double(get(hObject,'String')) returns contents of aValue as a double


% --- Executes during object creation, after setting all properties.
function aValue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to aValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bValue_Callback(hObject, eventdata, handles)
% hObject    handle to bValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bValue as text
%        str2double(get(hObject,'String')) returns contents of bValue as a double


% --- Executes during object creation, after setting all properties.
function bValue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cValue_Callback(hObject, eventdata, handles)
% hObject    handle to cValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cValue as text
%        str2double(get(hObject,'String')) returns contents of cValue as a double


% --- Executes during object creation, after setting all properties.
function cValue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function dValue_Callback(hObject, eventdata, handles)
% hObject    handle to dValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dValue as text
%        str2double(get(hObject,'String')) returns contents of dValue as a double


% --- Executes during object creation, after setting all properties.
function dValue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function inputValue_Callback(hObject, eventdata, handles)
% hObject    handle to inputValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

handles.sliderValue = get(hObject,'Value')*500;
set(handles.inputLabel,'String',num2str(handles.sliderValue));
guidata(hObject, handles);



% --- Executes during object creation, after setting all properties.
function inputValue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of pushbutton1

if get(hObject,'Value')
    set(hObject,'BackgroundColor','r')
    set(hObject,'String','Stop')
    
    a = 0.02; b = 0.2; c=-65; d=8; % neocortical pyramidal neurons
    a=str2double(get(handles.aValue,'String'));
    b=str2double(get(handles.bValue,'String'));
    c=str2double(get(handles.cValue,'String'));
    d=str2double(get(handles.dValue,'String'));
    
    vPeak = 35;                   % spike cutoff
    dt=0.1;                   % Time span and step (ms)
    t=[0 dt];
    vr= -60;
    V = [vr vr]; u=0*V;           % Initial values
    numgraph=2000;
    Vplot=zeros(1,numgraph);
    tplot=zeros(1,numgraph);
    Iplot=zeros(1,numgraph);
    
    ii=0;
    % The main loop
    while get(hObject,'Value')==1
        ii=ii+1;
        sliderValue = get(handles.inputValue,'Value')*500;
        if get(handles.checkbox1,'Value')==1
            noise=get(handles.noiseValue,'Value')*(-50);
            sliderValue = awgn(sliderValue,noise);
        end
        %     disp(sliderValue)
        %    pause(0.1*get(findobj('tag','speed'),'value')^1);
        i=1;
        u(i+1)=u(i)+dt*(a*(b*V(i)-u(i)));
        V(i+1)=V(i)+dt*((0.04*(V(i))^2)+5*V(i)+140-u(i)+sliderValue);
        if V(i+1)>= vPeak              % a spike is fired!
            V(i) = vPeak;              % padding the spike amplitude
            V(i+1) = c;                % membrane voltage reset
            u(i+1) = u(i+1) + d;       % recovery variable update
        end
        
        Vplot=[Vplot(3:end),V];
        tplot=[tplot(3:end),t];
        Iplot=[Iplot(3:end),sliderValue, sliderValue];
        u(i)=u(i+1);
        V(i)=V(i+1);
        t=[t(2),t(2)+dt];
        
        if ii==5
            
            axes(handles.axes2);
            plot(tplot,Vplot,'b')
            ylim([-100,40])
            grid on;grid minor;
            ylabel(handles.axes2,'Membrane Potential (mV)','FontSize',14)
            xlabel(handles.axes2,'Time (ms)','FontSize',14)
            
            axes(handles.axes1);
            plot(tplot,Iplot,'b')
            ylim([-10,510])
            grid on;grid minor;
            ylabel(handles.axes1,'Current (I)','FontSize',14)
            xlabel(handles.axes1,'Time (ms)','FontSize',14)
            
            drawnow
            ii=0;
        end
        
        
        
    end
else
    set(hObject,'BackgroundColor','g')
    set(hObject,'String','Start')
    
end


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
if get(hObject,'Value')
    set(handles.noiseValue,'Enable','on')
    noise=get(handles.noiseValue,'Value')*(-50);
    set(handles.noiseValueLabel,'String',[num2str(noise) ' dB'])
else
    set(handles.noiseValue,'Enable','off')
    set(handles.noiseValueLabel,'String','')
end
guidata(hObject, handles);


% --- Executes on slider movement.
function noiseValue_Callback(hObject, eventdata, handles)
% hObject    handle to noiseValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
noise=get(handles.noiseValue,'Value')*(-50);
set(handles.noiseValueLabel,'String',[num2str(noise) ' dB'])
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function noiseValue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to noiseValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes during object deletion, before destroying properties.
function axes2_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbuttonClassification.
function pushbuttonClassification_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonClassification (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
SpikingNeuronSimulation_Classification;
