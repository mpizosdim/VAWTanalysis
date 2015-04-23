function [freq,psdx] = CalcPowerSpectra(obj,Data)




Fs = 1/obj.timestepPerThitaNode;
N = length(Data);
xdft = fft(Data);
xdft = xdft(1:N/2+1);
psdx = (1/(Fs*N)) * abs(xdft).^2;
psdx(2:end-1) = 2*psdx(2:end-1);
freq = 0:Fs/length(Data):Fs/2;
freq(1) = [];
psdx(1) = [];
% plot(freq,10*log10(psdx))
% grid on
% title('Periodogram Using FFT')
% xlabel('Frequency (Hz)')
% ylabel('Power/Frequency (dB/Hz)')
% 
