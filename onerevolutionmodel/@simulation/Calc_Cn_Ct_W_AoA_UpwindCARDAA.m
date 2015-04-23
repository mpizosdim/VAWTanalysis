function [Cn,Ct,localRelativeVelocity,AngleOfAttack,localReynoldNumber,Cl,Cd,localTSR] = Calc_Cn_Ct_W_AoA_UpwindCARDAA(obj,V)
localTSR = obj.windTurbine.blade.localRadius*obj.rotationalSpeed./V;
ExpressionForUse = sqrt(((bsxfun(@minus,localTSR,sin(obj.azimuthalThitaUpwind.rad)')).^2)+bsxfun(@times,cos(obj.windTurbine.blade.delta).^2,(cos(obj.azimuthalThitaUpwind.rad).^2)'));
localRelativeVelocity = bsxfun(@times,V,ExpressionForUse);%V*ExpressionForUse';
localReynoldNumber =bsxfun(@times,(obj.windTurbine.blade.BladeReynoldsNumber.*obj.windTurbine.blade.ni./localTSR),ExpressionForUse);
AngleOfAttack = asin((bsxfun(@times,cos(obj.windTurbine.blade.delta),cos(obj.azimuthalThitaUpwind.rad)'))./ExpressionForUse);
[Cl,Cd] = obj.windTurbine.blade.airfoil.getClCd_rad(localReynoldNumber,AngleOfAttack,obj.Stall,localRelativeVelocity,obj.timestepPerThitaNode,obj.ThitaNodePerSide,obj.rotationalSpeed,obj.speedOfSound,obj.windTurbine.blade.thickness,obj.windTurbine.blade.chord,obj.azimuthalThitaUpwind.rad);
[Cn,Ct] = obj.CnCtCalc(Cl,Cd,AngleOfAttack);


