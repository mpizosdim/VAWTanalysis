close all
maxFx = [ 1.6e6 1.8e6 2.8e6 3.1e6];
maxFy = [ 8.9e5 1e6 1.8e6 2.7e6];
maxMomentx = [ 6.9e7 7.9e7 1.2e8 1.27e8];
maxMomenty = [ 4e7 4.4e7 8.5e7 1.2e8];
maxSurge = [20.7 27 42.8 56.5];
 maxPitch = [ 4.9 12.7 16.3 18.5];
 maxSway = [2 3 6.7 15];
 maxRoll = [0.32 0.45 2.8 5.2];
[hAx,hLine1,hLine2] =plotyy(1:4,maxFy,1:4,maxSway);
hLine1.Marker = 's';
hLine2.Marker = '^';
hLine1.LineStyle = '--';
hLine2.LineStyle = '--';
hLine1.Color = 'k';
hLine2.Color = [0.8 0.2 0.2];
set(hAx,{'ycolor'},{'k';[0.8 0.2 0.2]})
grid on
title('Max values for Aerodynamic F_Y and Sway Motion')
h_legend = legend('Forces in Y','Sway');
xlabel('Load Case')
ylabel(hAx(1),'Aerodynamic Forces in Y [N]') % left y-axis
ylabel(hAx(2),'Sway [m]') 
 set(gca, 'XTickLabel',{'2','','3','','4','','5'})

h_xlabel=get(gca,'Xlabel');
set(h_xlabel,'FontSize',21);
h_ylabel=get(gca,'Ylabel');
set(h_ylabel,'FontSize',21);
a = get(gca,'XTickLabel');

set(gca,'XTickLabel',a,'fontsize',18)
set(hLine1(1),'Marker','s','MarkerSize',11)
set(hLine2(1),'Marker','^','MarkerSize',11)
set(hAx(1),'XTickLabel',a,'fontsize',18)
set(hAx(2),'XTickLabel',a,'fontsize',18)
h_title=get(gca,'title');
set(h_title,'FontSize',17,'FontWeight','Bold');

 set(h_legend,'Location','northwest')
 
 
% %  
    print(gcf,'-depsc','FigureLOL3.eps')
    Content2 = Process_AtendHeader('FigureLOL3.eps','MaxvaluesY.eps');
