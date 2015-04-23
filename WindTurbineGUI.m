function varargout = WindTurbineGUI(varargin)
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @WindTurbineGUI_OpeningFcn, ...
    'gui_OutputFcn',  @WindTurbineGUI_OutputFcn, ...
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
% --- Executes just before WindTurbineGUI is made visible.
function WindTurbineGUI_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
axes(handles.logoTg)
imshow('logo_dtu.jpg')
axes(handles.logoTg2)
imshow('LogoOfSoftware.png')
axes(handles.PlotResult)
imshow('logoplot.jpg')
guidata(hObject, handles);
function varargout = WindTurbineGUI_OutputFcn(hObject, eventdata, handles)
varargout{1} = handles.output;
function NumberOfNodes_Callback(hObject, eventdata, handles)
function NumberOfNodes_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function dthita_Callback(hObject, eventdata, handles)
function dthita_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function SimulationTime_Callback(hObject, eventdata, handles)
function SimulationTime_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function StreamtubeExpansion_Callback(hObject, eventdata, handles)
function TowerEffect_Callback(hObject, eventdata, handles)
function radiobutton1_Callback(hObject, eventdata, handles)
function radiobutton2_Callback(hObject, eventdata, handles)
function radiobutton3_Callback(hObject, eventdata, handles)
function radiobutton4_Callback(hObject, eventdata, handles)
function radiobutton5_Callback(hObject, eventdata, handles)
function Hs_Callback(hObject, eventdata, handles)
function Hs_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function Tp_Callback(hObject, eventdata, handles)
function Tp_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function SeaDepth_Callback(hObject, eventdata, handles)
function SeaDepth_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function WaveLength_Callback(hObject, eventdata, handles)
function WaveLength_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function VelocityEquator_Callback(hObject, eventdata, handles)
function VelocityEquator_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function WindShearExponent_Callback(hObject, eventdata, handles)
function WindShearExponent_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function TurbulenceWind_Callback(hObject, eventdata, handles)
function Gust_Callback(hObject, eventdata, handles)
function TimeGust_Callback(hObject, eventdata, handles)
function TimeGust_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function Intensity_Callback(hObject, eventdata, handles)
function Intensity_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function TowerMass_Callback(hObject, eventdata, handles)
function TowerMass_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function TowerInertia_Callback(hObject, eventdata, handles)
function TowerInertia_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function NoBlades_Callback(hObject, eventdata, handles)
function NoBlades_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function TypeWindTurbine_Callback(hObject, eventdata, handles)
function TypeWindTurbine_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function BladeMass_Callback(hObject, eventdata, handles)
function BladeMass_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function RotationalSpeed_Callback(hObject, eventdata, handles)
function RotationalSpeed_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function TypeOfFloater_Callback(hObject, eventdata, handles)
function TypeOfFloater_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function FloaterMass_Callback(hObject, eventdata, handles)
function FloaterMass_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function FloaterRadius_Callback(hObject, eventdata, handles)
function FloaterRadius_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function FloaterDraft_Callback(hObject, eventdata, handles)
function FloaterDraft_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function FloaterLength_Callback(hObject, eventdata, handles)
function FloaterLength_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function Airfoiltype_Callback(hObject, eventdata, handles)
function Airfoiltype_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function Chord_Callback(hObject, eventdata, handles)
function Chord_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function DynamicStallModel_Callback(hObject, eventdata, handles)
function DynamicStallModel_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function GenerateTables_Callback(hObject, eventdata, handles)
% --- Executes on button press in StartSimulation.
function StartSimulation_Callback(hObject, eventdata, handles)
%-------Default values ----------
fHighCut = 0.6;
lx = 340.2;
ly = 113.4;
l=340.2;
Z_r = 5;
%------------Simulation Inputs--------------------
NumberOfNodes = str2double(get(handles.NumberOfNodes,'String'));
dthita = str2double(get(handles.dthita,'String'));
if get(handles.StreamtubeExpansion,'Value')
    model = 'Stream Tube Expansion';
else
    model = 'No STE';
end
if  get(handles.TowerEffect,'Value')
    TowerEffect = 'Tower Effect';
else
    TowerEffect = 'No Tower Effect';
end
TotalTime = str2double(get(handles.SimulationTime,'String'));
Index1 = get(handles.DynamicStallModel,'Value');
list = get(handles.DynamicStallModel,'String');
StallModel  = {list{Index1}};
StallInTimeModel = {list{Index1}};
initialRemode = str2double(get(handles.InitialRemove ,'String'));
%------------------------------------------------------------
%--------------------Wind Conditions-------------------------
VatmosphericEquator = str2double(get(handles.VelocityEquator,'String'));
WindShearExponent = str2double(get(handles.WindShearExponent,'String'));
if  get(handles.TurbulenceWind,'Value')
    WindModel = 'Turbulence Model(Kaimal)';
    TurbulenceIntensity = str2double(get(handles.Intensity,'String'));
else
    disp('Constant wind changes internal on the code');%check this again
end
if  get(handles.Gust,'Value')
    Gust = 1;
    StartingTime = str2double(get(handles.TimeGust,'String'));
    Period = str2double(get(handles.PeriodGust,'String'));
else
    Gust = 0;
    StartingTime = 1;
    Period = 1;%check this again
end
%------------------------------------------------------------
%--------------------Wave Conditions-------------------------
Hs = str2double(get(handles.Hs,'String'));
Tp = str2double(get(handles.Tp,'String'));
SeaDepth  = str2double(get(handles.SeaDepth,'String'));
WaveLength = str2double(get(handles.WaveLength,'String'));
%------------------------------------------------------------
%--------------------Wind Turbine----------------------------
%Floater
FloaterMass = str2double(get(handles.FloaterMass,'String'));
FloaterRadius = str2double(get(handles.FloaterRadius,'String'));
FloaterDraft  = str2double(get(handles.FloaterDraft,'String'));
FloaterLength = str2double(get(handles.FloaterLength,'String'));
Kmoor  = str2double(get(handles.Kmoor,'String'));
Zmoor = str2double(get(handles.Zmoor,'String'));
InertiaXX = str2double(get(handles.InertiaXX,'String'));
Index2 = get(handles.TypeOfFloater,'Value');
list2 = get(handles.TypeOfFloater,'String');
FloaterType  = list2{Index2};
%blade
NumberOfBlades  = str2double(get(handles.NoBlades,'String'));
RotationalSpeed  = str2double(get(handles.RotationalSpeed,'String'));
chord  = str2double(get(handles.Chord,'String'));
if get(handles.Airfoiltype,'Value')==1
    thickness = chord * 0.12;
elseif get(handles.Airfoiltype,'Value')==2
    thickness = chord * 0.15;
else
    thickness = chord * 0.18;
