function [FxOneRevolution,FyOneRevolution,FxTotalOneRevolution,FyTotalOneRevolution,FxTotalNodeInTime,FyTotalNodeInTime,FxTotalInTime,FyTotalInTime] = FxFyCalcInTime(obj)

Fn = obj.CnTotal.*(1/2).*((obj.localRelativeVelocityTotal).^2).*obj.WindSimulation.AirDensity.*obj.windTurbine.blade.chord;
Ft = obj.CtTotal.*(1/2).*((obj.localRelativeVelocityTotal).^2).*obj.WindSimulation.AirDensity.*obj.windTurbine.blade.chord;

theta = [obj.azimuthalThitaUpwind.rad obj.azimuthalThitaDownwind.rad];

FxOneRevolution = bsxfun(@times,Fn,cos(theta))-bsxfun(@times,Ft,sin(theta));
FyOneRevolution = -bsxfun(@times,Fn,sin(theta))+bsxfun(@times,Ft,cos(theta));


indCT=1:length(theta);
stepCT=length(theta)/obj.windTurbine.NumOfBlades;
FxTotalOneRevolution = zeros(size(FxOneRevolution));
FyTotalOneRevolution = zeros(size(FyOneRevolution));
for i=1:obj.windTurbine.NumOfBlades
    FxTotalOneRevolution=FxTotalOneRevolution+[FxOneRevolution(:,indCT>(stepCT*(i-1))),FxOneRevolution(:,indCT<=(stepCT*(i-1)))];
    FyTotalOneRevolution=FyTotalOneRevolution+[FyOneRevolution(:,indCT>(stepCT*(i-1))),FyOneRevolution(:,indCT<=(stepCT*(i-1)))];
end

TotalRoundsOfTurbine  = length(obj.time)/obj.ThitaNodeTotal;
NaturalTotalRoundsOfTurbine= ceil(TotalRoundsOfTurbine);
FxTotalNodeInTime = repmat(FxTotalOneRevolution,1,NaturalTotalRoundsOfTurbine);
FyTotalNodeInTime = repmat(FyTotalOneRevolution,1,NaturalTotalRoundsOfTurbine);
FxTotalNodeInTime(:,(length(obj.time)+1):end) = [];
FyTotalNodeInTime(:,(length(obj.time)+1):end) = [];
FxTotalInTime = sum(FxTotalNodeInTime);
FyTotalInTime = sum(FyTotalNodeInTime);


