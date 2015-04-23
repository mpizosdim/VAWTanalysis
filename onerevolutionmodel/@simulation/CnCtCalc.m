function [Cn,Ct] = CnCtCalc(obj,Cl,Cd,AngleOfAttack)
Cn = Cl.*cos(AngleOfAttack)+Cd.*sin(AngleOfAttack);
Ct = Cl.*sin(AngleOfAttack)-Cd.*cos(AngleOfAttack);