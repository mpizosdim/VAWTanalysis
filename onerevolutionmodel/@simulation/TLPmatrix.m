function obj = TLPmatrix(obj)

obj.MassMatrix = [obj.windTurbine.Mass 0;0 obj.windTurbine.Mass];
%Check for Cm  =1 and after i see how to do it]
Cm = 1;%1
obj.AddedMassMatrix = [-obj.WaveSimulation.Density*(pi)*(((2*obj.windTurbine.floater.Radius)^2)/4)*Cm*obj.windTurbine.floater.draft 0;0 -obj.WaveSimulation.Density*(pi)*(((2*obj.windTurbine.floater.Radius)^2)/4)*Cm*obj.windTurbine.floater.draft];
obj.Cmatrix=[obj.BuyancyForce/obj.windTurbine.floater.TetherLength 0 ; 0 obj.BuyancyForce/obj.windTurbine.floater.TetherLength];