function varargout = wave_visual(varargin)
% WAVE_VISUAL MATLAB code for wave_visual.fig
%      WAVE_VISUAL, by itself, creates a new WAVE_VISUAL or raises the existing
%      singleton*.
%
%      H = WAVE_VISUAL returns the handle to a new WAVE_VISUAL or the handle to
%      the existing singleton*.
%
%      WAVE_VISUAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WAVE_VISUAL.M with the given input arguments.
%
%      WAVE_VISUAL('Property','Value',...) creates a new WAVE_VISUAL or raises the
%      existing singleton*.  Starting from the left, property value pairs areTOILET
%      applied to the GUI before wave_visual_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to wave_visual_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help wave_visual

% Last Modified by GUIDE v2.5 19-Jun-2016 10:25:24

% Begin initialization code - DO NOT EDIT
global rotate_state;
rotate_state=0;
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @wave_visual_OpeningFcn, ...
                   'gui_OutputFcn',  @wave_visual_OutputFcn, ...
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

% --- Executes just before wave_visual is made visible.
function wave_visual_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to wave_visual (see VARARGIN)

% Choose default command line output for wave_visual
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% This sets up the initial plot - only do when we are invisible
% so window can get raised using wave_visual.
if strcmp(get(hObject,'Visible'),'off')
    m=1;
n=0;
a=0.025;
b=0.025;
f=20.84*1e9;
l=3e8/f*2;
omega=2*pi*f;
xs=0:a/6:a;
ys=0:b/6:b;
zs=0:l/6:l;
[x y z]=meshgrid(xs,ys,zs);
[ex ey ez hx hy hz]=rectwg_gather({[m n 0]},x,y,z,0,f,a,b,1,1,1);
    quiver3(z,x,y,real(ez),real(ex),real(ey));
    hold on;
    quiver3(z,x,y,real(hz),real(hx),real(hy),'r:');
    hold off;
    axis([-0.1*l,1.1*l,-0.1*a,1.1*a,-0.1*b,1.1*b]);
    box on;
end

% UIWAIT makes wave_visual wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = wave_visual_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function FileMenu_Callback(hObject, eventdata, handles)
% hObject    handle to FileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function OpenMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to OpenMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file = uigetfile('*.fig');
if ~isequal(file, 0)
    open(file);
end

% --------------------------------------------------------------------
function PrintMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to PrintMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
printdlg(handles.figure1)

% --------------------------------------------------------------------
function CloseMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to CloseMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name') '...'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end

delete(handles.figure1)


% --- Executes on selection change in popupmenu1.


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = get(handles.uitable1,'data');
disp(data{2});
newRowdata = cat(1,data,cell(1,size(data,2)));
set(handles.uitable1,'data',newRowdata)




% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla;
data = get(handles.uitable1,'data');
set(handles.uitable1,'data',cell(1,size(data,2)));



% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla;
data = get(handles.uitable1,'data');
if get(handles.radiobutton1,'value')
    option=1;
elseif get(handles.radiobutton2,'value')
    option=2;
elseif get(handles.radiobutton3,'value')
    option=3;
end
if get(handles.checkbox4,'value')
    show_type='js';
elseif get(handles.checkbox3,'value')
    show_type='j';
else
    if get(handles.checkbox1,'value')&get(handles.checkbox2,'value')
        show_type='eh';
    elseif get(handles.checkbox2,'value')
        show_type='h'
    else
        show_type='e';
    end
end
space_data=get(handles.uitable3,'data');
if isscalar(space_data{1})
    epsilon_r=(space_data{1});
else
    epsilon_r=1;
end
if isscalar(space_data{2})
    mu_r=(space_data{2});
else
    mu_r=1;
end
if isscalar(space_data{3})
    f=(space_data{3});
else
    f=20.84*1e9;
end
if isscalar(space_data{4})
    time=(space_data{4});
else
    time=10;
