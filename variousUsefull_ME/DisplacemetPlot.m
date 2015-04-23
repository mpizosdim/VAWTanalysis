function DisplacemetPlot(x,y,TITLE,XLABEL,YLABEL)
lol = figure;
plot(x,y,'Color','k')
hold on
line([min(x) max(x)],[mean(y) mean(y)],'Color',[0.8 0 0])
h = line([min(x) max(x)],[mean(y)+std(y) mean(y)+std(y)],'Color','r');
s = h.LineStyle;
h.LineStyle = ':';
h = line([min(x) max(x)],[mean(y)-std(y) mean(y)-std(y)],'Color','r');
s = h.LineStyle;
h.LineStyle = ':';
hold off
xlim([min(x) max(x)])
grid on

h_xlabel=get(gca,'Xlabel');
set(h_xlabel,'FontSize',21);
h_ylabel=get(gca,'Ylabel');
set(h_ylabel,'FontSize',21);
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',18)
h_title=get(gca,'title');
set(h_title,'FontSize',17,'FontWeight','Bold');




title(TITLE)
xlabel(XLABEL)
ylabel(YLABEL)



h_xlabel=get(gca,'Xlabel');
set(h_xlabel,'FontSize',21);
h_ylabel=get(gca,'Ylabel');
set(h_ylabel,'FontSize',21);
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',18)
h_title=get(gca,'title');
set(h_title,'FontSize',17,'FontWeight','Bold');

print(lol,'-depsc','FigureLOL.eps')
Content = Process_AtendHeader('FigureLOL.eps','ConstantTurbBuoyDisp.eps');