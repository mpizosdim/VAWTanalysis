%---------------SimulationInputs---------------
NumberOfNodes = 50;
dthita = 5;
model = 'Stream Tube Expansion';
TowerEffect = 'No Tower Effect';
StallModel = {'Static'};
StallInTimeModel = {'Static'};
TotalTime = 600;
fHighCut = 0.7;


%---------------Sandia 17-m--------------------
Height = 12.55;
Radius = 8.5;
chord = 0.615;
BladeType = 'Sandia Type';
NumberOfBlades = 2;
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
%-----------Wind turbine Contest---------------
Height = 0.6;
Radius = 0.8;
chord = 0.1;
BladeType = 'H-type';
NumberOfBlades = 3;
Z_r = 0;
WindShearExponent = 0;
WindModel = 'Static';
TurbulenceIntensity = 0;
l=340.2;
Hs = 3.37;
Tp = 7.03;
SeaDepth = 200;
WaveLength = 10;
%---------TLP Floater Wind Turbine-------------
FloaterMass = 8.774*10^6;
TowerMass = 518.5*10^3;
BladeMass = 10;
Height = 90/2;
Radius = 92/2;
chord = 2.2;
thickness = 2.2*0.12;
FloaterRadius = 18/2;
TetherLength = 152.11;
FloaterType = 'TLP';
BladeType = 'Sandia Type';
TowerHeight = 90;
FloaterDraft = 47.89;
FloaterLength = 47.89;
NumberOfBlades = 2;
Z_r = 0;
WindShearExponent = 1/7;
VatmosphericEquator = 13.2;
WindModel = 'Turbulence Model(Kaimal)';
lx = 340.2;
ly = 113.4;
TurbulenceIntensity = 0.136;
l=340.2;
Hs = 3.37;
Tp = 7.03;
SeaDepth = 200;
WaveLength = 10;
RotationalSpeed = 1.5;
%not used
Kmoor = 41180;
Zmoor = -70;
%----------------------------------------------

%---------BUOY Floater Wind Turbine------------
FloaterMass = 7466330;
InertiaFloater = 4229230000;
TowerMass = 249718+240*10^3+110*10^3;
Itower = 1.217*10^8;
TowerHeight = 90;
Height = 90/2;
Radius = 92/2;
BladeType = 'Sandia Type';
thickness = 0.2;
chord = 2.2;
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
%----------------------------------------------

%-----------Floating from paper (5MW)----------
Radius = 63.74;
Height = 129.56/2;
TowerHeight = 129.56;
chord = 7.45;
thickness = chord * 0.12;
TowerMass = 449182;
BladeMass = 305044/2;
FloaterDraft = 20;
FloaterMass  = 13353.7*10^3;
InertiaFloater = 9159733000;
Kmoor = 41180;%check
Zmoor = -70;%check
lx=340.2;
ly = 113.4;
Z_r = 1;
WindShearExponent = 1/7;
WindModel = 'Turbulence Model(Kaimal)';
TurbulenceIntensity = 0.136;
RotationalSpeed = 0.55;
Hs = 6;
Tp = 10;
SeaDepth = 320;
WaveLength = 10;
VatmosphericEquator = 11.4;
NumberOfBlades = 2;
FloaterRadius =18/2;
FloaterLength = 20;
FloaterType = 'BUOY';
BladeType = 'Sandia Type';