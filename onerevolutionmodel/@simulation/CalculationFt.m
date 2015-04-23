function Ft = CalculationFt(obj,thetaNode)
CFt = obj.CtTotal(:,thetaNode).*((obj.localRelativeVelocityTotal(:,thetaNode)./obj.WindSimulation.Vatmospheric').^2).*(obj.windTurbine.blade.ni'./cos(obj.windTurbine.blade.delta'));% to thetaNode apo to thetaNodeTotal.

if any(isnan(CFt(:)))
    CFt = Smouth1DmatrixWithNaN(CFt);
end



Ft = (obj.windTurbine.blade.chord*obj.windTurbine.blade.H/obj.windTurbine.sweptArea)*trapz(CFt)*(2/(obj.NumberOfNodes));
% CFt = obj.CtTotal(:,thetaNode).*((obj.localRelativeVelocityTotal(:,thetaNode)./obj.WindSimulation.Vatmospheric').^2)./cos(obj.windTurbine.blade.delta');% to thetaNode apo to thetaNodeTotal.
% Ft = (obj.windTurbine.blade.chord/obj.windTurbine.sweptArea)*trapz(CFt);