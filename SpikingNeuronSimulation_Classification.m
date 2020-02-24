function varargout = SpikingNeuronSimulation_Classification(varargin)
%SPIKINGNEURONSIMULATION_CLASSIFICATION MATLAB code file for SpikingNeuronSimulation_Classification.fig
%      SPIKINGNEURONSIMULATION_CLASSIFICATION, by itself, creates a new SPIKINGNEURONSIMULATION_CLASSIFICATION or raises the existing
%      singleton*.
%
%      H = SPIKINGNEURONSIMULATION_CLASSIFICATION returns the handle to a new SPIKINGNEURONSIMULATION_CLASSIFICATION or the handle to
%      the existing singleton*.
%
%      SPIKINGNEURONSIMULATION_CLASSIFICATION('Property','Value',...) creates a new SPIKINGNEURONSIMULATION_CLASSIFICATION using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to SpikingNeuronSimulation_Classification_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      SPIKINGNEURONSIMULATION_CLASSIFICATION('CALLBACK') and SPIKINGNEURONSIMULATION_CLASSIFICATION('CALLBACK',hObject,...) call the
%      local function named CALLBACK in SPIKINGNEURONSIMULATION_CLASSIFICATION.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SpikingNeuronSimulation_Classification

% Last Modified by GUIDE v2.5 09-Jan-2020 01:26:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SpikingNeuronSimulation_Classification_OpeningFcn, ...
                   'gui_OutputFcn',  @SpikingNeuronSimulation_Classification_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before SpikingNeuronSimulation_Classification is made visible.
function SpikingNeuronSimulation_Classification_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for SpikingNeuronSimulation_Classification
handles.output = hObject;

set(handles.labelAFRC1,'Visible','off')
set(handles.valueAFRC1,'Visible','off')
set(handles.labelAFRC2,'Visible','off')
set(handles.valueAFRC2,'Visible','off')
set(handles.labelAFRC3,'Visible','off')
set(handles.valueAFRC3,'Visible','off')
set(handles.labelAFRC4,'Visible','off')
set(handles.valueAFRC4,'Visible','off')
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SpikingNeuronSimulation_Classification wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SpikingNeuronSimulation_Classification_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


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


% --- Executes on button press in trainModel.
function trainModel_Callback(hObject, eventdata, handles)
% hObject    handle to trainModel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
guidata(hObject, handles);

set(handles.valueAFRC1,'String',num2str(0))
set(handles.valueAFRC2,'String',num2str(0))
set(handles.valueAFRC3,'String',num2str(0))
set(handles.valueAFRC4,'String',num2str(0))

contents = cellstr(get(handles.popupmenu1,'String'));
data = contents{get(handles.popupmenu1,'Value')};

switch data
    case 'AND'
        clases=2;
        modelN = [1];
        
    case 'OR'
        clases=2;
        modelN = [1];
        
    case 'XOR'
        clases=2;
        modelN = [1];
        
    case 'Spirals'
        clases=2;
        modelN = [10,1];
        
    case 'ClusterInCluster'
        clases=2;
        modelN = [4,1];
        
    case 'Corners'
        clases=4;
        modelN = [4,1];
        
    case 'Outlier'
        clases=4;
        modelN = [1];       
        
    case 'CrescentFullMoon'
        clases=2;
        modelN = [3,1];        
        
    case 'HalfKernel'
        clases=2;
        modelN = [3,1];
        
end

if clases == 2
    set(handles.labelAFRC1,'Visible','on')
    set(handles.valueAFRC1,'Visible','on')
    set(handles.labelAFRC2,'Visible','on')
    set(handles.valueAFRC2,'Visible','on')
    set(handles.labelAFRC3,'Visible','off')
    set(handles.valueAFRC3,'Visible','off')
    set(handles.labelAFRC4,'Visible','off')
    set(handles.valueAFRC4,'Visible','off')
end
if clases == 4
    set(handles.labelAFRC1,'Visible','on')
    set(handles.valueAFRC1,'Visible','on')
    set(handles.labelAFRC2,'Visible','on')
    set(handles.valueAFRC2,'Visible','on')
    set(handles.labelAFRC3,'Visible','on')
    set(handles.valueAFRC3,'Visible','on')
    set(handles.labelAFRC4,'Visible','on')
    set(handles.valueAFRC4,'Visible','on')
end

set(handles.nNeurons,'String',num2str(modelN(1)))

axes(handles.axes2)
cla;
rate = TrainSNN(data,modelN,1);

if clases == 2
    set(handles.valueAFRC1,'String',num2str(rate(1)))
    set(handles.valueAFRC2,'String',num2str(rate(2)))
end
if clases == 4
    set(handles.valueAFRC1,'String',num2str(rate(1)))
    set(handles.valueAFRC2,'String',num2str(rate(2)))
    set(handles.valueAFRC3,'String',num2str(rate(3)))
    set(handles.valueAFRC4,'String',num2str(rate(4)))
end


% --- Executes on button press in loadDataset.
function loadDataset_Callback(hObject, eventdata, handles)
% hObject    handle to loadDataset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
guidata(hObject, handles);
contents = cellstr(get(handles.popupmenu1,'String'));
data = contents{get(handles.popupmenu1,'Value')};

switch data
    case 'AND'
        clases=2;
    case 'OR'
        clases=2;
    case 'XOR'
        clases=2;
    case 'Spirals'
        clases=2;
    case 'ClusterInCluster'
        clases=2;
    case 'Corners'
        clases=4;
    case 'Outlier'
        clases=4;
    case 'CrescentFullMoon'
        clases=2;
    case 'HalfKernel'
        clases=2;    
end

if clases == 2
    set(handles.labelAFRC1,'Visible','on')
    set(handles.valueAFRC1,'Visible','on')
    set(handles.labelAFRC2,'Visible','on')
    set(handles.valueAFRC2,'Visible','on')
    set(handles.labelAFRC3,'Visible','off')
    set(handles.valueAFRC3,'Visible','off')
    set(handles.labelAFRC4,'Visible','off')
    set(handles.valueAFRC4,'Visible','off')
end
if clases == 4
    set(handles.labelAFRC1,'Visible','on')
    set(handles.valueAFRC1,'Visible','on')
    set(handles.labelAFRC2,'Visible','on')
    set(handles.valueAFRC2,'Visible','on')
    set(handles.labelAFRC3,'Visible','on')
    set(handles.valueAFRC3,'Visible','on')
    set(handles.labelAFRC4,'Visible','on')
    set(handles.valueAFRC4,'Visible','on')
end

axes(handles.axes2)
cla;
rate = TrainSNN(data,[1],0);
