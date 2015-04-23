function obj = CalcSpectrumOfMotionBUOY(obj,Motion)

eig_v=(obj.MassMatrix+obj.AddedMassMatrix)\obj.Cmatrix;
[V,D]=eig(eig_v);

obj.period_surge=(2*pi)/sqrt(D(1,1)) ;
obj.period_pitch=(2*pi)/sqrt(D(2,2)) ;
obj.period_sway=(2*pi)/sqrt(D(3,3)) ;
obj.period_roll=(2*pi)/sqrt(D(4,4)) ;


mode_shape_1=[V(1,1);V(2,1)];
mode_shape_2=[V(1,2);V(2,2)];
mode_shape_3=[V(1,3);V(2,3)];
mode_shape_4=[V(1,4);V(2,4)];


tbeginIndex = find(floor(obj.time)==obj.initialRemode,1);
VelocityX = obj.WindSimulation.TurbulenceVelocityX(floor(obj.NumberOfNodes/2),:);
VelocityY = obj.WindSimulation.TurbulenceVelocityY(floor(obj.NumberOfNodes/2),:);
time2 = obj.time(tbeginIndex:end);
VelocityX  = VelocityX(tbeginIndex:end);
VelocityY  = VelocityY(tbeginIndex:end);
Elevation = obj.WaveSimulation.WaterElevation(tbeginIndex:end);

Xmotion = Motion(tbeginIndex:end,1);
ThitaMotion = Motion(tbeginIndex:end,2);
Ymotion = Motion(tbeginIndex:end,3);
FiMotion = Motion(tbeginIndex:end,4);
FxforPD = obj.FwindX(tbeginIndex:end);
FyforPD = obj.FwindY(tbeginIndex:end);
MomentXWindforPD = obj.TwindX;
MomentYWindforPD = obj.TwindY;
FxforPDoneBlade = obj.FxforOneBlade(tbeginIndex:end);
FyforPDoneBlade = obj.FyforOneBlade(tbeginIndex:end);



dfFFT = 1/(time2(end));
fFFT=[1:length(time2)]*dfFFT-dfFFT;
obj.time2 = time2;
obj.Xmotion = Xmotion;
obj.ThitaMotion = ThitaMotion;
obj.Ymotion = Ymotion;
obj.FiMotion = FiMotion;
%obj.fFFT = fFFT;


%---Spectra Fx

[obj.fFFT,obj.psFx] = CalcPowerSpectra(obj,FxforPD);
%---Spectra Fy
[~,obj.psFy] = CalcPowerSpectra(obj,FyforPD);
%Moment
[obj.fFFT,obj.psTwindX] = CalcPowerSpectra(obj,MomentXWindforPD);
[obj.fFFT,obj.psTwindY] = CalcPowerSpectra(obj,MomentYWindforPD);
%---Spectra Fx ONE BLADE 
if obj.UseWind==1 || obj.UseConstantWind==1
[~,obj.psFxOneblade] = CalcPowerSpectra(obj,FxforPDoneBlade);



%---Spectra Fy ONE BLADE

[~,obj.psFyOneblade] = CalcPowerSpectra(obj,FyforPDoneBlade);

end

%---Spectra Velocity

[~,obj.psV_Hub] = CalcPowerSpectra(obj,VelocityX);

%---Spectra Elevation
[~,obj.psEta] = CalcPowerSpectra(obj,Elevation );


%---Spectra Surge X


[~,obj.psSurgeX] = CalcPowerSpectra(obj,Xmotion);


%---Spectra Pitch

[~,obj.psThitaX] = CalcPowerSpectra(obj,ThitaMotion);
%---Spectra Surge Y

SurgeX_A=abs(fft(Ymotion))/length(time2);
psSurgeY=SurgeX_A.^2/dfFFT;
psSurgeY(1)=0;

obj.psSurgeY = psSurgeY;

[~,obj.psSurgeY] = CalcPowerSpectra(obj,Ymotion);

%---Spectra Pitch
[~,obj.psFiY] = CalcPowerSpectra(obj,FiMotion);
%plot(fFFT,psSurgeX),set(gca,'xlim',[0 0.5]), ylabel(' S n [m^2/Hz]'),
