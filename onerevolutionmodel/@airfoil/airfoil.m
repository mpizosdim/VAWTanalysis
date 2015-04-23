classdef airfoil < handle
    properties
        name%@string % name of the airfoil
        angleOfAttackCl % Data: angle of attack from Cl table
        ReynoldsNumCl % Data: Reynolds number from Cl table
        Cl % Data: Lift Coefficient
        angleOfAttackCd % Data: angle of attack from Cd table
        ReynoldsNumCd % Data: Reynolds number from Cd table
        Cd % Data: Drag Coefficient
        FCl
        FCd
        CriticalAngleOfAttack
        ReynoldsCritical
    end
    
    methods
        function obj = airfoil(name)
            obj.name= name;
            [obj.Cl,obj.angleOfAttackCl,obj.ReynoldsNumCl] = obj.importCldata(name);
            [obj.Cd,obj.angleOfAttackCd,obj.ReynoldsNumCd] = obj.importCddata(name);
            if length(obj.angleOfAttackCl)~=length(obj.angleOfAttackCl)
                warning('Data for Cl and Cd have different dimensions')
            end
            [obj.CriticalAngleOfAttack,obj.ReynoldsCritical] = importCriticalAngleOfAttack(obj,name);
            [XGrid,YGrid]=meshgrid(obj.ReynoldsNumCl,obj.angleOfAttackCl.rad);
            obj.FCl=griddedInterpolant(XGrid', YGrid',obj.Cl');
            [XGrid,YGrid]=meshgrid(obj.ReynoldsNumCd,obj.angleOfAttackCd.rad);
            obj.FCd=griddedInterpolant(XGrid', YGrid',obj.Cd');            
        end
        [Cl,Cd] = getClCd_deg(obj,Reynolds,angleofattack) %Interpolates and returns Cl and Cd in degrees
        [Cl,Cd] = getClCd_rad(obj,Reynolds,angleofattack,Stall,localRelativeVelocity,timestep,ThitaNodePerSide,rotationalSpeed,SpeedOfSound,thickness,chord,theta) %Interpolates and returns Cl and Cd in radians
        [Cl] = getCl_rad(obj,Reynolds,angleofattack)
        [Cl] = getCd_rad(obj,Reynolds,angleofattack)
        angleOfAttackOptim = getAngleOfAttack_MaxLiftDragRatio(obj,Reynolds) % angle of attack for maximum Cl/Cd ratio
        angleOfAttack_ZeroLift = getAngleOfAttack_ZeroLift(obj,Reynolds) % angle of attack for Zero Lift(minimum lift Coefficent)
        CriticalAngleOfAttack = getCriticalAngleOfAttack(obj,Reynolds) % angle of attack where the airfoil stalls
        [CLdyn,CDdyn] = DynamicStallG(obj,localReynoldNumber,AngleOfAttack,alphaRate,locaRelativeVelocity,ThitaNodePerSide,rotationalSpeed,SpeedOfSound,thickness,chord)
        [CLmod,CDmod] = DynamicStallB(obj,localReynoldNumber,AngleOfAttack,alphaRate,localRelativeVelocity,ThitaNodePerSide,rotationalSpeed,SpeedOfSound,thickness,chord)
        [CLdyn,CDdyn] = DynamicStallS(obj,localReynoldNumber,AngleOfAttack,alphaRate,localRelativeVelocity,ThitaNodePerSide,rotationalSpeed,SpeedOfSound,thickness,chord)
        CriticalAngleOfAttack = getCriticalAngleOfAttackVer2(obj,Reynolds)
    end
    methods(Static = true)
        [Cl,angleOfAttackCl,ReynoldsNumCl] = importCldata(name) % imports the Cl excel file
        [Cd,angleOfAttackCd,ReynoldsNumCd]  = importCddata(name) % imports the Cd excel file
    end
end