end
guide_data=get(handles.uitable4,'data');
if isscalar(guide_data{1})
    a=(guide_data{1})
else
    a=0.0125;
end
if isscalar(guide_data{2})
    b=(guide_data{2})
else
    b=0.0125;
end
if isscalar(guide_data{3})
    l=(guide_data{3})
else
    l=3*1e8/f*3;
end
if isscalar(guide_data{4})
    xss=(round(guide_data{4}));
else
    xss=7;
end
if isscalar(guide_data{5})
    yss=(round(guide_data{5}));
else
    yss=7;
end
if isscalar(guide_data{6})
    zss=(round(guide_data{6}));
else
    zss=7;
end
steps=[xss yss zss];
count=1;
for i=1:size(data,1)
    if strcmp(data{i,1},'TE')
        modes=0;
    elseif strcmp(data{i,1},'TM')
        modes=1;
    else
        continue;
    end
    if isscalar(data{i,2})&isscalar(data{i,3})&isscalar(data{i,4})&isscalar(data{i,5})
        if option~=3;
            m=(data{i,2});
            n=(data{i,3});
            A=(data{i,5});
            mode_list{count}=[m n modes];
        else
            m=(data{i,2});
            n=(data{i,3});
            p=(data{i,4});
            A=(data{i,5});
            mode_list{count}=[m n p modes];
        end
    else
        m=1;
        n=1;
        p=1;
        mode_list{count}=[m n 0];
    end
    count=count+1;
end
    switch option
    case 1
        xs=0:a/steps(1):a;
        ys=0:b/steps(2):b;
        zs=0:l/steps(3):l;
        [x y z]=meshgrid(xs,ys,zs);
        [ex ey ez hx hy hz jx jy jz]=rectwg_gather(mode_list,x,y,z,0,f,a,b,A,epsilon_r,mu_r);
        if strcmp(show_type,'js')
            jx=jx.*(z==l|y==b|x==a);
            jy=jy.*(z==l|y==b|x==a);
            jz=jz.*(z==l|y==b|x==a);
        end
    case 3
        xs=0:a/steps(1):a;
        ys=0:b/steps(2):b;
        zs=0:l/steps(3):l;
        [x y z]=meshgrid(xs,ys,zs);
        [ex ey ez hx hy hz jx jy jz]=rectres_gather(mode_list,x,y,z,f,a,b,l,A,epsilon_r,mu_r);
        if strcmp(show_type,'js')
            jx=jx.*(z==l|y==b|x==a);
            jy=jy.*(z==l|y==b|x==a);
            jz=jz.*(z==l|y==b|x==a);
        end
    case 2
        phis=0:pi/steps(1):2*pi;
        rhos=0:a/steps(2):a;
        zs=0:l/steps(3):l;
        [phi rho z]=meshgrid(phis,rhos,zs);
        [ephi,erho,ez,hphi,hrho,hz,jphi,jrho,jz]=cirwg_gather(mode_list,phi,rho,z,0,f,a,A,epsilon_r,mu_r);
        [x,y,jx,jy]=cyli2cart(phi,rho,jphi,jrho,jphi,jrho);
        [x,y,ex,ey,hx,hy]=cyli2cart(phi,rho,ephi,erho,hphi,hrho);
    otherwise
        error('unknown type');
    end
    switch show_type
    case 'e'
        quiver3(z,x,y,real(ez),real(ex),real(ey),'b');
    case 'h'
        quiver3(z,x,y,real(hz),real(hx),real(hy),'r');
    case 'eh'
        quiver3(z,x,y,real(ez),real(ex),real(ey),'b');
        hold on;
        quiver3(z,x,y,real(hz),real(hx),real(hy),'r:');
    otherwise
        quiver3(z,x,y,real(jz),real(jx),real(jy));
    end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global rotate_state;
if ~rotate_state
    rotate3d on;
    rotate_state=1;
