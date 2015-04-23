clear classes

%---------------SimulationInputs---------------
NumberOfNodes = 50;
dthita = 5;
model = 'Stream Tube Expansion';
TowerEffect = 'No Tower Effect';
StallModel = {'Static'};%'Dynamic Gormonts'
StallInTimeModel = {'Static'};
TotalTime = 2000;
fHighCut = 0.6;

% % % 
% %---------TLP Floater Wind Turbine-------------
% FloaterMass = 8.774*10^6;
% TowerMass = 518.5*10^3;
% BladeMass = 10;
% Height = 90/2;
% Radius = 92/2;
% chord = 2.2;
% thickness = 2.2*0.12;
% FloaterRadius = 18/2;
% TetherLength = 200;%152.11;
% FloaterType = 'TLP';
% BladeType = 'Sandia Type';
% TowerHeight = 90;
% FloaterDraft = 47.89;
% FloaterLength = 47.89;
% NumberOfBlades = 2;
% Z_r = 5;
% WindShearExponent = 1/7;
% VatmosphericEquator = 13.2;
% WindModel = 'Turbulence Model(Kaimal)';
% lx = 340.2;
% ly = 113.4;
% TurbulenceIntensity = 0.136;
% l=340.2;
% Hs = 3.37;
% Tp = 7.03;
% SeaDepth = 200;
% WaveLength = 10;
% RotationalSpeed = 1.5;%1.5
% %not used
% Kmoor = 41180;
% Zmoor = -70;
% %----------------------------------------------


%---------BUOY Floater Wind Turbine------------
FloaterMass = 7466330;
InertiaFloater = 4229230000;
TowerMass = 249718+240*10^3+110*10^3;
Itower = 1.217*10^8;
TowerHeight = 90;
Height = 90/2;
Radius = 92/2;
BladeType = 'Sandia Type';
thickness = 4.2*0.15;
chord = 4.2;
FloaterType = 'BUOY';
FloaterRadius = 9.4/2; 
FloaterDraft = 113.4;
FloaterLength = 113.4;
NumberOfBlades = 2;
Kmoor = 41180;
Zmoor = -70;
Z_r = 5;
WindShearExponent = 1/7;
WindModel = 'Turbulence Model(Kaimal)';
TurbulenceIntensity = 0.136;
VatmosphericEquator = 17.2;
lx=340.2;
ly = 113.4;
Hs = 3.37;
Tp = 7.03;
SeaDepth = 320;
WaveLength = 10;
RotationalSpeed = 1.55;
BladeMass = 10;
%----------------------------------------------
%---------------Sandia 5-m---------------------
Height = 3.65;
Radius = 2.5;
chord = 0.19;
BladeType = 'Sandia Type';
NumberOfBlades = 3;
Z_r = 0;
WindShearExponent = 1/7;
WindModel = 'Static';
TurbulenceIntensity = 0;
l=340.2;
Hs = 3.37;
Tp = 7.03;
SeaDepth = 200;
WaveLength = 10;
%----------------------------------------------

IzzTR =5e5;

test1= airfoil('NACA 0012'); 
clc
blade2 = blade(test1,Height,Radius,thickness,chord,BladeMass);
tower2 = tower(TowerMass,TowerHeight,3,50000);
FloaterTest = floater(FloaterMass,50,FloaterRadius,FloaterLength,FloaterType,FloaterDraft,Kmoor,Zmoor);
windturbine = windTurbine(NumberOfBlades,blade2,tower2,Z_r,BladeType,FloaterTest,IzzTR);
windSimulation = WindSimulation(WindShearExponent,VatmosphericEquator,WindModel,TurbulenceIntensity,lx,ly,'AI',0,40,1500,0,6,50);
waveSimulation = waveSimulation(Hs,Tp,SeaDepth,WaveLength);
test = simulation(windturbine,RotationalSpeed,windSimulation,waveSimulation,NumberOfNodes,dthita,model,TowerEffect,StallModel,StallInTimeModel,TotalTime,fHighCut,'Yes',1,0,0,0,0,0,0,0);
%rotationalspeed:rpm=x*2pi/60 
%'static'
%'Dynamic Gormonts',
%'Dynamic Gormonts','Paraschivoiu Adaption'
%'Dynamic Berg'
%'Dynamic Strickland'