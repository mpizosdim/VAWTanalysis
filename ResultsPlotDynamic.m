close all;
clear classes;
%-----------TLP---------------
% MeanSurgeTLP = [3.77 3.75 3.81 5.35 7.45 ];
% StdSurgeTLP = [0.52 0.69 1.37 2.78 3.57 ];
% 
% MeanSwayTLP = [0.3 0.29 0.31 0.59 1.34 ];
% StdSwayTLP = [0.06 0.04 0.25 0.54 1.23 ];



% %-----------Buoy---------------
MeanSurgeBuoy = [15.9 16.41 16.54 23.69 33.1];
StdSurgeBuoy= [0.02 1.02 3.1 5.82 7.62];

MeanSwayBuoy = [1.97 1.48 1.44 2.83 6.43];
StdSwayBuoy = [0.18 0.15 0.48 1.21 2.9];



%---PLOT TLP---------------------------------------------------------------
lol = figure;h=errorbar(0.90:4.90,MeanSurgeBuoy,StdSurgeBuoy,'o','MarkerEdgeColor','r',...
'MarkerFaceColor','r',...
'LineWidth',1.5,'Color',[0 0 0]);xbounds = xlim();set(gca,'xtick',(xbounds(1)-0.5):1:(xbounds(2)-0.5))
grid on
title('Mean and Std of F_x for TLP design')
xlabel('Load Case')
ylabel('Meters')
s = h.LineStyle;
h.LineStyle = ':';

hold on
h=errorbar(0.98:4.98,MeanSwayBuoy,StdSwayBuoy,'o','MarkerEdgeColor','r',...
'MarkerFaceColor','w',...
'LineWidth',1.5,'Color',[0 0 0]);xbounds = xlim();set(gca,'xtick',(xbounds(1)-0.5):1:(xbounds(2)-0.5))
grid on
title('Mean and Std of Surge and Sway for Buoy design')
xlabel('Load Case')
ylabel('Meters')
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



axis([0.5,5,0,45])

 set(gca, 'XTickLabel',{'5','1','2','3','4'})

% xlim([0 5])

h_legend = legend('Surge Displ.','Sway Disp.');
set(h_legend,'Location','northwest')
% 
% scrsz = get(0,'ScreenSize');
%     set(gcf,'position',scrsz);
%     

%print(lol,'-depsc','FigureLOL.eps')
%Content = Process_AtendHeader('FigureLOL.eps','ELEVATIONtime.eps');

%---PLOT Buoy-----------------------------------------------------------
%
MeanPitchBuoy = [1.97 2.03 2.05 2.9 4.1];
StdPitchBuoy= [0.01 0.58 0.78 3.1 4.9];

MeanRollBuoy = [0.24 0.18 0.17 0.34 0.7];
StdRollBuoy = [0.01 0.04 0.08 0.54 1.5];


lol2 = figure;h=errorbar(0.90:4.90,MeanPitchBuoy,StdPitchBuoy,'o','MarkerEdgeColor','r',...
'MarkerFaceColor','r',...
'LineWidth',1.5,'Color',[0 0 0]);xbounds = xlim();set(gca,'xtick',(xbounds(1)-0.5):1:(xbounds(2)-0.5))
grid on
title('Mean and Std of Pitch and Roll for Buoy design')
xlabel('Load Case')
ylabel('Degrees [o]')
s = h.LineStyle;
h.LineStyle = ':';

hold on
h=errorbar(0.98:4.98,MeanRollBuoy,StdRollBuoy,'o','MarkerEdgeColor','r',...
'MarkerFaceColor','w',...
'LineWidth',1.5,'Color',[0 0 0]);xbounds = xlim();set(gca,'xtick',(xbounds(1)-0.5):1:(xbounds(2)-0.5))
grid on
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



axis([0.5,5,-2,10])

 set(gca, 'XTickLabel',{'5','1','2','3','4'})

% xlim([0 5])

h_legend = legend('Pitch Degree','Roll Degree');
set(h_legend,'Location','northwest')

print(lol,'-depsc','FigureLOL.eps')
Content = Process_AtendHeader('FigureLOL.eps','SurgeBuoy.eps');
print(lol,'-depsc','FigureLOL2.eps')
Content2 = Process_AtendHeader('FigureLOL2.eps','ExtremeRoll.eps');



% figure;h=errorbar(1:5,MeanSurgeBuoy,StdSurgeBuoy,'o','MarkerEdgeColor','r',...
% 'MarkerFaceColor','r',...
% 'LineWidth',1.5,'Color',[0 0 0]);xbounds = xlim();set(gca,'xtick',(xbounds(1)-0.5):1:(xbounds(2)-0.5))
% grid on
% title('Mean and Std of Surge for Buoy design')
% xlabel('Load Case')
% ylabel('Meters')
% % ylim([1,10])
% s = h.LineStyle;
% h.LineStyle = ':';
% 
% 
% 
% 
% figure;h=errorbar(1:5,MeanSwayBuoy,StdSwayBuoy,'o','MarkerEdgeColor','r',...
% 'MarkerFaceColor','r',...
% 'LineWidth',1.5,'Color',[0 0 0]);xbounds = xlim();set(gca,'xtick',(xbounds(1)-0.5):1:(xbounds(2)-0.5))
% grid on
% title('Mean and Std of Sway for  Buoy design')
% xlabel('Load Case')
% ylabel('Meters')
% ylim([-2,2])
% s = h.LineStyle;
% h.LineStyle = ':';
% 
% 
% 
% figure;h=errorbar(1:5,MeanPitchBuoy,StdPitchBuoy,'o','MarkerEdgeColor','r',...
% 'MarkerFaceColor','r',...
% 'LineWidth',1.5,'Color',[0 0 0]);xbounds = xlim();set(gca,'xtick',(xbounds(1)-0.5):1:(xbounds(2)-0.5))
% grid on
% title('Mean and Std of Pitch for Buoy design')
% xlabel('Load Case')
% ylabel('Degrees')
% ylim([-3,9])
% s = h.LineStyle;
% h.LineStyle = ':';
% 
% 
% 
% 
% figure;h=errorbar(1:5,MeanRollBuoy,StdRollBuoy,'o','MarkerEdgeColor','r',...
% 'MarkerFaceColor','r',...
% 'LineWidth',1.5,'Color',[0 0 0]);xbounds = xlim();set(gca,'xtick',(xbounds(1)-0.5):1:(xbounds(2)-0.5))
% grid on
% title('Mean and Std of Roll for  Buoy design')
% xlabel('Load Case')
% ylabel('Meters')
% ylim([-1.5,1.5])
% s = h.LineStyle;
% h.LineStyle = ':';
% 
% 
% 
% 
% 
% 
% 