else
    rotate3d off;
    rotate_state=0;
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% data = get(handles.uitable1,'data');
% if get(handles.radiobutton1,'value')
%     option=1;
% elseif get(handles.radiobutton2,'value')
%     option=2;
% elseif get(handles.radiobutton3,'value')
%     option=3;
% end
% if get(handles.checkbox4,'value')
%     show_type='js';
% elseif get(handles.checkbox3,'value')
%     show_type='j';
% else
%     if get(handles.checkbox1,'value')&get(handles.checkbox2,'value')
%         show_type='eh';
%     elseif get(handles.checkbox2,'value')
%         show_type='h'
%     else
%         show_type='e';
%     end
% end
% space_data=get(handles.uitable3,'data');
% if isscalar(space_data{1})
%     epsilon_r=(space_data{1});
% else
%     epsilon_r=1;
% end
% if isscalar(space_data{2})
%     mu_r=(space_data{2});
% else
%     mu_r=1;
% end
% if isscalar(space_data{3})
%     f=(space_data{3});
% else
%     f=20.84*1e9;
% end
% if isscalar(space_data{4})
%     time=(space_data{4});
% else
%     time=10;
% end
% guide_data=get(handles.uitable4,'data');
% if isscalar(guide_data{1})
%     a=(guide_data{1})
% else
%     a=0.0125;
% end
% if isscalar(guide_data{2})
%     b=(guide_data{2})
% else
%     b=0.0125;
% end
% if isscalar(guide_data{3})
%     l=(guide_data{3})
% else
%     l=3*1e8/f*3;
% end
% if isscalar(guide_data{3})
%     xss=(round(guide_data{3}));
% else
%     xss=7;
% end
% if isscalar(guide_data{3})
%     yss=(round(guide_data{3}));
% else
%     yss=7;
% end
% if isscalar(guide_data{3})
%     zss=(round(guide_data{3}));
% else
%     zss=7;
% end
% steps=[xss yss zss];
% for i=1:size(data,1)
%     if strcmp(data{i,1},'TE')
%         modes=0;
%     elseif strcmp(data{i,1},'TM')
%         modes=1;
%     else
%         continue;
%     end
%     if isscalar(data{1,2})&isscalar(data{1,3})&isscalar(data{1,4})&isscalar(data{1,5})
%         if option~=2;
%             m=(data{1,2});
%             n=(data{1,3});
%             A=(data{1,5});
%             mode_list{i}=[m n modes];
%         else
%             m=(data{1,2});
%             n=(data{1,3});
%             p=(data{1,4});
%             A=(data{1,5});
%             mode_list{i}=[m n p modes];
%         end
%     else
%         m=1;
%         n=1;
%         p=1;
%         mode_list{i}=[m n 0];
%     end
% end
cla;
data = get(handles.uitable1,'data');
if get(handles.radiobutton1,'value')
    option=1;
elseif get(handles.radiobutton2,'value')
    option=2;
elseif get(handles.radiobutton3,'value')
    option=3;
end
if get(handles.checkbox4,'value')
    show_type='js';
elseif get(handles.checkbox3,'value')
    show_type='j';
else
    if get(handles.checkbox1,'value')&get(handles.checkbox2,'value')
        show_type='eh';
    elseif get(handles.checkbox2,'value')
        show_type='h'
    else
        show_type='e';
    end
end
space_data=get(handles.uitable3,'data');
if isscalar(space_data{1})
    epsilon_r=(space_data{1});
else
    epsilon_r=1;
end
if isscalar(space_data{2})
    mu_r=(space_data{2});
else
    mu_r=1;
end
if isscalar(space_data{3})
    f=(space_data{3});
else
    f=20.84*1e9;
end
if isscalar(space_data{4})
    time=(space_data{4});
else
    time=10;
end
guide_data=get(handles.uitable4,'data');
if isscalar(guide_data{1})
    a=(guide_data{1})
else
    a=0.0125;
end
if isscalar(guide_data{2})
    b=(guide_data{2})
