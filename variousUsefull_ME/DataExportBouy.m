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
BladeMass = 10;
%----------------------------------------------





test1= airfoil('naca0015');
clc
blade2 = blade(test1,Height,Radius,thickness,chord,BladeMass);
tower2 = tower(TowerMass,TowerHeight,3,50000);
FloaterTest = floater(FloaterMass,50,FloaterRadius,FloaterLength,FloaterType,FloaterDraft,Kmoor,Zmoor);
windturbine = windTurbine(NumberOfBlades,blade2,tower2,Z_r,BladeType,FloaterTest);
waveSimulation = waveSimulation(Hs,Tp,SeaDepth,WaveLength);
Vrange = linspace(VatmosphericEquator-5,VatmosphericEquator+5,20);
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
save('DataNewBouy','Data')
%rotationalspeed:rpm=x*2pi/60
%'static'
%'Dynamic Gormonts',
%'Dynamic Gormonts','Paraschivoiu Adaption'
%'Dynamic Berg'0
%'Dynamic Strickland'