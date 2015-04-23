function [Cl,Cd] = getClCd_deg(obj,Reynolds,angleofattack)


% if Reynolds > obj.ReynoldsNumCl(end) || Reynolds < obj.ReynoldsNumCl(1)
%     method = 'spline';
%     warning('Reynolds number in the node is out of the limit of the input data.Extrapolation is made with Spline method.Results could be inaccurate!!')
% else
%     method = 'linear';
% end
% 
% Cl = interp2(obj.ReynoldsNumCl,obj.angleOfAttackCl.deg,obj.Cl,Reynolds,angleofattack,method);
% Cd = interp2(obj.ReynoldsNumCd,obj.angleOfAttackCd.deg,obj.Cd,Reynolds,angleofattack,method);
% CHECK FOR OPTIMIZE INE THE FUTURE
[XGrid,YGrid]=meshgrid(obj.ReynoldsNumCl,obj.angleOfAttackCl.deg);
F1=griddedInterpolant(XGrid', YGrid',obj.Cl');
Cl=F1(Reynolds*ones(size(angleofattack)),angleofattack);

[XGridd,YGridd]=meshgrid(obj.ReynoldsNumCd,obj.angleOfAttackCd.deg);
F2=griddedInterpolant(XGridd', YGridd',obj.Cd');
Cd=F2(Reynolds*ones(size(angleofattack)),angleofattack);