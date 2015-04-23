function [Cl,Cd] = DynamicStallG_InTime(obj,Reynolds,AngleOfAttack,PreviousAngleOfAttack,RelativeVecity)
AngleOfAttack =abs(AngleOfAttack);
PreviousAngleOfAttack = abs(PreviousAngleOfAttack);
RateOfchange = (AngleOfAttack - PreviousAngleOfAttack)/obj.timestepPerThitaNode;
M = RelativeVecity./obj.speedOfSound ;
Gamma2Lift = obj.windTurbine.blade.GammaMaxLift.* max (0, min (1, (M - obj.windTurbine.blade.M2Lift) / (obj.windTurbine.blade.M1Lift - obj.windTurbine.blade.M2Lift)));
Gamma1Lift = Gamma2Lift/2;
Gamma2Drag = obj.windTurbine.blade.GammaMaxDrag.* max (0, min (1, (M - obj.windTurbine.blade.M2Drag) / (obj.windTurbine.blade.M1Drag - obj.windTurbine.blade.M2Drag)));
Gamma1Drag = 0;
S = sqrt(abs(obj.windTurbine.blade.chord*RateOfchange./(2*RelativeVecity)));
DeltaAlphaL = (Gamma1Lift.* S).*(S <= obj.windTurbine.blade.Sc) + (Gamma1Lift.*obj.windTurbine.blade.Sc + Gamma2Lift.*(S - obj.windTurbine.blade.Sc)).*(S > obj.windTurbine.blade.Sc); %check,eq 6.117
DeltaAlphaD = (Gamma1Drag.* S).*(S <= obj.windTurbine.blade.Sc) + (Gamma1Drag.*obj.windTurbine.blade.Sc + Gamma2Drag.*(S - obj.windTurbine.blade.Sc)).*(S > obj.windTurbine.blade.Sc);
K1 = 1*(RateOfchange>=0)+(-0.5)*(RateOfchange<0);
alphaRefL = AngleOfAttack - K1 .* DeltaAlphaL;
alphaRefD = AngleOfAttack - K1 .* DeltaAlphaD;
for ii = 1:length(Reynolds)
    alphaZeroLiftTemp = obj.windTurbine.blade.airfoil.getAngleOfAttack_ZeroLift(Reynolds(ii));
    alphaZeroLift(ii) = alphaZeroLiftTemp.rad;
    CriticalAngleOfAttackTemp = obj.windTurbine.blade.airfoil.getCriticalAngleOfAttackVer2(Reynolds(ii));
    CriticalAngleOfAttack(ii) = deg2rad(CriticalAngleOfAttackTemp);
    Cl_alphaRefL(ii) =obj.windTurbine.blade.airfoil.getCl_rad(Reynolds(ii),alphaRefL(ii));
    Cl_alphaZeroLift(ii) = obj.windTurbine.blade.airfoil.getCl_rad(Reynolds(ii),alphaZeroLift(ii));
    Cl_CriticalAngleOfAttack(ii) = obj.windTurbine.blade.airfoil.getCl_rad(Reynolds(ii),CriticalAngleOfAttack(ii));
end
alphaZeroLift = alphaZeroLift';
CriticalAngleOfAttack = CriticalAngleOfAttack';
Cl_alphaRefL = Cl_alphaRefL';
Cl_alphaZeroLift = Cl_alphaZeroLift';
Cl_CriticalAngleOfAttack = Cl_CriticalAngleOfAttack';
m = min((Cl_alphaRefL - Cl_alphaZeroLift) ./ (alphaRefL - alphaZeroLift) , (Cl_CriticalAngleOfAttack - Cl_alphaZeroLift) ./ (CriticalAngleOfAttack - alphaZeroLift));%check,eq 6.121
CLdyn = obj.windTurbine.blade.airfoil.getCl_rad(Reynolds,alphaZeroLift) + m.* (AngleOfAttack - alphaZeroLift);
CDdyn = obj.windTurbine.blade.airfoil.getCd_rad(Reynolds,alphaRefD);
Cl = CLdyn;
Cd = CDdyn;