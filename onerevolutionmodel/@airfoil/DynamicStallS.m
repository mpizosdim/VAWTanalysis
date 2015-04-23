function [CLdyn,CDdyn] = DynamicStallS(obj,localReynoldNumber,AngleOfAttack,alphaRate,localRelativeVelocity,ThitaNodePerSide,rotationalSpeed,SpeedOfSound,thickness,chord)
%-----------------------------------------------------------------------
%these calculations should be checked again.Try with and without these
%values
taf = 0.75e-2/ThitaNodePerSide*rotationalSpeed;
SaR = sign(alphaRate);
aR_taf_sup_lim = 500;
aR_taf=alphaRate/taf.*(alphaRate/taf<aR_taf_sup_lim & alphaRate/taf>-aR_taf_sup_lim) + aR_taf_sup_lim.*(alphaRate/taf>=aR_taf_sup_lim) - aR_taf_sup_lim.*(alphaRate/taf<=-aR_taf_sup_lim);
SaRs = (1-exp(-aR_taf)).*(SaR>=0)+(-1+exp(aR_taf)).*(SaR<0);
%-----------------------------------------------------------------------
K1 = 0.75+0.25*SaRs;
phiLift = 1.4 -6*(0.06 - thickness/chord);
phiDrag = 1 -2.5*(0.06 - thickness / chord);
alphaRefL = AngleOfAttack - phiLift * K1 .* sqrt(abs(chord*alphaRate./(2*localRelativeVelocity))).*SaRs;
alphaRefD = AngleOfAttack - phiDrag * K1 .* sqrt(abs(chord*alphaRate./(2*localRelativeVelocity))).*SaRs;
alphaZeroLift = getAngleOfAttack_ZeroLift(obj,localReynoldNumber);
alphaZeroLift = alphaZeroLift.rad;

CLs= (AngleOfAttack ./ (alphaRefL - alphaZeroLift)) .* obj.getCl_rad(localReynoldNumber,alphaRefL);
CDs = obj.getCd_rad(localReynoldNumber,alphaRefD);

CLn = obj.getCl_rad(localReynoldNumber,alphaRefL);
CDn =obj.getCd_rad(localReynoldNumber,alphaRefD);

Aad=2;
Aa=Aad*pi/180;

CriticalAngleOfAttack = obj.getCriticalAngleOfAttackVer2(localReynoldNumber);
CriticalAngleOfAttack = rad2deg(CriticalAngleOfAttack);

fn = (AngleOfAttack<(CriticalAngleOfAttack-Aa/2)) + (((-2*(AngleOfAttack-(CriticalAngleOfAttack-Aa/2)).^2/(Aa)^2+1) .* (AngleOfAttack<=CriticalAngleOfAttack)) + ((2*(AngleOfAttack-(CriticalAngleOfAttack+Aa/2)).^2/(Aa)^2) .* (AngleOfAttack>CriticalAngleOfAttack)) ) .* (abs(AngleOfAttack-CriticalAngleOfAttack)<(Aa/2));
fs = (AngleOfAttack>(CriticalAngleOfAttack+Aa/2)) + (((2*(AngleOfAttack-(CriticalAngleOfAttack-Aa/2)).^2/(Aa)^2) .* (AngleOfAttack<=CriticalAngleOfAttack)) + ((-2*(AngleOfAttack-(CriticalAngleOfAttack+Aa/2)).^2/(Aa)^2+1) .* (AngleOfAttack>CriticalAngleOfAttack)) ) .* (abs(AngleOfAttack-CriticalAngleOfAttack)<(Aa/2));

CLdyn = CLn .* fn + CLs .* fs;
CDdyn = CDn .* fn + CDs .* fs;

%-----------------------------------------------------------------------

