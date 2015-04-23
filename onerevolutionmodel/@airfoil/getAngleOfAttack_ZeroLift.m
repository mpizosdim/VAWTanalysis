function angleOfAttack_ZeroLift = getAngleOfAttack_ZeroLift(obj,Reynolds)
AngleOfAttackBelow90deg = obj.angleOfAttackCl.deg(abs(obj.angleOfAttackCl.deg) < 90 );
[Cl,~] = getClCd_deg(obj,Reynolds,AngleOfAttackBelow90deg);
angleOfAttack_ZeroLift.deg =  AngleOfAttackBelow90deg(abs(Cl) == min(abs(Cl)));
angleOfAttack_ZeroLift.rad = deg2rad(angleOfAttack_ZeroLift.deg);