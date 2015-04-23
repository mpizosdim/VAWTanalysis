classdef WindSimulation < handle
    properties
        windShearExponent
        WindModel
        VatmosphericEquator
        Vatmospheric
        Intensity
        lx
        ly
        S
        bpx
        bpy
        epsilon
        TurbulenceVelocityX
        fluctuationX
        TurbulenceVelocityY
        fluctuationY
        Class
        Gust
        EDC
        Sigma
    end
    
    properties(Constant = true)
        AirDensity = 1.225; %kg/m^3
    end
    methods
        function obj = WindSimulation(windShearExponent,VatmosphericEquator,WindModel,Intensity,lx,ly,Class,Gust,Period,StartingTime,EDC,periodEDC,startingTimeEDC)
            obj.windShearExponent = windShearExponent;
            obj.WindModel = WindModel;
            obj.Class = Class;
            obj =WindTurbineClass(obj);
            obj.Gust.Implimintation = Gust;
            obj.Gust.Period = Period;
            obj.Gust.StartingTime = StartingTime;
            obj.EDC.Implimintation = EDC;
            obj.EDC.periodEDC = periodEDC;
            obj.EDC.startingTimeEDC = startingTimeEDC;
            if strcmp(WindModel,'Turbulence Model(Kaimal)')
                obj.Intensity =  Intensity;
                obj.lx = lx;
                obj.ly = ly;
            end
            obj.VatmosphericEquator = VatmosphericEquator;
            Vave = 0.2*obj.Class.Vref;
            c = 2;
            obj.Sigma = c*obj.Class.Iref*(0.072*((Vave/c)+3)*((obj.VatmosphericEquator/c)-4)+10);
        end
        Vatmospheric = WindVelocityCalc(obj,H,Z_r,z)
        [Sx,bpx,Sy,bpy,epsilon] = KaimalSpectrum(obj,df,fHighCut)
        [TurbulenceVelocityX,fluctuationX,TurbulenceVelocityY,fluctuationY] = TurbWindVelocityCalc(obj,t,df,fHighCut)
        obj =WindTurbineClass(obj)
        [ExtremeWindX,ExtremefluctuationX] = CalcExtremeWind(obj,flactution,timestepPerThitaNode,H,Z_r,z,TotalTime)
        [ExtremeWindX,ExtremefluctuationX,ExtremeWindY,ExtremefluctuationY,indVNew,azimuthalAngleNew,ReynoldsNew] = ExtremeDirectionChange(obj,timestepPerThitaNode,TotalTime,indV,azimuthalAngle,Reynolds)
    end
end