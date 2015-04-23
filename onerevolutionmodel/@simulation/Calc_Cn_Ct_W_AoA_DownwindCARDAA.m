function [Cn,Ct,localRelativeVelocity,AngleOfAttack,localReynoldNumber,Cl,Cd,localTSR] = Calc_Cn_Ct_W_AoA_DownwindCARDAA(obj,V)
localTSR = obj.windTurbine.blade.localRadius*obj.rotationalSpeed./V;
ExpressionForUse = sqrt(((bsxfun(@minus,localTSR,sin(obj.azimuthalThitaDownwind.rad)')).^2)+bsxfun(@times,cos(obj.windTurbine.blade.delta).^2,(cos(obj.azimuthalThitaDownwind.rad).^2)'));
localRelativeVelocity = bsxfun(@times,V,ExpressionForUse);%V*ExpressionForUse';
localReynoldNumber =bsxfun(@times,(obj.windTurbine.blade.BladeReynoldsNumber.*obj.windTurbine.blade.ni./localTSR),ExpressionForUse);
AngleOfAttack = asin((bsxfun(@times,cos(obj.windTurbine.blade.delta),cos(obj.azimuthalThitaDownwind.rad)'))./ExpressionForUse);
[Cl,Cd] = obj.windTurbine.blade.airfoil.getClCd_rad(localReynoldNumber,AngleOfAttack,obj.Stall,localRelativeVelocity,obj.timestepPerThitaNode,obj.ThitaNodePerSide,obj.rotationalSpeed,obj.speedOfSound,obj.windTurbine.blade.thickness,obj.windTurbine.blade.chord,obj.azimuthalThitaDownwind.rad);
[Cn,Ct] = obj.CnCtCalc(Cl,Cd,AngleOfAttack);


