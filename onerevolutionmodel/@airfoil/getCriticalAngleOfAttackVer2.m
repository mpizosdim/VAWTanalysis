function CriticalAngleOfAttack = getCriticalAngleOfAttackVer2(obj,Reynolds)

CriticalAngleOfAttack = interp1(obj.ReynoldsCritical,obj.CriticalAngleOfAttack,Reynolds);
