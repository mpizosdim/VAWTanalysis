function [CLmod,CDmod] = DynamicStallB(obj,localReynoldNumber,AngleOfAttack,alphaRate,localRelativeVelocity,ThitaNodePerSide,rotationalSpeed,SpeedOfSound,thickness,chord)

[CLdyn,CDdyn] = DynamicStallG(obj,localReynoldNumber,AngleOfAttack,alphaRate,localRelativeVelocity,ThitaNodePerSide,rotationalSpeed,SpeedOfSound,thickness,chord);

Cls = obj.getCl_rad(localReynoldNumber,AngleOfAttack);
Cds = obj.getCd_rad(localReynoldNumber,AngleOfAttack);
Am = 6;

CriticalAngleOfAttack = obj.getCriticalAngleOfAttackVer2(localReynoldNumber);
CriticalAngleOfAttack = rad2deg(CriticalAngleOfAttack);
CLmod = Cls + ((Am * CriticalAngleOfAttack - AngleOfAttack) / (Am * CriticalAngleOfAttack - CriticalAngleOfAttack) .* (CLdyn - Cls)) .* (AngleOfAttack <= Am * CriticalAngleOfAttack);
CDmod = Cds + ((Am * CriticalAngleOfAttack - AngleOfAttack) / (Am * CriticalAngleOfAttack - CriticalAngleOfAttack) .* (CDdyn - Cds)) .* (AngleOfAttack <= Am * CriticalAngleOfAttack);

