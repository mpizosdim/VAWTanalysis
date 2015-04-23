classdef windTurbine < handle
    properties
        NumOfBlades 
        Z_r 
        blade@blade 
        tower@tower
        sweptArea
        Solidity
        shapeType
        floater@floater
        Mass
        CenterOfMass
        Inertia0
        Izz
        IzzRotor
    end
    
    methods
        function obj = windTurbine(NumOfBlades,blade,tower,Z_r,shapeType,floater,IzzRotor)
            obj.NumOfBlades = NumOfBlades;
            obj.floater = floater;
            obj.blade = blade;
            obj.tower = tower;
            obj.Z_r = Z_r;
            obj.IzzRotor=IzzRotor;
            AdditionalMassZ_r = 0;
            obj.shapeType = shapeType;
            obj.Mass = (obj.NumOfBlades*obj.blade.Mass)+obj.floater.Mass+obj.tower.Mass+AdditionalMassZ_r;
            obj.CenterOfMass = (obj.floater.Mass*obj.floater.CenterMass+(obj.tower.Mass+obj.NumOfBlades*obj.blade.Mass)*obj.tower.CenterMass)/obj.Mass;
            obj.Inertia0 = obj.floater.InertiaCM+obj.floater.Mass*(obj.floater.CenterMass)^2+obj.tower.Inertia+obj.tower.Mass*(obj.tower.CenterMass)^2;
            if strcmp(floater.type,'BUOY')
               obj.Izz = ((1/2)*(obj.NumOfBlades*obj.blade.Mass)*(obj.blade.R)^2)+(obj.NumOfBlades*obj.blade.Mass*obj.tower.CenterMass^2);
            end 
        end
        TurbineReynolds = TurbineReynoldsCalc(obj,wmega)
        sweptArea = CalcSweptArea(obj,localRadius,localHeights,shapeType)
        Solidity = CalcSolidity(obj)
    end
end