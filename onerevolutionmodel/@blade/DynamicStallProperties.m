function obj = DynamicStallProperties(obj)

obj.Sc = 0.06 + 1.5*(0.06 - obj.thickness/obj.chord); 
obj.M1Lift = 0.4 + 5*(0.06 - obj.thickness/obj.chord);
obj.M2Lift = 0.9 + 2.5*(0.06 - obj.thickness/obj.chord);
obj.M1Drag = 0.2;
obj.M2Drag = 0.7 + 2.5*(0.06 - obj.thickness/obj.chord);
obj.GammaMaxLift = 1.4 + 6*(0.06 - obj.thickness/obj.chord);
obj.GammaMaxDrag = 1 + 2.5*(0.06 - obj.thickness/obj.chord);
obj.GammaLiftStric = 1.4 - 6*(0.06 - obj.thickness/obj.chord);
obj.GammaDragStric = 1 - 2.5*(0.06 - obj.thickness/obj.chord);