function Torque = CalculationTorque(obj,thetaNode)
CTorque = obj.CtTotal(:,thetaNode).*((obj.localRelativeVelocityTotal(:,thetaNode)).^2).*(obj.windTurbine.blade.ni'./cos(obj.windTurbine.blade.delta'));% to thetaNode apo to thetaNodeTotal.

if any(isnan(CTorque(:)))
    CTorque = Smouth1DmatrixWithNaN(CTorque);
end




Torque = (1/2)*obj.WindSimulation.AirDensity*obj.windTurbine.blade.chord*obj.windTurbine.blade.H*obj.windTurbine.blade.R*trapz(CTorque)*(2/(obj.NumberOfNodes));