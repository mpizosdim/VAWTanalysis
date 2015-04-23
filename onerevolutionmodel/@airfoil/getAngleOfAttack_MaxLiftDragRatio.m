function angleOfAttackOptim = getAngleOfAttack_MaxLiftDragRatio(obj,Reynolds)
positiveAngleOfAttack = obj.angleOfAttackCl.deg(obj.angleOfAttackCl.deg > 0 );
[Cl,Cd] = getClCd_deg(obj,Reynolds,positiveAngleOfAttack);
E=Cl./Cd;
angleOfAttackOptim.deg =  positiveAngleOfAttack(E == max(E));
angleOfAttackOptim.rad = deg2rad(angleOfAttackOptim.deg);