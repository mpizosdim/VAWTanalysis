classdef waveSimulation < handle
    properties
        Hs
        Tp
        length
        CdData
        CmData
        ReynoldsNumberData
        SeaDepth
        WaterAccelaration
        WaterVelocity
        WaterElevation
        ReynoldsNumber
        Cd
        Cm
        time
        Length
    end
    properties(Constant = true)
        KinematicViscocity = 10e-7; %m^2s-1
        Density = 999.97; % kg/m^3
        Gravity = 9.8067; % m/s^2
    end
    methods
        function obj = waveSimulation(Hs,Tp,SeaDepth,Length)
            obj.Hs = Hs;
            obj.Tp = Tp;
            obj.Length = Length;
            if SeaDepth>0
                warning('Depth of the sea should be negative.Negative values is chosen')
                obj.SeaDepth = -SeaDepth;
            else
                obj.SeaDepth = SeaDepth;
            end            
            [obj.CdData,obj.CmData,obj.ReynoldsNumberData]=obj.importCdCmWater();
        end
        [frequencydomain,a,Sjs] = JONSWAPspectrum(obj,df,fHighCut)
        [Cd] = CalcCdWater(obj,ReynoldsNumber)
        [Cm] = CalcCmWater(obj,ReynoldsNumber)
        [WaterElevation,WaterVelocity,WaterAccelaration] = CalcVelAccelWater(obj,df,fHighCut,time,Z)
        [ReynoldsNumber] =  CalcReynoldsNumberWater(obj,Velocity,kinematicViscosity,Radius)
    end
    methods(Static = true)
        [Cd,Cm,ReynoldsNumber]=importCdCmWater()
    end
end