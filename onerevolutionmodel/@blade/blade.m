classdef blade < handle
    properties
        ni % nondimensional Cartesian coordinate
        zita % nondimensional Cartesian coordinate
        delta % angle between the blade normal and the equatorial plane
        chord %chord of the airfoil
        thickness % thickness of the airfoil
        R % Rotor radius at the equator,m
        H % Half-height of the rotor,m
        airfoil@airfoil % blade airfoil type
        Length
        localHeights
        localRadius
        BladeReynoldsNumber
        Mass
        deltaZ
        PhysicalHeight
        Sc
        M1Lift
        M2Lift
        M1Drag
        M2Drag
        GammaMaxLift
        GammaMaxDrag
        GammaLiftStric
        GammaDragStric
    end
    
    methods
        function obj = blade(airfoil,H,R,thickness,chord,Mass)
            obj.airfoil = airfoil;
            obj.R = R;
            obj.H = H;
            obj.thickness = thickness;
            obj.chord = chord;
            obj.Mass = Mass;
            obj = DynamicStallProperties(obj);
        end
        [ni,zita,delta,localHeights,localRadius,deltaZ,PhysicalHeight] = RotorBladeShapeCalc(obj,NumberOfNodes,shapeType,Z_r) % calculates the blade shape (ni,zita,delta),should check what to do wit hthe radians!
        [BladeReynoldsNumber] = BladeReynoldsNumberCalc(obj,rotationalSpeed) %check this equation again for the kinematic viscosity
        [Length] = bladeLengthCalc(obj,shapetype)
        obj = DynamicStallProperties(obj)
    end
end