end
listName = get(handles.Airfoiltype,'String');
nameAirfoil = listName{get(handles.Airfoiltype,'Value')};
BladeMass  = str2double(get(handles.BladeMass,'String'));
Height = str2double(get(handles.HalfHeight,'String'));
Radius  = str2double(get(handles.RadiusTurbine,'String'));
Index3 = get(handles.TypeWindTurbine,'Value');
list = get(handles.TypeWindTurbine,'String');
BladeType  = list{Index3};
%tower
TowerMass  = str2double(get(handles.TowerMass,'String'));
Inertia  = str2double(get(handles.TowerInertia,'String'));
TowerHeight  = str2double(get(handles.TowerHeight,'String'));
RadiusTower  = str2double(get(handles.TowerRadius,'String'));
IzzTR  = str2double(get(handles.InertiaZZtr,'String'));
%---------------------Start Calculations-------------------------------
test1= airfoil(nameAirfoil);
blade2 = blade(test1,Height,Radius,thickness,chord,BladeMass);
tower2 = tower(TowerMass,TowerHeight,RadiusTower,Inertia);
FloaterTest = floater(FloaterMass,InertiaXX,FloaterRadius,FloaterLength,FloaterType,FloaterDraft,Kmoor,Zmoor);
windturbine = windTurbine(NumberOfBlades,blade2,tower2,Z_r,BladeType,FloaterTest,IzzTR);
waveSimulation2 = waveSimulation(Hs,Tp,SeaDepth,WaveLength);
if  get(handles.Gyroscopic,'Value')
    GyroscopicEffect = 1;
else
    GyroscopicEffect = 0;
end
if  get(handles.KmoorAutoCalculate,'Value')
    KmoorAutoCalculate = 1;
else
    KmoorAutoCalculate = 0;
end
if  get(handles.GenerateTables,'Value')
    set(handles.loading,'String','Start of generation of table for various wind speeds')
    NrangeTable = str2double(get(handles.Ntables,'String'));
    Vrange = linspace(VatmosphericEquator-9,VatmosphericEquator+9,NrangeTable);
    for ii=1:length(Vrange)
        set(handles.loading,'String',['Loading of tables on :' num2str(round(10*((ii/length(Vrange))*100))/10) '%'])
        drawnow;
        windSimulation(ii) = WindSimulation(WindShearExponent,Vrange(ii),WindModel,TurbulenceIntensity,lx,ly,'AI',Gust,Period,StartingTime,0,6,50);
        test(ii) = simulation(windturbine,RotationalSpeed,windSimulation(ii),waveSimulation2,NumberOfNodes,dthita,model,TowerEffect,{'Static'},StallInTimeModel,TotalTime,fHighCut,'No',1,0,0,0,0,0,0,0);
        VtotalTrial(ii,:,:) = test(ii).Vtotal;
        localReynoldNumberTotalTrial(ii,:,:) = test(ii).localReynoldNumberTotal;
        InterferenceFactorTrial2(ii,:,:) = test(ii).InterferenceFactorTotal;
        Power(ii) = test(ii).averageCycleTorque*RotationalSpeed;
    end 
    Data.VTotal = VtotalTrial;
    Data.VelocityRange = Vrange;
    Data.localReynoldNumberTotal = localReynoldNumberTotalTrial;
    Data.InterferenceFactorTotaltrial = InterferenceFactorTrial2;
else
    set(handles.loading,'String','You didnt chouse to run ranged data.Please select available mat file for the calculations.')
    [filename,~,~] = uigetfile({'*.*'},'You didnt chouse to run ranged data.Please select available mat file for the calculations.');
    load(filename)
    set(handles.loading,'String','...')
end
windSimulation2 = WindSimulation(WindShearExponent,VatmosphericEquator,WindModel,TurbulenceIntensity,lx,ly,'AI',Gust,Period,StartingTime,0,6,50);
set(handles.loading,'String','Simulating Motion...')
drawnow;
if  get(handles.WindConditions,'Value')
    UseWind = 1;
else
    UseWind = 0;
end
if  get(handles.WaveConditions,'Value')
    UseWave= 1;
else
    UseWave = 0;
end
if  get(handles.ConstantWind,'Value')
    UseConstantWind= 1;
else
    UseConstantWind = 0;
end
InitialConditions  = str2num(get(handles.InitialConditions,'String'));
handles.Results = simulation(windturbine,RotationalSpeed,windSimulation2,waveSimulation2,NumberOfNodes,dthita,model,TowerEffect,StallModel,StallInTimeModel,TotalTime,fHighCut,'Yes',Data,initialRemode,UseWind,UseWave,UseConstantWind,InitialConditions,GyroscopicEffect,KmoorAutoCalculate);
guidata(hObject,handles)
%------------------Output Results----------------------------
set(handles.loading,'String','Simulation finished')
drawnow;
set(handles.TotalMass,'String',sprintf('Total Mass:%1.1e\n',handles.Results.windTurbine.Mass))
set(handles.Solidity,'String',sprintf('Solidity:%2.1f',handles.Results.windTurbine.Solidity))
set(handles.SwayPeriod,'String',sprintf('Sway Period:%2.1f',handles.Results.period_sway))
set(handles.SurgePeriod,'String',sprintf('Surge Period:%2.1f',handles.Results.period_surge))
set(handles.MeanSurge,'String',sprintf('Mean Surge:%2.2f',mean(handles.Results.Xmotion)))
set(handles.MeanSway,'String',sprintf('Mean Sway:%2.2f',mean(handles.Results.Ymotion)))
set(handles.STDsurge,'String',sprintf('StD Surge:%2.2f',std(handles.Results.Xmotion)))
set(handles.STDsway,'String',sprintf('StD Sway::%2.2f',std(handles.Results.Ymotion)))
tbeginIndex2 = find(floor(handles.Results.time)==initialRemode,1);
set(handles.WindMeanX,'String',sprintf('Wind:Mean in X:%1.1e\n',mean(handles.Results.FwindX(tbeginIndex2:end))))
set(handles.WindMeanY,'String',sprintf('Wind:Mean in Y:%1.1e\n',mean(handles.Results.FwindY(tbeginIndex2:end))))
set(handles.WaveMeanX,'String',sprintf('Wave:Mean in X:%1.1e\n',mean(handles.Results.FhydroX(tbeginIndex2:end))))
set(handles.WaveMeanY,'String',sprintf('Wave:Mean in Y:%1.1e\n',mean(handles.Results.FhydroY(tbeginIndex2:end))))
if get(handles.TypeOfFloater,'Value')==2
    set(handles.PitchPeriod,'String',['Pitch Period:' num2str(handles.Results.period_pitch)])
    set(handles.RollPeriod,'String',['Roll Period:' num2str(handles.Results.period_roll)])
    set(handles.MeanPitch,'String',['Mean Pitch:' num2str(rad2deg(mean(handles.Results.ThitaMotion)))])
    set(handles.MeanRoll,'String',['Mean Roll:' num2str(rad2deg(mean(handles.Results.FiMotion)))])
    set(handles.STDpitch,'String',['StD Pitch:' num2str(rad2deg(std(handles.Results.ThitaMotion)))])
    set(handles.STDroll,'String',['StD Roll:' num2str(rad2deg(std(handles.Results.FiMotion)))])
end

