function Mzplot2(varargin)
% Mzplot(X1,Y1,X2,Y2,...,XN,YN,Legend1,Legend2,...,LegendN,,labelX,labelY,title,exportFigure,position,text,textposition)
lineStyle = {'--','',':','','--*','',':o'};%{':gs','',':^','',':*','',':o'};
N = (nargin-7)/3;
% figure
for ii=1:2:2*N
    plot(varargin{ii},varargin{ii+1},lineStyle{ii},'MarkerSize',10)
    hold on
end
set(findobj('Type','line'),'Color','k')
set(findobj('Type','line'),'LineWidth',1.5)
legends = varargin(((2*(nargin-7)/3)+1):(((2*(nargin-7)/3)+1)+N-1));
h_legend=legend(legends{:});

switch varargin{(((2*(nargin-7)/3)+1)+N+4)}
    case 1
        set(h_legend,'Location','northwest')
    case 2
        set(h_legend,'Location','northeast')
    case 3
        set(h_legend,'Location','southwest')
    case 4
        set(h_legend,'Location','southeast')
end


xlabel(varargin{(((2*(nargin-7)/3)+1)+N)})
ylabel(varargin{(((2*(nargin-7)/3)+1)+N+1)})

h_xlabel=get(gca,'Xlabel');
set(h_xlabel,'FontSize',19);
h_ylabel=get(gca,'Ylabel');
set(h_ylabel,'FontSize',19);
if varargin{(((2*(nargin-7)/3)+1)+N+2)}~=0
    title(varargin{(((2*(nargin-7)/3)+1)+N+2)})
    h_title=get(gca,'title');
    set(h_title,'FontSize',15,'FontWeight','Bold');
end
grid on

set(gca,'fontsize',17)
set(h_legend,'FontSize',18)%change to 18 for the thesis
set(h_legend,'EdgeColor',[0.99 0.99 0.99])
% set(h_legend,'Color',[1 1 1],'XColor',[1 1 1],'YColor',[1 1 1],'EdgeColor',[1 1 1])

xlim([min(varargin{1}) max(varargin{1})])





% if varargin{(((2*(nargin-7)/3)+1)+N+5)}~=0
    RangeX = linspace(min(varargin{1}),max(varargin{1}),10);
    RangeY = linspace(min(min(varargin{2}),min(varargin{4})),max(max(varargin{2}),max(varargin{4})),10);%change here
    Text = cellstr(varargin{(((2*(nargin-7)/3)+1)+N+5)});
    switch varargin{(((2*(nargin-7)/3)+1)+N+6)}
        case 1
            for ii=1:length(Text)
                text(RangeX(2),RangeY(10-ii),Text(ii),'FontSize',16);
            end
        case 2
            for ii=1:length(Text)
                text(RangeX(9),RangeY(10-ii),Text(ii),'FontSize',16);
            end
        case 3
            Text2 = Text(end:-1:1);
            for ii=length(Text):-1:1
                text(RangeX(2),RangeY(ii+1),Text2(ii),'FontSize',16);
            end
        case 4
            Text2 = Text(end:-1:1);
            for ii=length(Text):-1:1
                text(RangeX(9),RangeY(ii+1),Text2(ii),'FontSize',16);
            end
    end
    
% end

if varargin{(((2*(nargin-7)/3)+1)+N+3)}==1
    scrsz = get(0,'ScreenSize');
    set(gcf,'position',scrsz);
    print -depsc Figure.eps
end

