function Mzplot(varargin)
% Mzplot(X,Y1,Y2,...,YN,Legend1,Legend2,...,LegendN,title,labelX,labelY,exportFigure,position)
if nargin==1
    varargin{2} = varargin{1};
    varargin{1} = 1:length(varargin{2});
    [varargin{3:6}] = deal('');
    varargin{7}=0;
    varargin{8}=4;
elseif nargin==2
    [varargin{3:6}] = deal('');
    varargin{7}=0;
    varargin{8}=4;
    
elseif nargin==3
    [varargin{4:8}] = deal('');
    varargin{9}=0;
    varargin{10}=4;
    
    
elseif nargin==4
    [varargin{5:10}] = deal('');
    varargin{11}=0;
    varargin{12}=4;
    
    
elseif nargin==5
    [varargin{6:12}] = deal('');
    varargin{13}=0;
    varargin{14}=4;
    
end
NewNargin = length(varargin);
X=varargin{1};
lineStyle = {'-','--','-.',':'};
y=(NewNargin-5)/2;
figure
for ii=1:y
    plot(X,varargin{ii+1},lineStyle{ii})
    hold on
end
set(findobj('Type','line'),'Color','k')
set(findobj('Type','line'),'LineWidth',1.5)
legends = varargin(y+1:NewNargin-5);
h_legend=legend(legends{:});

switch varargin{end}
    case 1
        set(h_legend,'Location','northwest')
    case 2
        set(h_legend,'Location','northeast')
    case 3
        set(h_legend,'Location','southwest')
    case 4
        set(h_legend,'Location','southeast')
end


xlabel(varargin{end-3})
ylabel(varargin{end-2})

h_xlabel=get(gca,'Xlabel');
set(h_xlabel,'FontSize',19);
h_ylabel=get(gca,'Ylabel');
set(h_ylabel,'FontSize',19);
if varargin{end-4}~=0
    title(varargin{end-4})
    h_title=get(gca,'title');
    set(h_title,'FontSize',15,'FontWeight','Bold');
end
grid on

set(gca,'fontsize',17)
set(h_legend,'FontSize',18)
set(h_legend,'EdgeColor',[0.99 0.99 0.99])
% set(h_legend,'Color',[1 1 1],'XColor',[1 1 1],'YColor',[1 1 1],'EdgeColor',[1 1 1])
if varargin{end-1}==1
    scrsz = get(0,'ScreenSize');
    set(gcf,'position',scrsz);
    print -depsc Figure.eps
end