function PeriodGust_Callback(hObject, eventdata, handles)
function PeriodGust_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function TowerHeight_Callback(hObject, eventdata, handles)
function TowerHeight_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function TowerRadius_Callback(hObject, eventdata, handles)
function TowerRadius_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function RadiusTurbine_Callback(hObject, eventdata, handles)
function RadiusTurbine_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function HalfHeight_Callback(hObject, eventdata, handles)
function HalfHeight_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function Kmoor_Callback(hObject, eventdata, handles)
function Kmoor_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function Zmoor_Callback(hObject, eventdata, handles)
function Zmoor_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function InertiaXX_Callback(hObject, eventdata, handles)
function InertiaXX_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function DefaultDesigns_Callback(hObject, eventdata, handles)
function TLPdesign_Callback(hObject, eventdata, handles)
set(handles.NumberOfNodes,'String','50')
set(handles.dthita,'String','5')
set(handles.StreamtubeExpansion,'Value',1)
set(handles.TowerEffect,'Value',0)
set(handles.SimulationTime,'String','3000')
set(handles.DynamicStallModel,'Value',1)
set(handles.VelocityEquator,'String','13')
set(handles.WindShearExponent,'String','0.1429')
set(handles.TurbulenceWind,'Value',1)
set(handles.Intensity,'String','0.12')
set(handles.Gust,'Value',0)
set(handles.Hs,'String','6')
set(handles.Tp,'String','10')
set(handles.SeaDepth,'String','200')
set(handles.WaveLength,'String','10')
set(handles.FloaterMass,'String','8774000')
set(handles.FloaterRadius,'String','8.8')
set(handles.FloaterDraft,'String','47.89')
set(handles.Kmoor,'String','41180')
set(handles.Zmoor,'String','-70')
set(handles.InertiaXX,'String','4229230000')
set(handles.TypeOfFloater,'Value',1)
set(handles.NoBlades,'String','2')
set(handles.RotationalSpeed,'String','1.5')
set(handles.Chord,'String','4')
set(handles.BladeMass,'String','10')
set(handles.HalfHeight,'String','45')
set(handles.RadiusTurbine,'String','46')
set(handles.TypeWindTurbine,'Value',8)
set(handles.TowerMass,'String','518500')
set(handles.TowerInertia,'String','121700000')
set(handles.TowerHeight,'String','90')
set(handles.TowerRadius,'String','3')
set(handles.GenerateTables,'Value',1)
set(handles.FloaterLength,'String','47.89')
set(handles.InitialRemove,'String','500')
set(handles.WindConditions,'Value',1)
set(handles.WaveConditions,'Value',1)
set(handles.ConstantWind,'Value',0)
set(handles.InitialConditions,'String','[0 0 0 0]')
set(handles.Ntables,'String','20')
set(handles.Airfoiltype,'Value',2)
set(handles.Gyroscopic,'Value',0)
set(handles.KmoorAutoCalculate,'Value',0)
function BuoyDesign_Callback(hObject, eventdata, handles)
set(handles.NumberOfNodes,'String','50')
set(handles.dthita,'String','5')
set(handles.StreamtubeExpansion,'Value',1)
set(handles.TowerEffect,'Value',0)
set(handles.SimulationTime,'String','3000')
set(handles.DynamicStallModel,'Value',1)
set(handles.VelocityEquator,'String','13')
set(handles.WindShearExponent,'String','0.1429')
set(handles.TurbulenceWind,'Value',1)
set(handles.Intensity,'String','0.12')
set(handles.Gust,'Value',0)
set(handles.Hs,'String','6')
set(handles.Tp,'String','10')
set(handles.SeaDepth,'String','320')
set(handles.WaveLength,'String','10')
set(handles.FloaterMass,'String','7466330')
set(handles.FloaterRadius,'String','4.7')
set(handles.FloaterDraft,'String','113.4')
set(handles.Kmoor,'String','41180')
set(handles.Zmoor,'String','-70')
set(handles.InertiaXX,'String','4229230000')%what to put here
set(handles.TypeOfFloater,'Value',2)
set(handles.NoBlades,'String','2')
set(handles.RotationalSpeed,'String','1.55')
set(handles.Chord,'String','4')
set(handles.BladeMass,'String','175000')%what to put here
set(handles.HalfHeight,'String','45')
set(handles.RadiusTurbine,'String','46')
set(handles.TypeWindTurbine,'Value',8)
set(handles.TowerMass,'String','250000')
set(handles.TowerInertia,'String','121700000')
set(handles.TowerHeight,'String','90')
set(handles.TowerRadius,'String','3')
set(handles.GenerateTables,'Value',1)
set(handles.FloaterLength,'String','113.4')
set(handles.InitialRemove,'String','500')
set(handles.WindConditions,'Value',1)
set(handles.WaveConditions,'Value',1)
set(handles.ConstantWind,'Value',0)
set(handles.InitialConditions,'String','[0 0 0 0 0 0 0 0]')
set(handles.Ntables,'String','20')
set(handles.Airfoiltype,'Value',2)
set(handles.Gyroscopic,'Value',1)
set(handles.KmoorAutoCalculate,'Value',0)
set(handles.InertiaZZtr,'String','2000000000')
function Help_Callback(hObject, eventdata, handles)
function File_Callback(hObject, eventdata, handles)
function New_Callback(hObject, eventdata, handles)
axes(handles.PlotResult)
imshow('logoplot.jpg')
set(handles.loading,'String','Classes and objects are deleted.A new simulation can start.')
clear classes
function Exit_Callback(hObject, eventdata, handles)
close(handles.figure1)
function About_Callback(hObject, eventdata, handles)
msgbox({'This program was created to fullfil' 'the requriments of my Master Thesis in DTU.' 'Its a solver for Offshore Vertical Axis Wind Turbines' 'Dimitris Bizopoulos'},'About')
function Tutorial_Callback(hObject, eventdata, handles)
msgbox({'-Double Multiple Streamtube model for aerodynamics forces' '-Morrison equation for hydrodynamic forces' '-Ode4 is used for the kinetic modeling' '' '**Further info can be found in the report'},'Info')
function Results_Callback(hObject, eventdata, handles)
function InitialRemove_Callback(hObject, eventdata, handles)
function InitialRemove_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function TimeDomain_Callback(hObject, eventdata, handles)
function FrequencyDomain_Callback(hObject, eventdata, handles)
function PDsurge_Callback(hObject, eventdata, handles)
cla(handles.PlotResult)
plot(handles.Results.fFFT,10*log10(handles.Results.psSurgeX),'Color','k'),set(gca,'xlim',[0 0.7])
grid on
title('Periodogram for Surge')
xlabel('Frequency (Hz)')
ylabel('Power/Frequency (dB/Hz)')

hold on
plot([1/handles.Results.period_surge 1/handles.Results.period_surge],ylim,':','lineWidth',1,'Color','r')
if get(handles.TypeOfFloater,'Value')== 2
    plot([1/handles.Results.period_pitch 1/handles.Results.period_pitch],ylim,':','Color','r')
end
hold off
function PDsway_Callback(hObject, eventdata, handles)
cla(handles.PlotResult)
plot(handles.Results.fFFT,10*log10(handles.Results.psSurgeY),'Color','k'),set(gca,'xlim',[0 0.7])
grid on
title('Periodogram Using FFT')
xlabel('Frequency (Hz)')
ylabel('Power/Frequency (dB/Hz)')
hold on
plot([1/handles.Results.period_surge 1/handles.Results.period_surge],ylim,':','lineWidth',1,'Color','r')
if get(handles.TypeOfFloater,'Value')== 2
    plot([1/handles.Results.period_pitch 1/handles.Results.period_pitch],ylim,':','Color','r')
