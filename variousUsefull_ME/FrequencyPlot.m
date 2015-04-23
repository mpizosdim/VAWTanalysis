function FrequencyPlot(x,y)


plot(x,10*log10(y),'Color','k'),set(gca,'xlim',[0 0.7])

hold on
plot([1/handles.Results.period_surge 1/handles.Results.period_surge],ylim,':','lineWidth',1,'Color','r')
plot([1/handles.Results.period_pitch 1/handles.Results.period_pitch],ylim,':','Color','r')


title('Periodogram for...')
xlabel('Frequency (Hz)')
ylabel('Power/Frequency (dB/Hz)') 
grid on
print(gcf,'-depsc','FigureLOL.eps')
Content = Process_AtendHeader('FigureLOL.eps','PDpitchLC45.eps');