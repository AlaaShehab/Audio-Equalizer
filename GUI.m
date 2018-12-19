function varargout = GUI(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
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


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)

global filterType;
%sampled rate chosen by user
global rate;
% sampled data after filter
global compositeY;
%array of gain for all band to be initialized --set in sliders
global bandGain;
%array of band data --set in filterig
global bandY
%original sampled data
global y;
%Original sample rate
global fs;
%volume of composite signal
global volume;
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);
compositeY = y;
bandY = ones(1, 9);
bandGain = ones(1, 9);
% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
%TODO convert db to gain (msh 3rfa ezay)
global bandGain;
bandGain(1) = get(handles.slider1, 'Value');
bandGain(1) = 10^(bandGain(1)/20.0);


function slider1_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
global bandGain;
bandGain(2) = get(handles.slider2, 'Value');
bandGain(2) = 10^(bandGain(2)/20.0);

function slider2_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
global bandGain;
bandGain(3) = get(handles.slider3, 'Value');
bandGain(3) = 10^(bandGain(3)/20.0);


function slider3_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)

global bandGain;
bandGain(4) = get(handles.slider4, 'Value');
bandGain(4) = 10^(bandGain(4)/20.0);


function slider4_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider5_Callback(hObject, eventdata, handles)
global bandGain;
bandGain(5) = get(handles.slider5, 'Value');
bandGain(5) = 10^(bandGain(5)/20.0);


function slider5_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider6_Callback(hObject, eventdata, handles)

global bandGain;
bandGain(6) = get(handles.slider6, 'Value');
bandGain(6) = 10^(bandGain(6)/20.0);


function slider6_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function slider7_Callback(hObject, eventdata, handles)
global bandGain;
bandGain(7) = get(handles.slider7, 'Value');
bandGain(7) = 10^(bandGain(7)/20.0);


function slider7_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



% --- Executes on slider movement.
function slider8_Callback(hObject, eventdata, handles)

global bandGain;
bandGain(8) = get(handles.slider8, 'Value');
bandGain(8) = 10^(bandGain(8)/20.0);


function slider8_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end




% --- Executes on slider movement.
function slider9_Callback(hObject, eventdata, handles)

global bandGain;
bandGain(9) = get(handles.slider9, 'Value');
bandGain(9) = 10^(bandGain(9)/20.0);

function slider9_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on selection change in popupmenuPlay.
function popupmenuPlay_Callback(hObject, eventdata, handles)
global y;
global fs;
global compositeY;
global rate;
value = get(handles.popupmenuPlay, 'Value');
if value == 2
    sound(y, fs);
end
if value==3
    sound(compositeY, rate);
end

% --- Executes during object creation, after setting all properties.
function popupmenuPlay_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

set(hObject, 'String', {"Play", "Original Audio", "Composite Audio"});
%--------------------------------------------------

% --- Executes on selection change in popupmenuPlot.
function popupmenuPlot_Callback(hObject, eventdata, handles)
value = get(handles.popupmenuPlot, 'Value');

plotSignal(value);

function popupmenuPlot_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject, 'String', {"Plot", "Original TD", "Original FD","Composite TD", "Composite FD","Band 1", "Band 2", "Band 3", "Band 4", "Band 5", "Band 6", "Band 7", "Band 8", "Band 9"});

%------------------------------------------------------------------------------------------
function plotSignal(value)
global y;
global fs;
global compositeY;
global bandY;
global rate;


