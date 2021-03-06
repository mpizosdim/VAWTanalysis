function NewInterferenceFactor = CalcDownwindFunctionCARDAA(obj,InterferenceFactor,node)
V = InterferenceFactor*obj.Vequlibrium(node);
localTSR = (obj.windTurbine.blade.localRadius(node)*obj.rotationalSpeed)/V;
ExpressionForUse = sqrt(((localTSR-sin(obj.azimuthalThitaDownwind.rad)).^2)+((cos(obj.azimuthalThitaDownwind.rad).^2).*(cos(obj.windTurbine.blade.delta(node)))^2));
localRelativeVelocity = V*ExpressionForUse;
localReynoldNumber = ((obj.windTurbine.blade.BladeReynoldsNumber*obj.windTurbine.blade.ni(node))/localTSR)*ExpressionForUse;
AngleOfAttack = asin((cos(obj.azimuthalThitaDownwind.rad).*cos(obj.windTurbine.blade.delta(node)))./ExpressionForUse);
[Cl,Cd] = obj.windTurbine.blade.airfoil.getClCd_rad(localReynoldNumber,AngleOfAttack,obj.Stall,localRelativeVelocity,obj.timestepPerThitaNode,obj.ThitaNodePerSide,obj.rotationalSpeed,obj.speedOfSound,obj.windTurbine.blade.thickness,obj.windTurbine.blade.chord,obj.azimuthalThitaDownwind.rad);
[Cn,Ct] = obj.CnCtCalc(Cl,Cd,AngleOfAttack);
ExpressionForUse2 = ((Cn.*(cos(obj.azimuthalThitaDownwind.rad)./abs(cos(obj.azimuthalThitaDownwind.rad))))-Ct.*(sin(obj.azimuthalThitaDownwind.rad)./(abs(cos(obj.azimuthalThitaDownwind.rad))*cos(obj.windTurbine.blade.delta(node))))).*((localRelativeVelocity/V).^2)*deg2rad(obj.dthita);
fDown = ((obj.windTurbine.NumOfBlades*obj.windTurbine.blade.chord)/(8*pi*obj.windTurbine.blade.R))*ExpressionForUse2;
fDown = trapz(fDown);
NewInterferenceFactor = (pi*obj.windTurbine.blade.ni(node))/(fDown+pi*obj.windTurbine.blade.ni(node));