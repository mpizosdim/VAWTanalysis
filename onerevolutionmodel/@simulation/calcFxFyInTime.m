function [Fx,Fy] = calcFxFyInTime(obj,Cn,Ct,theta,RelativeVelocity)

LocalRelativeDynamicPressure = (1/2)*obj.WindSimulation.AirDensity.*(RelativeVelocity).^2;
Fx = LocalRelativeDynamicPressure.*obj.windTurbine.blade.chord.*(-Cn.*cos(theta)+Ct.*(sin(theta)./cos(obj.windTurbine.blade.delta')))*(obj.windTurbine.blade.deltaZ);
Fy = LocalRelativeDynamicPressure.*obj.windTurbine.blade.chord.*(Cn.*sin(theta)+Ct.*(cos(theta)./cos(obj.windTurbine.blade.delta')))*(obj.windTurbine.blade.deltaZ);

if any(isnan(Fx(:)))
    Fx = Smouth1DmatrixWithNaN(Fx);
end

if any(isnan(Fy(:)))
    Fy = Smouth1DmatrixWithNaN(Fy);
end




