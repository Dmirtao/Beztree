function varargout = GUIfrontend(varargin)
% GUIFRONTEND MATLAB code for GUIfrontend.fig
%      GUIFRONTEND, by itself, creates a new GUIFRONTEND or raises the existing
%      singleton*.
%
%      H = GUIFRONTEND returns the handle to a new GUIFRONTEND or the handle to
%      the existing singleton*.
%
%      GUIFRONTEND('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIFRONTEND.M with the given input arguments.
%
%      GUIFRONTEND('Property','Value',...) creates a new GUIFRONTEND or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUIfrontend_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUIfrontend_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUIfrontend

% Last Modified by GUIDE v2.5 22-Apr-2018 20:45:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUIfrontend_OpeningFcn, ...
                   'gui_OutputFcn',  @GUIfrontend_OutputFcn, ...
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


% --- Executes just before GUIfrontend is made visible.
function GUIfrontend_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUIfrontend (see VARARGIN)

% Choose default command line output for GUIfrontend
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUIfrontend wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUIfrontend_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in RedrawAll.
function RedrawAll_Callback(hObject, eventdata, handles)
% hObject    handle to RedrawAll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in ResetAndClear.
function ResetAndClear_Callback(hObject, eventdata, handles)
% hObject    handle to ResetAndClear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in ProgressiveDraw.
function ProgressiveDraw_Callback(hObject, eventdata, handles)
% hObject    handle to ProgressiveDraw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in AnimateRotation.
function AnimateRotation_Callback(hObject, eventdata, handles)
% hObject    handle to AnimateRotation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function MaxGen_Callback(hObject, eventdata, handles)
% hObject    handle to MaxGen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function MaxGen_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MaxGen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on selection change in MaxGen.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to MaxGen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns MaxGen contents as cell array
%        contents{get(hObject,'Value')} returns selected item from MaxGen


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MaxGen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in CPNum.
function CPNum_Callback(hObject, eventdata, handles)
% hObject    handle to CPNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns CPNum contents as cell array
%        contents{get(hObject,'Value')} returns selected item from CPNum


% --- Executes during object creation, after setting all properties.
function CPNum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CPNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in MeanBranchNum.
function MeanBranchNum_Callback(hObject, eventdata, handles)
% hObject    handle to MeanBranchNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns MeanBranchNum contents as cell array
%        contents{get(hObject,'Value')} returns selected item from MeanBranchNum


% --- Executes during object creation, after setting all properties.
function MeanBranchNum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MeanBranchNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
