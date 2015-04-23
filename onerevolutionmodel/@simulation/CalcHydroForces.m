function [FhydroX,FhydroY] = CalcHydroForces(obj,t,q)
indexT=round(t/obj.timestepPerThitaNode)+1;
WaterVelocity = obj.WaveSimulation.WaterVelocity(:,indexT);
WaterAcceleration = obj.WaveSimulation.WaterAccelaration(:,indexT);
Cd = 0.6;
Cm = 1;
for Node = 1:obj.NumberOfNodes
    FhydroXNode(Node) = (1/2)*obj.WaveSimulation.Density*(2*obj.windTurbine.floater.Radius)*Cd*(WaterVelocity(Node)-q(3))*abs(WaterVelocity(Node)-q(3))+obj.WaveSimulation.Density*(pi)*(((2*obj.windTurbine.floater.Radius)^2)/4)*(Cm+1)*WaterAcceleration(Node);
    FhydroYNode(Node) = (1/2)*obj.WaveSimulation.Density*(2*obj.windTurbine.floater.Radius)*Cd*(-q(4))*abs(-q(4));
end
FhydroX = trapz(obj.windTurbine.floater.Z_node,FhydroXNode);
FhydroY = trapz(obj.windTurbine.floater.Z_node,FhydroYNode);