end

function PDpitch_Callback(hObject, eventdata, handles)
cla(handles.PlotResult)
if get(handles.TypeOfFloater,'Value')== 2
    plot(handles.Results.fFFT,10*log10(handles.Results.psThitaX),'Color','k'),set(gca,'xlim',[0 0.7])
    grid on
    title('Periodogram Using FFT')
    xlabel('Frequency (Hz)')
    ylabel('Power/Frequency (dB/Hz)')
    hold on
    plot([1/handles.Results.period_surge 1/handles.Results.period_surge],ylim,':','lineWidth',1,'Color','r')
    hold on
    plot([1/handles.Results.period_pitch 1/handles.Results.period_pitch],ylim,':','Color','r')
else
    
    set(handles.loading,'String','Pitch Motion is not available in TLP design')
end
function PDroll_Callback(hObject, eventdata, handles)
cla(handles.PlotResult)
if get(handles.TypeOfFloater,'Value')== 2
    plot(handles.Results.fFFT,10*log10(handles.Results.psFiY),'Color','k'),set(gca,'xlim',[0 0.7])
    title('Periodogram Using FFT')
    xlabel('Frequency (Hz)')
    ylabel('Power/Frequency (dB/Hz)')
    grid on
    hold on
    plot([1/handles.Results.period_surge 1/handles.Results.period_surge],ylim,':','lineWidth',1,'Color','r')
    hold on
    plot([1/handles.Results.period_pitch 1/handles.Results.period_pitch],ylim,':','Color','r')
else
    
    set(handles.loading,'String','Roll  Motion is not available in TLP design')
