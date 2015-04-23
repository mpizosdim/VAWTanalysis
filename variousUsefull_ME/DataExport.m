clear classes

%---------------SimulationInputs---------------
NumberOfNodes = 50;
dthita = 5;
model = 'Stream Tube Expansion';
TowerEffect = 'No Tower Effect';
StallModel = {'Static'};%'Dynamic Gormonts'
StallInTimeModel = {'Static'};
TotalTime = 1000;
fHighCut = 0.6;


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
Z_r = 5;
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
RotationalSpeed = 1.5;%1.5
%not used
Kmoor = 41180;
Zmoor = -70;
%----------------------------------------------





test1= airfoil('naca0015');
clc
blade2 = blade(test1,Height,Radius,thickness,chord,BladeMass);
tower2 = tower(TowerMass,TowerHeight,3,50000);
FloaterTest = floater(FloaterMass,50,FloaterRadius,FloaterLength,FloaterType,FloaterDraft,Kmoor,Zmoor);
windturbine = windTurbine(NumberOfBlades,blade2,tower2,Z_r,BladeType,FloaterTest);
waveSimulation = waveSimulation(Hs,Tp,SeaDepth,WaveLength);
Vrange = linspace(VatmosphericEquator-8,VatmosphericEquator+8,20);
for ii=1:length(Vrange)
    windSimulation(ii) = WindSimulation(WindShearExponent,Vrange(ii),WindModel,TurbulenceIntensity,lx,ly,'AI',0,40,1500,0,6,50);
    test(ii) = simulation(windturbine,RotationalSpeed,windSimulation(ii),waveSimulation,NumberOfNodes,dthita,model,TowerEffect,StallModel,StallInTimeModel,TotalTime,fHighCut,'No',1);
    VtotalTrial(ii,:,:) = test(ii).Vtotal;
    localReynoldNumberTotalTrial(ii,:,:) = test(ii).localReynoldNumberTotal;
    InterferenceFactorTrial2(ii,:,:) = test(ii).InterferenceFactorTotal;
end

Data.VTotal = VtotalTrial;
Data.VelocityRange = Vrange;
Data.localReynoldNumberTotal = localReynoldNumberTotalTrial;
Data.InterferenceFactorTotaltrial = InterferenceFactorTrial2;
save('DataNew','Data')
%rotationalspeed:rpm=x*2pi/60
%'static'
%'Dynamic Gormonts',
%'Dynamic Gormonts','Paraschivoiu Adaption'
%'Dynamic Berg'0
%'Dynamic Strickland'