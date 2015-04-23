close all
maxFx = [1.1e6 1.2e6 1.7e6 2.3e6 2.7e6];
maxFy = [6.3e5 7e5 1e6 1.4e6 2.1e6];
maxSurge = [4 5.9 8.2 15.7 20.8];
maxSway = [0.32 0.46 0.8 2.1 4.7];
[hAx,hLine1,hLine2] =plotyy(1:5,maxFx,1:5,maxSurge);
hLine1.Marker = 's';
hLine2.Marker = '^';
hLine1.LineStyle = '--';
hLine2.LineStyle = '--';
hLine1.Color = 'k';
hLine2.Color = [0.8 0.2 0.2];
set(hAx,{'ycolor'},{'k';[0.8 0.2 0.2]})
grid on
title('Max values: Aerodynamic F_X and Surge')
h_legend = legend('Forces in X','Surge');
xlabel('Load Case')
ylabel(hAx(1),'Aerodynamic Forces in X [N]') % left y-axis
ylabel(hAx(2),'Surge [m]') 
 set(gca, 'XTickLabel',{'1','2','3','4','5'})

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
      Content2 = Process_AtendHeader('FigureLOL3.eps','MaxvaluesXTLP.eps');
