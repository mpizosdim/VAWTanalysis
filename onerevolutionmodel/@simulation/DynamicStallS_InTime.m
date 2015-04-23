function [Cl,Cd] = DynamicStallS_InTime(obj,Reynolds,AngleOfAttack,PreviousAngleOfAttack,RelativeVecity)
SignAoA = sign(AngleOfAttack);
AngleOfAttack =abs(AngleOfAttack);
PreviousAngleOfAttack = abs(PreviousAngleOfAttack);
RateOfchange = (AngleOfAttack - PreviousAngleOfAttack)/obj.timestepPerThitaNode;
K1 = 0.75+0.25.*SignAoA;
alphaRefL = AngleOfAttack - obj.windTurbine.blade.GammaLiftStric * K1 .* sqrt(abs(obj.windTurbine.blade.chord*RateOfchange ./(2*RelativeVecity))).*SignAoA;
alphaRefD = AngleOfAttack - obj.windTurbine.blade.GammaDragStric * K1 .* sqrt(abs(obj.windTurbine.blade.chord*RateOfchange ./(2*RelativeVecity))).*SignAoA;
alphaZeroLift = getAngleOfAttack_ZeroLift(obj,localReynoldNumber);
alphaZeroLift = alphaZeroLift.rad;
for ii = 1:length(Reynolds)
    alphaZeroLiftTemp = obj.windTurbine.blade.airfoil.getAngleOfAttack_ZeroLift(Reynolds(ii));% i think i should make it more simple.Usual zero lift is at 0 degrees.
    alphaZeroLift(ii) = alphaZeroLiftTemp.rad;
end
CLs= (AngleOfAttack ./ (alphaRefL - alphaZeroLift)) .* obj.windTurbine.blade.airfoil.getCl_rad(Reynolds,alphaRefL);
CDs = obj.windTurbine.blade.airfoil.getCl_rad(Reynolds,alphaRefD);
CLn = obj.windTurbine.blade.airfoil.getCl_rad(Reynolds,alphaRefL);
CDn =obj.windTurbine.blade.airfoil.getCl_rad(Reynolds,alphaRefD);
Aad=2;
Aa=Aad*pi/180;
CriticalAngleOfAttack = rad2deg(14);
fn = (AngleOfAttack<(CriticalAngleOfAttack-Aa/2)) + (((-2*(AngleOfAttack-(CriticalAngleOfAttack-Aa/2)).^2/(Aa)^2+1) .* (AngleOfAttack<=CriticalAngleOfAttack)) + ((2*(AngleOfAttack-(CriticalAngleOfAttack+Aa/2)).^2/(Aa)^2) .* (AngleOfAttack>CriticalAngleOfAttack)) ) .* (abs(AngleOfAttack-CriticalAngleOfAttack)<(Aa/2));
fs = (AngleOfAttack>(CriticalAngleOfAttack+Aa/2)) + (((2*(AngleOfAttack-(CriticalAngleOfAttack-Aa/2)).^2/(Aa)^2) .* (AngleOfAttack<=CriticalAngleOfAttack)) + ((-2*(AngleOfAttack-(CriticalAngleOfAttack+Aa/2)).^2/(Aa)^2+1) .* (AngleOfAttack>CriticalAngleOfAttack)) ) .* (abs(AngleOfAttack-CriticalAngleOfAttack)<(Aa/2));
CLdyn = CLn .* fn + CLs .* fs;
CDdyn = CDn .* fn + CDs .* fs;
Cl = CLdyn;
Cd = CDdyn;