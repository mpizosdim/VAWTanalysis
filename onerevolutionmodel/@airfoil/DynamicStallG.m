function [CLdyn,CDdyn] = DynamicStallG(obj,localReynoldNumber,AngleOfAttack,alphaRate,localRelativeVelocity,ThitaNodePerSide,rotationalSpeed,SpeedOfSound,thickness,chord)
%-----------------------------------------------------------------------
%these calculations should be checked again.Try with and without these
%values
taf = 0.75e-2/ThitaNodePerSide*rotationalSpeed;
SaR = sign(alphaRate);
aR_taf_sup_lim = 500;
aR_taf=alphaRate/taf.*(alphaRate/taf<aR_taf_sup_lim & alphaRate/taf>-aR_taf_sup_lim) + aR_taf_sup_lim.*(alphaRate/taf>=aR_taf_sup_lim) - aR_taf_sup_lim.*(alphaRate/taf<=-aR_taf_sup_lim);
SaRs = (1-exp(-aR_taf)).*(SaR>=0)+(-1+exp(aR_taf)).*(SaR<0);
M = localRelativeVelocity./SpeedOfSound;
%-----------------------------------------------------------------------

M1L = 0.4 + 5*(0.06 - thickness/chord);%check, table6.2
M2L = 0.9 + 2.5*(0.06 - thickness/chord);%check, table6.2
gammaMaxL = 1.4 + 6*(0.06 - thickness/chord);%check, table6.2
M1D = 0.2;%check, table6.2
M2D = 0.7 + 2.5*(0.06 - thickness/chord);%check, table6.2
gammaMaxD = 1 + 2.5*(0.06 - thickness/chord);%check, table6.2

phi2L = gammaMaxL .* max (0, min (1, (M - M2L) / (M1L - M2L)));% check, eq 6.119 gamma2
phi1L = phi2L/2;% check, eq 6.119 gamma1
phi2D = gammaMaxD .* max (0, min (1, (M - M2D) / (M1D - M2D))); % check, eq 6.119 gamma2
phi1D = 0; % check, eq 6.119 gamma1

S = sqrt(abs(chord*alphaRate./(2*localRelativeVelocity)));% check,eq 6.118

Sc = 0.06 +1.5*(0.06 - thickness/chord); % check,CHECK AGAINeq 6.118(in the book is 0.06,here is 0.0006)

AalphaL = (phi1L .* S).*(S <= Sc) + (phi1L.*Sc + phi2L.*(S - Sc)).*(S > Sc); %check,eq 6.117
AalphaD = (phi1D .* S).*(S <= Sc) + (phi1D.*Sc + phi2D.*(S - Sc)).*(S > Sc); %check,eq 6.117

%             K1 = (alphaRate >= 0) - 0.5.*(alphaRate < 0);
K1 = (SaRs+1)*1.5/2-0.5;% check,eq 6.116
alphaRefL = AngleOfAttack - K1 .* AalphaL;%check,eq 6.115
alphaRefD = AngleOfAttack - K1 .* AalphaD;%check,eq 6.115
alphaZeroLift = getAngleOfAttack_ZeroLift(obj,localReynoldNumber);% i think i should make it more simple.Usual zero lift is at 0 degrees.
alphaZeroLift = alphaZeroLift.rad;
CriticalAngleOfAttack = obj.getCriticalAngleOfAttackVer2(localReynoldNumber);
CriticalAngleOfAttack = deg2rad(CriticalAngleOfAttack);
Cl_alphaRefL =obj.getCl_rad(localReynoldNumber,alphaRefL);
Cl_alphaZeroLift = obj.getCl_rad(localReynoldNumber,alphaZeroLift);
Cl_CriticalAngleOfAttack = obj.getCl_rad(localReynoldNumber,CriticalAngleOfAttack);
m = min((Cl_alphaRefL - Cl_alphaZeroLift) ./ (alphaRefL - alphaZeroLift) , (Cl_CriticalAngleOfAttack - Cl_alphaZeroLift) ./ (CriticalAngleOfAttack - alphaZeroLift));%check,eq 6.121
CLdyn = obj.getCl_rad(localReynoldNumber,alphaZeroLift) + m.* (AngleOfAttack - alphaZeroLift);%check,eq 6.120
CDdyn = obj.getCd_rad(localReynoldNumber,alphaRefD);%check,eq 6.120
