function [Cd] = getCd_rad(obj,Reynolds,angleofattack)
% if (Reynolds > obj.ReynoldsNumCd(end)) || (Reynolds < obj.ReynoldsNumCd(1))
%     method = 'spline';
%     warning(['Reynolds number in the node is out of the limit of the input data.Extrapolation'...
%         'is made with Spline method.Results could be inaccurate or the Iteration could last for ever!!'])
% else
%     method = 'linear';
% end
% Cd = interp2(obj.ReynoldsNumCd,obj.angleOfAttackCd.rad,obj.Cd,Reynolds,angleofattack,method);

%CHECK FOR OPTIMIZE IN THE FUTURE.WORKS FOR FULL SIMULATION.DOESNT WORK FOR
%CALCULATING THE CRITICAL ANGLE OF ATTACK.
Cd=obj.FCd(Reynolds,angleofattack);

% [XGridd,YGridd]=meshgrid(obj.ReynoldsNumCd,obj.angleOfAttackCd.rad);
% F=griddedInterpolant(XGridd', YGridd',obj.Cd',method);
% Cd=F(Reynolds,angleofattack);