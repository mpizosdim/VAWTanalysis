function [Cn,Ct,localRelativeVelocity,AngleOfAttack,localReynoldNumber,Cl,Cd,localTSR] = Calc_Cn_Ct_W_AoA_Upwind(obj,V)
localTSR = bsxfun(@rdivide,obj.windTurbine.blade.localRadius'*obj.rotationalSpeed,V);
ExpressionForUse = (bsxfun(@minus,localTSR,sin(obj.azimuthalThitaUpwind.rad))).^2;
ExpressionForUse2 = bsxfun(@times,(cos(obj.azimuthalThitaUpwind.rad)).^2,(cos(obj.windTurbine.blade.delta')).^2);
ExpressionForUse3 = bsxfun(@times,(cos(obj.azimuthalThitaUpwind.rad)),(cos(obj.windTurbine.blade.delta')));
ExpressionForUse4 = ExpressionForUse3./(sqrt(ExpressionForUse+ExpressionForUse2));
localRelativeVelocity = V.*sqrt(ExpressionForUse+ExpressionForUse2);
localReynoldNumber = bsxfun(@rdivide,(obj.windTurbine.blade.BladeReynoldsNumber*obj.windTurbine.blade.ni'),localTSR).*sqrt(ExpressionForUse+ExpressionForUse2);
AngleOfAttack = asin(ExpressionForUse4);
[Cl,Cd] = obj.windTurbine.blade.airfoil.getClCd_rad(localReynoldNumber',AngleOfAttack',obj.Stall,localRelativeVelocity',obj.timestepPerThitaNode,obj.ThitaNodePerSide,obj.rotationalSpeed,obj.speedOfSound,obj.windTurbine.blade.thickness,obj.windTurbine.blade.chord,obj.azimuthalThitaUpwind.rad);
[Cn,Ct] = obj.CnCtCalc(Cl,Cd,AngleOfAttack');

