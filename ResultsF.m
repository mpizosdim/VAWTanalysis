close all;
clear classes;

%-----------TLP---------------
% meanFX= [5.7e5  5.7e5 8.1e5 1.1e6];
% StdFX = [3.8e5 4.1e5 5.9e5 8.1e5];
% 
% MeanFY = [4.4e4 4.5e4 8.9e4 2e5];
% StdFY = [4e5 4.1e05 5.8e5 8.6e5];



%-----------Buoy---------------
meanFXb= [5.6e5 5.8e5 8.3e5 1.2e6];
StdFXb = [3.7e5 4.1e5 4.2e5 4.2e5];

MeanFYb = [6.7e4 5.1e4 9.9e4 2.3e5];
StdFYb = [4.1e5 4.3e5 4.3e5 4.35e5];



%---PLOT TLP---------------------------------------------------------------
lol = figure;h=errorbar(0.90:3.90,meanFXb,StdFXb,'o','MarkerEdgeColor','r',...
'MarkerFaceColor','r',...
'LineWidth',1.5,'Color',[0 0 0]);xbounds = xlim();set(gca,'xtick',(xbounds(1)-0.5):1:(xbounds(2)-0.5))
grid on
title('Mean and Std of F_x for TLP design')
xlabel('Load Case')
ylabel('Meters')
s = h.LineStyle;
h.LineStyle = ':';

hold on
h=errorbar(0.98:3.98,MeanFYb,StdFYb,'o','MarkerEdgeColor','r',...
'MarkerFaceColor','w',...
'LineWidth',1.5,'Color',[0 0 0]);xbounds = xlim();set(gca,'xtick',(xbounds(1)-0.5):1:(xbounds(2)-0.5))
grid on
title('Mean and Std of F_x and F_y for TLP design')
xlabel('Load Case')
ylabel('Newton')
s = h.LineStyle;
h.LineStyle = ':';
set(gca, 'XTickLabel',{'5','1','3','4','5'})
h_legend = legend('F_X','F_Y')
set(h_legend,'Location','northwest')
% 
% 
% 
% 
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
set(gca, 'XTickLabel',{'5','1','3','4','5'})
% set(gca,'xlim',[0.7 5.3])
% 
% 
axis([0.5,4,-1e6,2e6])
%print(lol,'-depsc','FigureLOL.eps')
%Content = Process_AtendHeader('FigureLOL.eps','FxFyTLPmeanSTD.eps');

%---PLOT Buoy-----------------------------------------------------------
MomentX = [2.3e7  2.5e7 3.5e7 4.8E7];
stdMomentX = [1.5e7  1.8e7 2.7e7 3.6e7];
MomentY = [2.7e6  2e6 4e6 9.1e6];
stdMomentY = [1.7e7  1.8E7 2.6e7 3.8e7];

lol2 = figure;h=errorbar(0.90:3.90,MomentX,stdMomentX,'o','MarkerEdgeColor','r',...
'MarkerFaceColor','r',...
'LineWidth',1.5,'Color',[0 0 0]);xbounds = xlim();set(gca,'xtick',(xbounds(1)-0.5):1:(xbounds(2)-0.5))
grid on
title('Mean and Std of F_x for Buoy design')
xlabel('Load Case')
ylabel('Meters')
s = h.LineStyle;
h.LineStyle = ':';

hold on
h=errorbar(0.98:3.98,MomentY,stdMomentY,'o','MarkerEdgeColor','r',...
'MarkerFaceColor','w',...
'LineWidth',1.5,'Color',[0 0 0]);xbounds = xlim();set(gca,'xtick',(xbounds(1)-0.5):1:(xbounds(2)-0.5))
grid on
title('Mean and Std of Moment in X and Y for Buoy design')
xlabel('Load Case')
ylabel('Newton')
s = h.LineStyle;
h.LineStyle = ':';
set(gca, 'XTickLabel',{'5','1','3','4','5'})
h_legend = legend('Moment in X','Moment in Y')
set(h_legend,'Location','northwest')
% 
% 
% 
% 
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
set(gca, 'XTickLabel',{'5','1','3','4','5'})
axis([0.5,4,-5e7,10e7])


print(lol,'-depsc','FigureLOL.eps')
Content = Process_AtendHeader('FigureLOL.eps','Fbuoy.eps');
print(lol2,'-depsc','FigureLOL2.eps')
Content2 = Process_AtendHeader('FigureLOL2.eps','MomentBuoy.eps');

% set(gca,'xlim',[0.7 5.3])
% 
% figure;h=errorbar(1:5,meanFXb,stdFXb,'o','MarkerEdgeColor','r',...
% 'MarkerFaceColor','r',...
% 'LineWidth',1.5,'Color',[0 0 0]);xbounds = xlim();set(gca,'xtick',(xbounds(1)-0.5):1:(xbounds(2)-0.5))
% grid on
% title('Mean and Std of F_x for Buoy Design')
% xlabel('Load Case')
% ylabel('Meters')
% % ylim([1,10])
% s = h.LineStyle;
% h.LineStyle = ':';
% 
% 
% 
% 
% figure;h=errorbar(1:5,meanFYb,stdFYb,'o','MarkerEdgeColor','r',...
% 'MarkerFaceColor','r',...
% 'LineWidth',1.5,'Color',[0 0 0]);xbounds = xlim();set(gca,'xtick',(xbounds(1)-0.5):1:(xbounds(2)-0.5))
% grid on
% title('Mean and Std F_y for Buoy Design')
% xlabel('Load Case')
% ylabel('Meters')
% ylim([-2,2])
% s = h.LineStyle;
% h.LineStyle = ':';
% 
% 
% 
% % figure;h=errorbar(1:5,MeanPitchBuoy,StdPitchBuoy,'o','MarkerEdgeColor','r',...
% % 'MarkerFaceColor','r',...
% % 'LineWidth',1.5,'Color',[0 0 0]);xbounds = xlim();set(gca,'xtick',(xbounds(1)-0.5):1:(xbounds(2)-0.5))
% % grid on
% % title('Mean and Std of Pitch for Buoy design')
% % xlabel('Load Case')
% % ylabel('Degrees')
% % ylim([-3,9])
% % s = h.LineStyle;
% % h.LineStyle = ':';
% % 
% % 
% % 
% % 
% % figure;h=errorbar(1:5,MeanRollBuoy,StdRollBuoy,'o','MarkerEdgeColor','r',...
% % 'MarkerFaceColor','r',...
% % 'LineWidth',1.5,'Color',[0 0 0]);xbounds = xlim();set(gca,'xtick',(xbounds(1)-0.5):1:(xbounds(2)-0.5))
% % grid on
% % title('Mean and Std of Roll for  Buoy design')
% % xlabel('Load Case')
% % ylabel('Meters')
% % ylim([-1.5,1.5])
% % s = h.LineStyle;
% % h.LineStyle = ':';
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% 