switch value
    case 2
        Y = y(:,1);
        t = linspace(0, length(Y)/fs, length(Y));
        figure;
        plot(t,Y);
    case 3
        Y = y(:,1);
        f = -fs/2:fs/(length(Y)-1):fs/2;
        FFT_audio_in=fftshift(fft(Y))/length(fft(Y));
        figure;
        plot(f,abs(FFT_audio_in));
    case 4
        Y = compositeY(:,1);
        t = linspace(0, length(Y)/rate, length(Y));
        figure;
        plot(t,Y);
    case 5
        Y = compositeY(:,1);
        f = -rate/2:rate/(length(Y)-1):rate/2;
        FFT_audio_in=fftshift(fft(Y))/length(fft(Y));
        figure;
        plot(f,abs(FFT_audio_in));
    case 6
        Y = bandY(1);
        t = linspace(0, length(Y)/rate, length(Y));
        figure;
        plot(t,Y);
        f = -rate/2:rate/(length(Y)-1):rate/2;
        FFT_audio_in=fftshift(fft(Y))/length(fft(Y));
        figure;
        plot(f,abs(FFT_audio_in));
    case 7
        Y = bandY(2);
        t = linspace(0, length(Y)/rate, length(Y));
        figure;
        plot(t,Y);
        f = -rate/2:rate/(length(Y)-1):rate/2;
        FFT_audio_in=fftshift(fft(Y))/length(fft(Y));
        figure;
        plot(f,abs(FFT_audio_in));
    case 8
        Y = bandY(3);
        t = linspace(0, length(Y)/rate, length(Y));
        figure;
        plot(t,Y);
        f = -rate/2:rate/(length(Y)-1):rate/2;
        FFT_audio_in=fftshift(fft(Y))/length(fft(Y));
        figure;
        plot(f,abs(FFT_audio_in));
    case 9
        Y = bandY(4);
        t = linspace(0, length(Y)/rate, length(Y));
        figure;
        plot(t,Y);
        f = -rate/2:rate/(length(Y)-1):rate/2;
        FFT_audio_in=fftshift(fft(Y))/length(fft(Y));
        figure;
        plot(f,abs(FFT_audio_in));
    case 10
        Y = bandY(5);
        t = linspace(0, length(Y)/rate, length(Y));
        figure;
        plot(t,Y);
        f = -rate/2:rate/(length(Y)-1):rate/2;
        FFT_audio_in=fftshift(fft(Y))/length(fft(Y));
        figure;
        plot(f,abs(FFT_audio_in));
    case 11
        Y = bandY(6);
        t = linspace(0, length(Y)/rate, length(Y));
        figure;
        plot(t,Y);
        f = -rate/2:rate/(length(Y)-1):rate/2;
        FFT_audio_in=fftshift(fft(Y))/length(fft(Y));
        figure;
        plot(f,abs(FFT_audio_in));
    case 12
        Y = bandY(7);
        t = linspace(0, length(Y)/rate, length(Y));
        figure;
        plot(t,Y);
        f = -rate/2:rate/(length(Y)-1):rate/2;
        FFT_audio_in=fftshift(fft(Y))/length(fft(Y));
        figure;
        plot(f,abs(FFT_audio_in));
    case 13
        Y = bandY(8);
        t = linspace(0, length(Y)/rate, length(Y));
        figure;
        plot(t,Y);
        f = -rate/2:rate/(length(Y)-1):rate/2;
        FFT_audio_in=fftshift(fft(Y))/length(fft(Y));
        figure;
        plot(f,abs(FFT_audio_in));
    case 14
        Y = bandY(9);
        t = linspace(0, length(Y)/rate, length(Y));
        figure;
        plot(t,Y);
        f = -rate/2:rate/(length(Y)-1):rate/2;
        FFT_audio_in=fftshift(fft(Y))/length(fft(Y));
        figure;
        plot(f,abs(FFT_audio_in));
end
% --- Executes on selection change in popupmenuFilter.
function popupmenuFilter_Callback(hObject, eventdata, handles)
global filterType;
value = get(handles.popupmenuFilter, 'Value');
if value == 2
    filterType = "FIR";
end
if value==3
    filterType = "IIR";
end

%TODO call filter function a switch case to filter input

function popupmenuFilter_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

set(hObject, 'String', {"Filter Type", "FIR", "IIR"});

% --- Executes on selection change in popupmenuRate.
function popupmenuRate_Callback(hObject, eventdata, handles)
global fs;
global rate;
value = get(handles.popupmenuRate, 'Value');
if value == 2
    rate = fs;
end
if value==3
    rate = fs * 2;
end
if value==4
    rate = fs * 0.5;
end

function popupmenuRate_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

set(hObject, 'String', {"Sample Rate","1", "2", "0.5"});

% --- Executes on button press in pushbuttonWave.
function pushbuttonWave_Callback(hObject, eventdata, handles)

global fs;
global y;

fileName = uigetfile('*.wav','Select the Audio-file');
[y, fs] = audioread(fileName);


% --- Executes on slider movement.
function volumeSlider_Callback(hObject, eventdata, handles)
global volume;
volume = get(handles.volumeSlider, 'Value');
volume = 10^(volume/20.0);

function volumeSlider_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