else
    b=0.0125;
end
if isscalar(guide_data{3})
    l=(guide_data{3})
else
    l=3*1e8/f*3;
end
if isscalar(guide_data{4})
    xss=(round(guide_data{4}));
else
    xss=7;
end
if isscalar(guide_data{5})
    yss=(round(guide_data{5}));
else
    yss=7;
end
if isscalar(guide_data{6})
    zss=(round(guide_data{6}));
else
    zss=7;
end
steps=[xss yss zss];

count=1;
for i=1:size(data,1)
    if strcmp(data{i,1},'TE')
        modes=0;
    elseif strcmp(data{i,1},'TM')
        modes=1;
    else
        continue;
    end
    if isscalar(data{i,2})&isscalar(data{i,3})&isscalar(data{i,4})&isscalar(data{i,5})
        if option~=3;
            m=(data{i,2});
            n=(data{i,3});
            A=(data{i,5});
            mode_list{count}=[m n modes];
        else
            m=(data{i,2});
            n=(data{i,3});
            p=(data{i,4});
            A=(data{i,5});
            mode_list{count}=[m n p modes];
        end
    else
        m=1;
        n=1;
        p=1;
        mode_list{count}=[m n 0];
    end
    count=count+1;
end
[az,el]=view;
cla;
    timelist=0:1/f/30:1/f;
    if option==1
        xs=0:a/steps(1):a;
        ys=0:b/steps(2):b;
        zs=0:l/steps(3):l;
        [x y z]=meshgrid(xs,ys,zs);
    else
        phis=0:pi/steps(1):2*pi;
        rhos=0:a/steps(2):a;
        zs=0:l/steps(3):l;
        [phi rho z]=meshgrid(phis,rhos,zs);
    end
    for i=1:30
        switch option
        case 1
            [ex ey ez hx hy hz jx jy jz]=rectwg_gather(mode_list,x,y,z,timelist(i),f,a,b,A,epsilon_r,mu_r);
            if strcmp(show_type,'js')
                jx=jx.*(z==l|y==b|x==a);
                jy=jy.*(z==l|y==b|x==a);
                jz=jz.*(z==l|y==b|x==a);
            end
        case 2
            [ephi,erho,ez,hphi,hrho,hz,jphi,jrho,jz]=cirwg_gather(mode_list,phi,rho,z,timelist(i),f,a,A,epsilon_r,mu_r);
            [x,y,jx,jy]=cyli2cart(phi,rho,jphi,jrho,jphi,jrho);
            [x,y,ex,ey,hx,hy]=cyli2cart(phi,rho,ephi,erho,hphi,hrho);
        otherwise
            %error('unknown type');
            ;
        end
        switch show_type
        case 'e'
            quiver3(z,x,y,real(ez),real(ex),real(ey),'b');
        case 'h'
            quiver3(z,x,y,real(hz),real(hx),real(hy),'r');
        case 'eh'
            quiver3(z,x,y,real(ez),real(ex),real(ey),'b');
            hold on;
            quiver3(z,x,y,real(hz),real(hx),real(hy),'r:');
        otherwise
            quiver3(z,x,y,real(jz),real(jx),real(jy));
        end
        hold off;
        view(az,el);
        box on;
        if option==2
            axis([-0.1*l,1.1*l,-1.1*a,1.1*a,-1.1*a,1.1*a]);
        else
            axis([-0.1*l,1.1*l,-0.1*a,1.1*a,-0.1*b,1.1*b]);
        end
        F(i)=getframe(gcf);
        cla;
    end
    movie(gcf,F,time);

% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3


% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(gcf,'Name','Waveguide & Resonator 3D Visualization')
% Hint: place code in OpeningFcn to populate axes1


% --- Executes during object deletion, before destroying properties.
function axes1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on mouse press over axes background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function uitable2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
handles.Data={1;1;10};     


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton2.
function pushbutton2_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
