function [Cl] = getCl_rad(obj,Reynolds,angleofattack)
% if (Reynolds > obj.ReynoldsNumCl(end)) || (Reynolds < obj.ReynoldsNumCl(1))
%     method = 'spline';
%     warning('Reynolds number in the node is out of the limit of the input data.Extrapolation is made with Spline method.Results could be inaccurate!!')
% else
%     method = 'linear';
% end
% Cl = interp2(obj.ReynoldsNumCl,obj.angleOfAttackCl.rad,obj.Cl,Reynolds,angleofattack,method);
% CHECK FOR OPTIMIZE INE THE FUTURE
Cl=obj.FCl(Reynolds,angleofattack);

% [XGridd,YGridd]=meshgrid(obj.ReynoldsNumCd,obj.angleOfAttackCd.deg);
% F=griddedInterpolant(XGridd', YGridd',obj.Cd',method);
% Cd=F(Reynolds,angleofattack);