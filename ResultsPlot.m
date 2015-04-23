close all;
clear classes;
%-----------TLP---------------
MeanSurgeTLP = [3.36 3.35 3.34 4.53 5.67];
StdSurgeTLP = [0.58 0.71 1.33 1.56 3.3];

MeanSwayTLP = [0.06 0.06 0.07 0.01 0.03];
StdSwayTLP = [0.01 0.02 0.15 0.12 0.21];



%-----------Buoy---------------
MeanSurgeBuoy = [14.9 14.9 14.7 20.34 25.21];
StdSurgeBuoy= [1.59 1 2.87 3.57 7.78];

MeanSwayBuoy = [0.41 0.42 0.44 0.36 0.31];
StdSwayBuoy = [0.06 0.1 0.26 0.28 0.36];


MeanPitchBuoy = [1.85 1.8 1.8 2.5 3.1];
StdPitchBuoy= [0.1 0.5 0.75 1.08 4.9];

MeanRollBuoy = [0.01 0.02 0.06 0.08 0.11];
StdRollBuoy = [0.04 0.05 0.05 0.08 0.1];

%---PLOT TLP---------------------------------------------------------------
figure;h=errorbar(1:5,MeanSurgeTLP,StdSurgeTLP,'o','MarkerEdgeColor','r',...
'MarkerFaceColor','r',...
'LineWidth',1.5,'Color',[0 0 0]);xbounds = xlim();set(gca,'xtick',(xbounds(1)-0.5):1:(xbounds(2)-0.5))
grid on
title('Mean and Std of Surge for TLP design')
xlabel('Load Case')
ylabel('Meters')
ylim([1,10])
s = h.LineStyle;
h.LineStyle = ':';


figure;h=errorbar(1:5,MeanSwayTLP,StdSwayTLP,'o','MarkerEdgeColor','r',...
'MarkerFaceColor','r',...
'LineWidth',1.5,'Color',[0 0 0]);xbounds = xlim();set(gca,'xtick',(xbounds(1)-0.5):1:(xbounds(2)-0.5))
grid on
title('Mean and Std of Sway for  TLP design')
xlabel('Load Case')
ylabel('Meters')
ylim([-1,1])
s = h.LineStyle;
h.LineStyle = ':';




%---PLOT Buoy-----------------------------------------------------------

figure;h=errorbar(1:5,MeanSurgeBuoy,StdSurgeBuoy,'o','MarkerEdgeColor','r',...
'MarkerFaceColor','r',...
'LineWidth',1.5,'Color',[0 0 0]);xbounds = xlim();set(gca,'xtick',(xbounds(1)-0.5):1:(xbounds(2)-0.5))
grid on
title('Mean and Std of Surge for Buoy design')
xlabel('Load Case')
ylabel('Meters')
% ylim([1,10])
s = h.LineStyle;
h.LineStyle = ':';




figure;h=errorbar(1:5,MeanSwayBuoy,StdSwayBuoy,'o','MarkerEdgeColor','r',...
'MarkerFaceColor','r',...
'LineWidth',1.5,'Color',[0 0 0]);xbounds = xlim();set(gca,'xtick',(xbounds(1)-0.5):1:(xbounds(2)-0.5))
grid on
title('Mean and Std of Sway for  Buoy design')
xlabel('Load Case')
ylabel('Meters')
ylim([-2,2])
s = h.LineStyle;
h.LineStyle = ':';



figure;h=errorbar(1:5,MeanPitchBuoy,StdPitchBuoy,'o','MarkerEdgeColor','r',...
'MarkerFaceColor','r',...
'LineWidth',1.5,'Color',[0 0 0]);xbounds = xlim();set(gca,'xtick',(xbounds(1)-0.5):1:(xbounds(2)-0.5))
grid on
title('Mean and Std of Pitch for Buoy design')
xlabel('Load Case')
ylabel('Degrees')
ylim([-3,9])
s = h.LineStyle;
h.LineStyle = ':';




figure;h=errorbar(1:5,MeanRollBuoy,StdRollBuoy,'o','MarkerEdgeColor','r',...
'MarkerFaceColor','r',...
'LineWidth',1.5,'Color',[0 0 0]);xbounds = xlim();set(gca,'xtick',(xbounds(1)-0.5):1:(xbounds(2)-0.5))
grid on
title('Mean and Std of Roll for  Buoy design')
xlabel('Load Case')
ylabel('Meters')
ylim([-1.5,1.5])
s = h.LineStyle;
h.LineStyle = ':';





h_title=get(gca,'title');
set(h_title,'FontSize',17,'FontWeight','Bold');
h_xlabel=get(gca,'Xlabel');
set(h_xlabel,'FontSize',21);
h_ylabel=get(gca,'Ylabel');
set(h_ylabel,'FontSize',21);
a = get(gca,'XTickLabel');

set(gca,'XTickLabel',a,'fontsize',18)
h_title=get(gca,'title');
set(h_title,'FontSize',17,'FontWeight','Bold');
set(gca, 'XTickLabel',{'5','1','2','3','4'})
set(gca,'xlim',[0.7 5.3])


%  print(lol,'FigureLOL.eps')%handles.output
%  Content = Process_AtendHeader('FigureLOL.eps','BuoyWindConstantDisplace.eps');
 
print(gcf,'-depsc','FigureLOL3.eps')
Content2 = Process_AtendHeader('FigureLOL3.eps','PDBuoyWindConstant.eps');