end
function SurgeDisplacement_Callback(hObject, eventdata, handles)
function SwayDisplacement_Callback(hObject, eventdata, handles)
function PitchDisplacement_Callback(hObject, eventdata, handles)
function RollDisplacement_Callback(hObject, eventdata, handles)
function WithRoll_Callback(hObject, eventdata, handles)
cla(handles.PlotResult)
plot(handles.PlotResult,handles.Results.time,rad2deg(handles.Results.Roll),'Color','k')
hold on
line([min(handles.Results.time) max(handles.Results.time)],[rad2deg(mean(handles.Results.Roll)) rad2deg(mean(handles.Results.Roll))],'Color',[0.8 0 0])
h=line([min(handles.Results.time) max(handles.Results.time)],[rad2deg(mean(handles.Results.Roll)+std(handles.Results.Roll)) rad2deg(mean(handles.Results.Roll)+std(handles.Results.Roll))],'Color','r');
s = h.LineStyle;
h.LineStyle = ':';
h=line([min(handles.Results.time) max(handles.Results.time)],[rad2deg(mean(handles.Results.Roll)-std(handles.Results.Roll)) rad2deg(mean(handles.Results.Roll)-std(handles.Results.Roll))],'Color','r');
s = h.LineStyle;
h.LineStyle = ':';
hold off
xlim([min(handles.Results.time) max(handles.Results.time)])
grid on
title('Roll Degree(Incl initial time) [o]')
xlabel('Time [s]')
ylabel('Degree [o]')
function WithoutRoll_Callback(hObject, eventdata, handles)
cla(handles.PlotResult)
plot(handles.PlotResult,handles.Results.time2,rad2deg(handles.Results.FiMotion),'Color','k')
hold on
line([min(handles.Results.time2) max(handles.Results.time2)],[rad2deg(mean(handles.Results.FiMotion)) rad2deg(mean(handles.Results.FiMotion))],'Color',[0.8 0 0])
h=line([min(handles.Results.time2) max(handles.Results.time2)],[rad2deg(mean(handles.Results.FiMotion)+std(handles.Results.FiMotion)) rad2deg(mean(handles.Results.FiMotion)+std(handles.Results.FiMotion))],'Color','r');
s = h.LineStyle;
h.LineStyle = ':';
h=line([min(handles.Results.time2) max(handles.Results.time2)],[rad2deg(mean(handles.Results.FiMotion)-std(handles.Results.FiMotion)) rad2deg(mean(handles.Results.FiMotion)-std(handles.Results.FiMotion))],'Color','r');
s = h.LineStyle;
h.LineStyle = ':';
hold off
xlim([min(handles.Results.time2) max(handles.Results.time2)])
grid on
title('Roll Degree [o]')
xlabel('Time [s]')
ylabel('Degree [o]')
function WithPitch_Callback(~, eventdata, handles)
cla(handles.PlotResult)
plot(handles.PlotResult,handles.Results.time,rad2deg(handles.Results.Pitch),'Color','k')
hold on
line([min(handles.Results.time) max(handles.Results.time)],[rad2deg(mean(handles.Results.Pitch)) rad2deg(mean(handles.Results.Pitch))],'Color',[0.8 0 0])
h=line([min(handles.Results.time) max(handles.Results.time)],[rad2deg(mean(handles.Results.Pitch)+std(handles.Results.Pitch)) rad2deg(mean(handles.Results.Pitch)+std(handles.Results.Pitch))],'Color','r');
s = h.LineStyle;
h.LineStyle = ':';
h=line([min(handles.Results.time) max(handles.Results.time)],[rad2deg(mean(handles.Results.Pitch)-std(handles.Results.Pitch)) rad2deg(mean(handles.Results.Pitch)-std(handles.Results.Pitch))],'Color','r');
s = h.LineStyle;
h.LineStyle = ':';
hold off
xlim([min(handles.Results.time) max(handles.Results.time)])
grid on
title('Pitch Degree [o]')
xlabel('Time [s]')
ylabel('Degree [o]')
function WithoutPitch_Callback(hObject, eventdata, handles)
cla(handles.PlotResult)
plot(handles.PlotResult,handles.Results.time2,rad2deg(handles.Results.ThitaMotion),'Color','k')
hold on
line([min(handles.Results.time2) max(handles.Results.time2)],[rad2deg(mean(handles.Results.ThitaMotion)) rad2deg(mean(handles.Results.ThitaMotion))],'Color',[0.8 0 0])
h=line([min(handles.Results.time2) max(handles.Results.time2)],[rad2deg(mean(handles.Results.ThitaMotion)+std(handles.Results.ThitaMotion)) rad2deg(mean(handles.Results.ThitaMotion)+std(handles.Results.ThitaMotion))],'Color','r');
s = h.LineStyle;
h.LineStyle = ':';
h=line([min(handles.Results.time2) max(handles.Results.time2)],[rad2deg(mean(handles.Results.ThitaMotion)-std(handles.Results.ThitaMotion)) rad2deg(mean(handles.Results.ThitaMotion)-std(handles.Results.ThitaMotion))],'Color','r');
s = h.LineStyle;
h.LineStyle = ':';
hold off
xlim([min(handles.Results.time2) max(handles.Results.time2)])
grid on
title('Roll Degree [o]')
xlabel('Time [s]')
ylabel('Degree [o]')
function WithSway_Callback(hObject, eventdata, handles)
cla(handles.PlotResult)
plot(handles.PlotResult,handles.Results.time,handles.Results.Sway,'Color','k')
hold on
line([min(handles.Results.time) max(handles.Results.time)],[mean(handles.Results.Sway) mean(handles.Results.Sway)],'Color',[0.8 0 0])
h=line([min(handles.Results.time) max(handles.Results.time)],[mean(handles.Results.Sway)+std(handles.Results.Sway) mean(handles.Results.Sway)+std(handles.Results.Sway)],'Color','r');
s = h.LineStyle;
h.LineStyle = ':';
h=line([min(handles.Results.time) max(handles.Results.time)],[mean(handles.Results.Sway)-std(handles.Results.Sway) mean(handles.Results.Sway)-std(handles.Results.Sway)],'Color','r');
s = h.LineStyle;
h.LineStyle = ':';
hold off
xlim([min(handles.Results.time) max(handles.Results.time)])
grid on
title('Sway Displacement(Incl initial time) [m]')
xlabel('Time [s]')
ylabel('Displacement [m]')
function WithoutSway_Callback(hObject, eventdata, handles)
cla(handles.PlotResult)
plot(handles.PlotResult,handles.Results.time2,handles.Results.Ymotion,'Color','k')
hold on
line([min(handles.Results.time2) max(handles.Results.time2)],[mean(handles.Results.Ymotion) mean(handles.Results.Ymotion)],'Color',[0.8 0 0])
h=line([min(handles.Results.time2) max(handles.Results.time2)],[mean(handles.Results.Ymotion)+std(handles.Results.Ymotion) mean(handles.Results.Ymotion)+std(handles.Results.Ymotion)],'Color','r');
s = h.LineStyle;
h.LineStyle = ':';
h=line([min(handles.Results.time2) max(handles.Results.time2)],[mean(handles.Results.Ymotion)-std(handles.Results.Ymotion) mean(handles.Results.Ymotion)-std(handles.Results.Ymotion)],'Color','r');
s = h.LineStyle;
h.LineStyle = ':';
hold off
xlim([min(handles.Results.time2) max(handles.Results.time2)])
grid on
title('Sway Displacement [m]')
xlabel('Time [s]')
ylabel('Displacement [m]')
function WithSurge_Callback(hObject, eventdata, handles)
cla(handles.PlotResult)
plot(handles.PlotResult,handles.Results.time,handles.Results.Surge,'Color','k')
hold on
line([min(handles.Results.time) max(handles.Results.time)],[mean(handles.Results.Surge) mean(handles.Results.Surge)],'Color',[0.8 0 0]);
h=line([min(handles.Results.time) max(handles.Results.time)],[mean(handles.Results.Surge)+std(handles.Results.Surge) mean(handles.Results.Surge)+std(handles.Results.Surge)],'Color','r');
s = h.LineStyle;
h.LineStyle = ':';
h=line([min(handles.Results.time) max(handles.Results.time)],[mean(handles.Results.Surge)-std(handles.Results.Surge) mean(handles.Results.Surge)-std(handles.Results.Surge)],'Color','r');
s = h.LineStyle;
h.LineStyle = ':';
hold off
xlim([min(handles.Results.time) max(handles.Results.time)])
grid on
title('Surge Motion [m]')
xlabel('Time [s]')
ylabel('Displacement [m]')
function WithoutSurge_Callback(hObject, eventdata, handles)
cla(handles.PlotResult)
plot(handles.PlotResult,handles.Results.time2,handles.Results.Xmotion,'Color','k')
hold on
line([min(handles.Results.time2) max(handles.Results.time2)],[mean(handles.Results.Xmotion) mean(handles.Results.Xmotion)],'Color',[0.8 0 0])
h=line([min(handles.Results.time2) max(handles.Results.time2)],[mean(handles.Results.Xmotion)+std(handles.Results.Xmotion) mean(handles.Results.Xmotion)+std(handles.Results.Xmotion)],'Color','r');
s = h.LineStyle;
h.LineStyle = ':';
h=line([min(handles.Results.time2) max(handles.Results.time2)],[mean(handles.Results.Xmotion)-std(handles.Results.Xmotion) mean(handles.Results.Xmotion)-std(handles.Results.Xmotion)],'Color','r');
s = h.LineStyle;
h.LineStyle = ':';
hold off
xlim([min(handles.Results.time2) max(handles.Results.time2)])
grid on
title('Surge Displacement [m]')
xlabel('Time [s]')
ylabel('Displacement [m]')
function DMSresults_Callback(hObject, eventdata, handles)
function Ct_Callback(hObject, eventdata, handles)
cla(handles.PlotResult)
IndexPlot = round(handles.Results.NumberOfNodes/2);
plot(handles.PlotResult,handles.Results.azimuthalThitaTotal.deg,handles.Results.CtTotal(IndexPlot,:),'LineWidth',1.5,'Color','k')
grid on
xlim([min(handles.Results.azimuthalThitaTotal.deg) max(handles.Results.azimuthalThitaTotal.deg)])
title('Thrust Coefficient')
xlabel('Azimuthal Angle [deg]')
ylabel('Ct')
function Cn_Callback(hObject, eventdata, handles)
cla(handles.PlotResult)
IndexPlot = round(handles.Results.NumberOfNodes/2);
plot(handles.PlotResult,handles.Results.azimuthalThitaTotal.deg,handles.Results.CnTotal(IndexPlot,:),'LineWidth',1.5,'Color','k')
grid on
xlim([min(handles.Results.azimuthalThitaTotal.deg) max(handles.Results.azimuthalThitaTotal.deg)])
title('Normal Coefficient')
xlabel('Azimuthal Angle [deg]')
ylabel('Cn')
function InterFactor_Callback(hObject, eventdata, handles)
cla(handles.PlotResult)
IndexPlot = round(handles.Results.NumberOfNodes/2);
plot(handles.PlotResult,handles.Results.azimuthalThitaTotal.deg,handles.Results.InterferenceFactorTotal(IndexPlot,:),'LineWidth',1.5,'Color','k')
grid on
xlim([min(handles.Results.azimuthalThitaTotal.deg) max(handles.Results.azimuthalThitaTotal.deg)])
title('Interference Factor')
xlabel('Azimuthal Angle [deg]')
ylabel('\alpha')
function AoA_Callback(hObject, eventdata, handles)
cla(handles.PlotResult)
IndexPlot = round(handles.Results.NumberOfNodes/2);
plot(handles.PlotResult,handles.Results.azimuthalThitaTotal.deg,rad2deg(handles.Results.AngleOfAttackTotal(IndexPlot,:)),'LineWidth',1.5,'Color','k')
grid on
xlim([min(handles.Results.azimuthalThitaTotal.deg) max(handles.Results.azimuthalThitaTotal.deg)])
title('Angle Of Attack')
xlabel('Azimuthal Angle [deg]')
ylabel('AoA')
function WindConditions_Callback(hObject, eventdata, handles)
function WaveConditions_Callback(hObject, eventdata, handles)
function ConstantWind_Callback(hObject, eventdata, handles)
function InitialConditions_Callback(hObject, eventdata, handles)
function InitialConditions_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function EnvConditions_Callback(hObject, eventdata, handles)
function WindVelocity_Callback(hObject, eventdata, handles)
cla(handles.PlotResult)
IndexPlot = round(handles.Results.NumberOfNodes/2);
plot(handles.PlotResult,handles.Results.time,handles.Results.WindSimulation.TurbulenceVelocityX(IndexPlot,:),'Color','k');
xlim([min(handles.Results.time) max(handles.Results.time)])
grid on
title('Wind Velocity')
xlabel('Time [s]')
ylabel('Wind Velocity [m/s]')
function WaveVelocity_Callback(hObject, eventdata, handles)
cla(handles.PlotResult)
IndexPlot = handles.Results.NumberOfNodes;
plot(handles.PlotResult,handles.Results.time,handles.Results.WaveSimulation.WaterVelocity(IndexPlot,:),'Color','k');
xlim([min(handles.Results.time) max(handles.Results.time)])
grid on
title('Wave Velocity in sea surface')
xlabel('Time [s]')
ylabel('Wind Velocity [m/s]')
function WaterElevation_Callback(hObject, eventdata, handles)
cla(handles.PlotResult)
plot(handles.PlotResult,handles.Results.time,handles.Results.WaveSimulation.WaterElevation,'Color','k');
xlim([min(handles.Results.time) max(handles.Results.time)])
grid on
title('Water Elevaton')
xlabel('Time [s]')
ylabel('Water Elevation [m]')
function Ntables_Callback(hObject, eventdata, handles)
function Ntables_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function ForcesTime_Callback(hObject, eventdata, handles)
function ForcesX_Callback(hObject, eventdata, handles)
prompt = {'Enter starting time to plot:','Enter ending time:'};
dlg_title = 'Input';
num_lines = 1;
def = {'50','100'};
answer = inputdlg(prompt,dlg_title,num_lines,def);
Time  = str2double(answer);
StartingTime = Time(1);
EndingTime = Time(2);
tbeginIndex = find(floor(handles.Results.time)==StartingTime,1);
tEndIndex = find(floor(handles.Results.time)==EndingTime,1);
cla(handles.PlotResult)
plot(handles.PlotResult,handles.Results.time(tbeginIndex:tEndIndex),handles.Results.FwindX(tbeginIndex:tEndIndex),'Color','k');
xlim([min(handles.Results.time(tbeginIndex:tEndIndex)) max(handles.Results.time(tbeginIndex:tEndIndex))])
grid on
title('Forces from Wind in X direction')
xlabel('Time [s]')
ylabel('Forces [N/m]')
function ForcesY_Callback(hObject, eventdata, handles)
prompt = {'Enter starting time to plot:','Enter ending time:'};
dlg_title = 'Input';
num_lines = 1;
def = {'50','100'};
answer = inputdlg(prompt,dlg_title,num_lines,def);
Time  = str2double(answer);
StartingTime = Time(1);
EndingTime = Time(2);
tbeginIndex = find(floor(handles.Results.time)==StartingTime,1);
tEndIndex = find(floor(handles.Results.time)==EndingTime,1);
cla(handles.PlotResult)
plot(handles.PlotResult,handles.Results.time(tbeginIndex:tEndIndex),handles.Results.FwindY(tbeginIndex:tEndIndex),'Color','k');
xlim([min(handles.Results.time(tbeginIndex:tEndIndex)) max(handles.Results.time(tbeginIndex:tEndIndex))])
grid on
title('Forces from Wind in Y direction')
xlabel('Time [s]')
ylabel('Forces [N/m]')
function MomentY_Callback(hObject, eventdata, handles)
prompt = {'Enter starting time to plot:','Enter ending time:'};
dlg_title = 'Input';
num_lines = 1;
def = {'50','100'};
answer = inputdlg(prompt,dlg_title,num_lines,def);
Time  = str2double(answer);
StartingTime = Time(1);
EndingTime = Time(2);
tbeginIndex = find(floor(handles.Results.time)==StartingTime,1);
tEndIndex = find(floor(handles.Results.time)==EndingTime,1);
cla(handles.PlotResult)
plot(handles.PlotResult,handles.Results.time(tbeginIndex:tEndIndex),handles.Results.TwindY(tbeginIndex:tEndIndex),'Color','k');
xlim([min(handles.Results.time(tbeginIndex:tEndIndex)) max(handles.Results.time(tbeginIndex:tEndIndex))])
grid on
title('Moment from Wind in Y direction')
xlabel('Time [s]')
ylabel('Moments [N/m]')
function MomentX_Callback(hObject, eventdata, handles)
prompt = {'Enter starting time to plot:','Enter ending time:'};
dlg_title = 'Input';
num_lines = 1;
def = {'50','100'};
answer = inputdlg(prompt,dlg_title,num_lines,def);
Time  = str2double(answer);
StartingTime = Time(1);
EndingTime = Time(2);
tbeginIndex = find(floor(handles.Results.time)==StartingTime,1);
tEndIndex = find(floor(handles.Results.time)==EndingTime,1);
cla(handles.PlotResult)
plot(handles.PlotResult,handles.Results.time(tbeginIndex:tEndIndex),handles.Results.TwindX(tbeginIndex:tEndIndex),'Color','k');
xlim([min(handles.Results.time(tbeginIndex:tEndIndex)) max(handles.Results.time(tbeginIndex:tEndIndex))])
grid on
title('Moment from Wind in X direction')
xlabel('Time [s]')
ylabel('Moment [N/m]')
function WindForces_Callback(hObject, eventdata, handles)
function WaveForces_Callback(hObject, eventdata, handles)
function ForcesXwave_Callback(hObject, eventdata, handles)
prompt = {'Enter starting time to plot:','Enter ending time:'};
dlg_title = 'Input';
num_lines = 1;
def = {'50','100'};
answer = inputdlg(prompt,dlg_title,num_lines,def);
Time  = str2double(answer);
StartingTime = Time(1);
EndingTime = Time(2);
tbeginIndex = find(floor(handles.Results.time)==StartingTime,1);
tEndIndex = find(floor(handles.Results.time)==EndingTime,1);
cla(handles.PlotResult)
plot(handles.PlotResult,handles.Results.time(tbeginIndex:tEndIndex),handles.Results.FhydroX(tbeginIndex:tEndIndex),'Color','k');
xlim([min(handles.Results.time(tbeginIndex:tEndIndex)) max(handles.Results.time(tbeginIndex:tEndIndex))])
grid on
title('Hydro forces in X direction')
xlabel('Time [s]')
ylabel('Force [N/m]')
function ForcesYwave_Callback(hObject, eventdata, handles)
prompt = {'Enter starting time to plot:','Enter ending time:'};
dlg_title = 'Input';
num_lines = 1;
def = {'50','100'};
answer = inputdlg(prompt,dlg_title,num_lines,def);
Time  = str2double(answer);
StartingTime = Time(1);
EndingTime = Time(2);
tbeginIndex = find(floor(handles.Results.time)==StartingTime,1);
tEndIndex = find(floor(handles.Results.time)==EndingTime,1);
cla(handles.PlotResult)
plot(handles.PlotResult,handles.Results.time(tbeginIndex:tEndIndex),handles.Results.FhydroY(tbeginIndex:tEndIndex),'Color','k');
xlim([min(handles.Results.time(tbeginIndex:tEndIndex)) max(handles.Results.time(tbeginIndex:tEndIndex))])
grid on
title('Hydro forces in Y direction')
xlabel('Time [s]')
ylabel('Force [N/m]')
function MomentYwave_Callback(hObject, eventdata, handles)
prompt = {'Enter starting time to plot:','Enter ending time:'};
dlg_title = 'Input';
num_lines = 1;
def = {'50','100'};
answer = inputdlg(prompt,dlg_title,num_lines,def);
Time  = str2double(answer);
StartingTime = Time(1);
EndingTime = Time(2);
tbeginIndex = find(floor(handles.Results.time)==StartingTime,1);
tEndIndex = find(floor(handles.Results.time)==EndingTime,1);
cla(handles.PlotResult)
plot(handles.PlotResult,handles.Results.time(tbeginIndex:tEndIndex),handles.Results.ThydroY(tbeginIndex:tEndIndex),'Color','k');
xlim([min(handles.Results.time(tbeginIndex:tEndIndex)) max(handles.Results.time(tbeginIndex:tEndIndex))])
grid on
title('Hydro Moment in Y direction')
xlabel('Time [s]')
ylabel('Force [N/m]')
function MomentXwave_Callback(hObject, eventdata, handles)
prompt = {'Enter starting time to plot:','Enter ending time:'};
dlg_title = 'Input';
num_lines = 1;
def = {'50','100'};
answer = inputdlg(prompt,dlg_title,num_lines,def);
Time  = str2double(answer);
StartingTime = Time(1);
EndingTime = Time(2);
tbeginIndex = find(floor(handles.Results.time)==StartingTime,1);
tEndIndex = find(floor(handles.Results.time)==EndingTime,1);
cla(handles.PlotResult)
plot(handles.PlotResult,handles.Results.time(tbeginIndex:tEndIndex),handles.Results.ThydroX(tbeginIndex:tEndIndex),'Color','k');
xlim([min(handles.Results.time(tbeginIndex:tEndIndex)) max(handles.Results.time(tbeginIndex:tEndIndex))])
grid on
title('Hydro Moment in X direction')
xlabel('Time [s]')
ylabel('Force [N/m]')
function CoupledForces_Callback(hObject, eventdata, handles)
function compinedForcesX_Callback(hObject, eventdata, handles)
prompt = {'Enter starting time to plot:','Enter ending time:'};
dlg_title = 'Input';
num_lines = 1;
def = {'50','100'};
answer = inputdlg(prompt,dlg_title,num_lines,def);
Time  = str2double(answer);
StartingTime = Time(1);
EndingTime = Time(2);
tbeginIndex = find(floor(handles.Results.time)==StartingTime,1);
tEndIndex = find(floor(handles.Results.time)==EndingTime,1);
cla(handles.PlotResult)
plot(handles.PlotResult,handles.Results.time(tbeginIndex:tEndIndex),handles.Results.ForcesXtotal(tbeginIndex:tEndIndex),'Color','k');
xlim([min(handles.Results.time(tbeginIndex:tEndIndex)) max(handles.Results.time(tbeginIndex:tEndIndex))])
grid on
title('Total Forces in X direction')
xlabel('Time [s]')
ylabel('Force [N/m]')
function compinedForcesY_Callback(hObject, eventdata, handles)
prompt = {'Enter starting time to plot:','Enter ending time:'};
dlg_title = 'Input';
num_lines = 1;
def = {'50','100'};
answer = inputdlg(prompt,dlg_title,num_lines,def);
Time  = str2double(answer);
StartingTime = Time(1);
EndingTime = Time(2);
tbeginIndex = find(floor(handles.Results.time)==StartingTime,1);
tEndIndex = find(floor(handles.Results.time)==EndingTime,1);
cla(handles.PlotResult)
plot(handles.PlotResult,handles.Results.time(tbeginIndex:tEndIndex),handles.Results.ForcesYtotal(tbeginIndex:tEndIndex),'Color','k');
xlim([min(handles.Results.time(tbeginIndex:tEndIndex)) max(handles.Results.time(tbeginIndex:tEndIndex))])
grid on
title('Total Forces in Y direction')
xlabel('Time [s]')
ylabel('Force [N/m]')
function compinedMomentY_Callback(hObject, eventdata, handles)
prompt = {'Enter starting time to plot:','Enter ending time:'};
dlg_title = 'Input';
num_lines = 1;
def = {'50','100'};
answer = inputdlg(prompt,dlg_title,num_lines,def);
Time  = str2double(answer);
StartingTime = Time(1);
EndingTime = Time(2);
tbeginIndex = find(floor(handles.Results.time)==StartingTime,1);
tEndIndex = find(floor(handles.Results.time)==EndingTime,1);
cla(handles.PlotResult)
plot(handles.PlotResult,handles.Results.time(tbeginIndex:tEndIndex),handles.Results.MomentYtotal(tbeginIndex:tEndIndex),'Color','k');
xlim([min(handles.Results.time(tbeginIndex:tEndIndex)) max(handles.Results.time(tbeginIndex:tEndIndex))])
grid on
title('Total Moment in Y direction')
xlabel('Time [s]')
ylabel('Moment [N/m]')
function compinedMomentX_Callback(hObject, eventdata, handles)
prompt = {'Enter starting time to plot:','Enter ending time:'};
dlg_title = 'Input';
num_lines = 1;
def = {'50','100'};
answer = inputdlg(prompt,dlg_title,num_lines,def);
Time  = str2double(answer);
StartingTime = Time(1);
EndingTime = Time(2);
tbeginIndex = find(floor(handles.Results.time)==StartingTime,1);
tEndIndex = find(floor(handles.Results.time)==EndingTime,1);
cla(handles.PlotResult)
plot(handles.PlotResult,handles.Results.time(tbeginIndex:tEndIndex),handles.Results.MomentXtotal(tbeginIndex:tEndIndex),'Color','k');
xlim([min(handles.Results.time(tbeginIndex:tEndIndex)) max(handles.Results.time(tbeginIndex:tEndIndex))])
grid on
title('Total Moment in X direction')
xlabel('Time [s]')
ylabel('Moment [N/m]')
function SaveData_Callback(hObject, eventdata, handles)
DataOutput = handles.Results;
uisave('DataOutput','SaveDataFolder/')
set(handles.loading,'String','Data Saved')
function LoadData_Callback(hObject, eventdata, handles)
uiload;
handles.Results = DataOutput;
guidata(hObject, handles);
set(handles.loading,'String','Data Loaded.Use Results menu to plot loaded data.')
set(handles.TotalMass,'String',sprintf('Total Mass:%1.1e\n',handles.Results.windTurbine.Mass))
set(handles.Solidity,'String',sprintf('Solidity:%2.1f',handles.Results.windTurbine.Solidity))
set(handles.SwayPeriod,'String',sprintf('Sway Period:%2.1f',handles.Results.period_sway))
set(handles.SurgePeriod,'String',sprintf('Surge Period:%2.1f',handles.Results.period_surge))
set(handles.MeanSurge,'String',sprintf('Mean Surge:%2.2f',mean(handles.Results.Xmotion)))
set(handles.MeanSway,'String',sprintf('Mean Sway:%2.2f',mean(handles.Results.Ymotion)))
set(handles.STDsurge,'String',sprintf('StD Surge:%2.2f',std(handles.Results.Xmotion)))
set(handles.STDsway,'String',sprintf('StD Sway::%2.2f',std(handles.Results.Ymotion)))
initialRemode = str2double(get(handles.InitialRemove ,'String'));
tbeginIndex2 = find(floor(handles.Results.time)==handles.Results.initialRemode,1);
set(handles.WindMeanX,'String',sprintf('Wind:Mean in X:%1.1e\n',mean(handles.Results.FwindX(tbeginIndex2:end))))
set(handles.WindMeanY,'String',sprintf('Wind:Mean in Y:%1.1e\n',mean(handles.Results.FwindY(tbeginIndex2:end))))
set(handles.WaveMeanX,'String',sprintf('Wave:Mean in X:%1.1e\n',mean(handles.Results.FhydroX(tbeginIndex2:end))))
set(handles.WaveMeanY,'String',sprintf('Wave:Mean in Y:%1.1e\n',mean(handles.Results.FhydroY(tbeginIndex2:end))))
if strcmp(handles.Results.windTurbine.floater.type,'BUOY')==1
    set(handles.PitchPeriod,'String',['Pitch Period:' num2str(handles.Results.period_pitch)])
    set(handles.RollPeriod,'String',['Roll Period:' num2str(handles.Results.period_roll)])
    set(handles.MeanPitch,'String',['Mean Pitch:' num2str(rad2deg(mean(handles.Results.ThitaMotion)))])
    set(handles.MeanRoll,'String',['Mean Roll:' num2str(rad2deg(mean(handles.Results.FiMotion)))])
    set(handles.STDpitch,'String',['StD Pitch:' num2str(rad2deg(std(handles.Results.ThitaMotion)))])
    set(handles.STDroll,'String',['StD Roll:' num2str(rad2deg(std(handles.Results.FiMotion)))])
