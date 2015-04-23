function Mzmesh2(varargin)
%Mzmesh(X,Y,Z,Grad,,xlabel,ylabel,zlabel,title,export)
X= varargin{1};
Y=varargin{2};
Z = varargin{3};
C = del2(Z);
figure;
% A = axes;

if varargin{4}==1
    G=gradient(Z);
    h=mesh(X,Y,Z,abs(G));
%     set(A,'Xscale','log')
    set(h,'FaceColor','interp')
    set(h,'EdgeColor','k')
    
    
else
    h=mesh(X,Y,Z);
    set(h,'FaceColor','interp')
    set(h,'EdgeColor',[0.2 0.2 0.2])
end
%alphaRate = ([alpha(1) diff(alpha)])/timestep/(1+(alpha(1)==1));


h2 = colorbar('northoutside');

set(h2,'fontsize',13);
title(varargin{end-1})
xlabel(varargin{end-4})
ylabel(varargin{end-3})
zlabel(varargin{end-2})
h_xlabel=get(gca,'Xlabel');
set(h_xlabel,'FontSize',18);
h_ylabel=get(gca,'Ylabel');
set(h_ylabel,'FontSize',18);
h_zlabel=get(gca,'Zlabel');
set(h_zlabel,'FontSize',18);
h_title=get(gca,'title');
set(h_title,'FontSize',15,'FontWeight','Bold')
set(gca,'fontsize',16)
%------------------------
% ax = gca;
% axpos = ax.Position;
% cpos = h2.Position;
% cpos(3) = 0.5*cpos(3);
% h2.Position = cpos;
% ax.Position = axpos;
%-------------------------
if varargin{end}==1
   scrsz = get(0,'ScreenSize');
    set(gcf,'position',scrsz);
    print -depsc Figure.eps
end
