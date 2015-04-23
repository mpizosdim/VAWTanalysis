function obj = CalcSpectrumOfMotionTLP(obj,Motion)

eig_v=(obj.MassMatrix+obj.AddedMassMatrix)\obj.Cmatrix;
[V,D]=eig(eig_v);

obj.period_surge=(2*pi)/sqrt(D(1,1)) ;
obj.period_sway=(2*pi)/sqrt(D(2,2)) ;

mode_shape_1=[V(1,1);V(2,1)];
mode_shape_2=[V(1,2);V(2,2)];

tbeginIndex = find(floor(obj.time)==obj.initialRemode,1);
VelocityX = obj.WindSimulation.TurbulenceVelocityX(floor(obj.NumberOfNodes/2),:);
VelocityY = obj.WindSimulation.TurbulenceVelocityY(floor(obj.NumberOfNodes/2),:);
time2 = obj.time(tbeginIndex:end);
VelocityX  = VelocityX(tbeginIndex:end);
VelocityY  = VelocityY(tbeginIndex:end);
Elevation = obj.WaveSimulation.WaterElevation(tbeginIndex:end);
Xmotion = Motion(tbeginIndex:end,1);
Ymotion = Motion(tbeginIndex:end,2);
%dfFFT = 1/(time2(end));
%fFFT=[1:length(time2)]*dfFFT-dfFFT;
obj.time2 = time2;
obj.Xmotion = Xmotion;
obj.Ymotion = Ymotion;
%obj.fFFT = fFFT;
FxforPD = obj.FwindX(tbeginIndex:end);
FyforPD = obj.FwindY(tbeginIndex:end);
FxforPDoneBlade = obj.FxforOneBlade(tbeginIndex:end);
FyforPDoneBlade = obj.FyforOneBlade(tbeginIndex:end);

%---Spectra Velocity

[obj.fFFT,obj.psV_Hub] = CalcPowerSpectra(obj,VelocityX);


%---Spectra Fx
[~,obj.psFx] = CalcPowerSpectra(obj,FxforPD);
%---Spectra Fy
[~,obj.psFy] = CalcPowerSpectra(obj,FyforPD);

[~,obj.psFxOneblade] = CalcPowerSpectra(obj,FxforPDoneBlade);
%---Spectra Fy ONE BLADE
[~,obj.psFyOneblade] = CalcPowerSpectra(obj,FyforPDoneBlade);





%---Spectra Elevation
[~,obj.psEta] = CalcPowerSpectra(obj,Elevation);
%---Spectra Surge X
[~,obj.psSurgeX] = CalcPowerSpectra(obj,Xmotion);
%---Spectra Surge Y
[~,obj.psSurgeY] = CalcPowerSpectra(obj,Ymotion);


%plot(fFFT,psSurgeY),set(gca,'xlim',[0 0.5]), ylabel(' S n [m^2/Hz]'),


%New code.

% Fs = 17.1887;
% N = length(FxforPD);
% xdft = fft(FxforPD);
% xdft = xdft(1:N/2+1);
% psdx = (1/(Fs*N)) * abs(xdft).^2;
% psdx(2:end-1) = 2*psdx(2:end-1);
% freq = 0:Fs/length(FxforPD):Fs/2;
% 
% plot(freq,10*log10(psdx))
% grid on
% title('Periodogram Using FFT')
% xlabel('Frequency (Hz)')
% ylabel('Power/Frequency (dB/Hz)')
% 