end
function MatrixValues_Callback(hObject, eventdata, handles)
function MassMatrix_Callback(hObject, eventdata, handles)
H = msgbox({num2str(handles.Results.MassMatrix)},'Mass Matrix');
function AddedMassMatrix_Callback(hObject, eventdata, handles)
msgbox({num2str(handles.Results.AddedMassMatrix)},'Added Mass Matrix')
function RestoringMatrixC_Callback(hObject, eventdata, handles)
msgbox({num2str(handles.Results.Cmatrix)},'C Matrix')
function Untitled_4_Callback(hObject, eventdata, handles)
msgbox({num2str(handles.Results.BuyancyForce)},'Bouyancy Force')
function XYcoordSystem_Callback(hObject, eventdata, handles)
prompt = {'Enter starting time to plot:','Enter ending time:'};
dlg_title = 'Input';
num_lines = 1;
def = {'50','100'};
answer = inputdlg(prompt,dlg_title,num_lines,def);
Time  = str2double(answer);
StartingTime = Time(1);
EndingTime = Time(2);
tbeginIndex = find(floor(handles.Results.time)==StartingTime,1);
tEndIndex = find(floor(handles.Results.time)==EndingTime,1);
cla(handles.PlotResult)
plot(handles.PlotResult,handles.Results.Surge(tbeginIndex:tEndIndex),handles.Results.Sway(tbeginIndex:tEndIndex),'Color','k');
hold on
plot(handles.PlotResult,handles.Results.Surge(tbeginIndex),handles.Results.Sway(tbeginIndex),'ro')
plot(handles.PlotResult,handles.Results.Surge(tEndIndex),handles.Results.Sway(tEndIndex),'r*')
grid on
title('Trajectory of the cross section at the mean water level')
xlabel('X [m]')
ylabel('Y [m]')
axis equal
function PDforceX_Callback(hObject, eventdata, handles)
cla(handles.PlotResult)
plot(handles.Results.fFFT,10*log10(handles.Results.psFx),'Color','k'),set(gca,'xlim',[0 0.7])
grid on
title('Periodogram for Aerodynamic F_x')
xlabel('Frequency (Hz)')
ylabel('Power/Frequency (dB/Hz)')
function PDforceY_Callback(hObject, eventdata, handles)
cla(handles.PlotResult)
plot(handles.Results.fFFT,10*log10(handles.Results.psFy),'Color','k'),set(gca,'xlim',[0 0.7])
grid on
title('Periodogram for Aerodynamic F_y')
xlabel('Frequency (Hz)')
ylabel('Power/Frequency (dB/Hz)')
function PowerCurve_Callback(hObject, eventdata, handles)
function PowerCurvePlot_Callback(hObject, eventdata, handles)
cla(handles.PlotResult)
plot(handles.Results.fFFT,10*log10(handles.Results.psFxOneblade),'Color','k'),set(gca,'xlim',[0 0.7])
grid on
title('Periodogram  for F_x In one blade')
xlabel('Frequency (Hz)')
ylabel('Power/Frequency (dB/Hz)')

