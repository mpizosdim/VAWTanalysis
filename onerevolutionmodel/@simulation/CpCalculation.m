function [Cp1,Cp2,averageCycleTorque ] = CpCalculation(obj)
for thetaNode = 1:obj.ThitaNodeTotal
    Torque(thetaNode) = CalculationTorque(obj,thetaNode);
end
if any(isnan(Torque(:)))
    Torque = Smouth1DmatrixWithNaN(Torque);
end
averageCycleTorque = (obj.windTurbine.NumOfBlades/(2*pi))*trapz(Torque)*deg2rad(obj.dthita);
for thetaNode = 1:obj.ThitaNodeTotal
    UsefulExpression1(:,thetaNode) = obj.CtTotal(:,thetaNode).*((obj.localRelativeVelocityTotal(:,thetaNode)./obj.WindSimulation.Vatmospheric').^2).*(obj.windTurbine.blade.ni'./cos(obj.windTurbine.blade.delta'));
end
if any(isnan(UsefulExpression1(:)))
    UsefulExpression1 = Smouth2DmatrixWithNaN(UsefulExpression1);
end
for thetaNode = 1:obj.ThitaNodeTotal
    UsefulExpression2(thetaNode) = trapz(UsefulExpression1(:,thetaNode))*(2/(obj.NumberOfNodes));
end
averageCycleTorqueCoef = ((obj.windTurbine.blade.chord*obj.windTurbine.blade.H*obj.windTurbine.NumOfBlades)/(2*pi*obj.windTurbine.sweptArea))*trapz(UsefulExpression2)*deg2rad(obj.dthita);
averageCycleTorqueCoef2 = averageCycleTorque/((1/2)*obj.WindSimulation.AirDensity*(obj.WindSimulation.VatmosphericEquator^2)*obj.windTurbine.sweptArea*obj.windTurbine.blade.R);
Cp1 = (obj.windTurbine.blade.R*obj.rotationalSpeed/obj.WindSimulation.VatmosphericEquator)*averageCycleTorqueCoef;
Cp2 = (obj.windTurbine.blade.R*obj.rotationalSpeed/obj.WindSimulation.VatmosphericEquator)*averageCycleTorqueCoef2;