function [FhydroX,FhydroY,ThydroX,ThydroY] = CalcHydroForces4DOF(obj,t,q)
indexT=round(t/obj.timestepPerThitaNode)+1;
WaterVelocity = obj.WaveSimulation.WaterVelocity(:,indexT);
WaterAcceleration = obj.WaveSimulation.WaterAccelaration(:,indexT);
Cd = 0.6;
Cm = 1;
for Node = 1:obj.NumberOfNodes
    FhydroXNode(Node) = (1/2)*obj.WaveSimulation.Density*(2*obj.windTurbine.floater.Radius)*Cd*(WaterVelocity(Node)-(q(5)+q(6)*obj.windTurbine.floater.Z_node(Node)))*abs(WaterVelocity(Node)-(q(5)+q(6)*obj.windTurbine.floater.Z_node(Node)))+obj.WaveSimulation.Density*(pi)*(((2*obj.windTurbine.floater.Radius)^2)/4)*(Cm+1)*WaterAcceleration(Node);
    FhydroYNode(Node) = (1/2)*obj.WaveSimulation.Density*(2*obj.windTurbine.floater.Radius)*Cd*(-(q(7)+q(8)*obj.windTurbine.floater.Z_node(Node)))*abs(-(q(7)+q(8)*obj.windTurbine.floater.Z_node(Node)));
    ThydroXNode(Node) = FhydroXNode(Node)*obj.windTurbine.floater.Z_node(Node);
    ThydroYNode(Node) = FhydroYNode(Node)*obj.windTurbine.floater.Z_node(Node);
end
FhydroX = trapz(obj.windTurbine.floater.Z_node,FhydroXNode);
FhydroY = trapz(obj.windTurbine.floater.Z_node,FhydroYNode);
ThydroX = trapz(obj.windTurbine.floater.Z_node,ThydroXNode);
ThydroY = trapz(obj.windTurbine.floater.Z_node,ThydroYNode);