function PDoneBladeX_Callback(hObject, eventdata, handles)
cla(handles.PlotResult)
plot(handles.Results.fFFT,10*log10(handles.Results.psFxOneblade),'Color','k'),set(gca,'xlim',[0 0.7])
grid on
title('Periodogram  for F_x In one blade')
xlabel('Frequency (Hz)')
ylabel('Power/Frequency (dB/Hz)')
function PDoneBladeY_Callback(hObject, eventdata, handles)
cla(handles.PlotResult)
plot(handles.Results.fFFT,10*log10(handles.Results.psFyOneblade),'Color','k'),set(gca,'xlim',[0 0.7])
grid on
title('Periodogram for F_y In one blade')
xlabel('Frequency (Hz)')
ylabel('Power/Frequency (dB/Hz)')
function PDwind_Callback(hObject, eventdata, handles)
cla(handles.PlotResult)
plot(handles.Results.fFFT,handles.Results.psV_Hub,'Color','k'),set(gca,'xlim',[0 0.7])
grid on
title('Periodogram of Wind Velocity')
xlabel('Frequency (Hz)')
ylabel('Power/Frequency (dB/Hz)')
function PDwave_Callback(hObject, eventdata, handles)
cla(handles.PlotResult)
plot(handles.Results.fFFT,10*log10(handles.Results.psEta),'Color','k'),set(gca,'xlim',[0 0.7])
grid on
title('Periodogram of Wave Elevation')
xlabel('Frequency (Hz)')
ylabel('Power/Frequency (dB/Hz)')
function Gyroscopic_Callback(hObject, eventdata, handles)
function KmoorAutoCalculate_Callback(hObject, eventdata, handles)
function InertiaZZtr_Callback(hObject, eventdata, handles)
function InertiaZZtr_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --------------------------------------------------------------------
function PDofMomentX_Callback(hObject, eventdata, handles)
cla(handles.PlotResult)
plot(handles.Results.fFFT,10*log10(handles.Results.psTwindX),'Color','k'),set(gca,'xlim',[0 0.7])
grid on
title('Periodogram of Wave Elevation')
xlabel('Frequency (Hz)')
ylabel('Power/Frequency (dB/Hz)')
function PDofMomentY_Callback(hObject, eventdata, handles)
cla(handles.PlotResult)
plot(handles.Results.fFFT,10*log10(handles.Results.psTwindY),'Color','k'),set(gca,'xlim',[0 0.7])
grid on
title('Periodogram of Wave Elevation')
xlabel('Frequency (Hz)')
ylabel('Power/Frequency (dB/Hz)')