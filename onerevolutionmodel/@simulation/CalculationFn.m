function Fn = CalculationFn(obj,thetaNode)
CFn = obj.CnTotal(:,thetaNode).*((obj.localRelativeVelocityTotal(:,thetaNode)./obj.WindSimulation.Vatmospheric').^2).*(obj.windTurbine.blade.ni'./cos(obj.windTurbine.blade.delta'));% to thetaNode apo to thetaNodeTotal.
if any(isnan(CFn(:)))
    CFn = Smouth1DmatrixWithNaN(CFn);
end



Fn = (obj.windTurbine.blade.chord*obj.windTurbine.blade.H/obj.windTurbine.sweptArea)*trapz(CFn)*(2/(obj.NumberOfNodes));%are we surefor that?
% CFn = obj.CnTotal(:,thetaNode).*((obj.localRelativeVelocityTotal(:,thetaNode)./obj.WindSimulation.Vatmospheric').^2);% to thetaNode apo to thetaNodeTotal.
% Fn = (obj.windTurbine.blade.chord/obj.windTurbine.sweptArea)*trapz(CFn);