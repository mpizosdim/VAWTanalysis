function [Cl,Cd] = DynamicStallB_InTime(obj,Reynolds,AngleOfAttack,PreviousAngleOfAttack,RelativeVecity)
[CLdyn,CDdyn] = DynamicStallG_InTime(obj,Reynolds,AngleOfAttack,PreviousAngleOfAttack,RelativeVecity);
Cls = obj.windTurbine.blade.airfoil.getCl_rad(Reynolds,AngleOfAttack);
Cds = obj.windTurbine.blade.airfoil.getCd_rad(Reynolds,AngleOfAttack);
Am = 6;
CriticalAngleOfAttackTemp = obj.windTurbine.blade.airfoil.getCriticalAngleOfAttackVer2(Reynolds);
CriticalAngleOfAttack = deg2rad(CriticalAngleOfAttackTemp);% CriticalAngleOfAttackTemp.rad;
CLmod = Cls + ((Am .* CriticalAngleOfAttack - AngleOfAttack) ./ (Am .* CriticalAngleOfAttack - CriticalAngleOfAttack) .* (CLdyn - Cls)) .* (AngleOfAttack <= Am .* CriticalAngleOfAttack);
CDmod = Cds + ((Am .* CriticalAngleOfAttack - AngleOfAttack) ./ (Am .* CriticalAngleOfAttack - CriticalAngleOfAttack) .* (CDdyn - Cds)) .* (AngleOfAttack <= Am .* CriticalAngleOfAttack);
Cl = CLmod;
Cd = CDmod;