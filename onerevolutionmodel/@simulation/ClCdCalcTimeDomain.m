function [Cl,Cd] = ClCdCalcTimeDomain(obj,Reynolds,AngleOfAttack,PreviousAngleOfAttack,RelativeVecity,thita)
switch obj.StallInTime{1}
    case 'Dynamic Gormonts'
        SignAoA = sign(AngleOfAttack);
        [Cl,Cd] = DynamicStallG_InTime(obj,Reynolds,AngleOfAttack,PreviousAngleOfAttack,RelativeVecity);
        Cl = SignAoA.*Cl;
    case 'Dynamic Berg'
        SignAoA = sign(AngleOfAttack);
        [Cl,Cd] = DynamicStallB_InTime(obj,Reynolds,AngleOfAttack,PreviousAngleOfAttack,RelativeVecity);
        Cl = SignAoA.*Cl;
    case 'Dynamic Strickland'
        SignAoA = sign(AngleOfAttack);
        [Cl,Cd] = DynamicStallS_InTime(obj,Reynolds,AngleOfAttack,PreviousAngleOfAttack,RelativeVecity);
        Cl = SignAoA.*Cl;
    case 'Static'
        [Cl] = obj.windTurbine.blade.airfoil.getCl_rad(Reynolds,AngleOfAttack);
        [Cd] = obj.windTurbine.blade.airfoil.getCd_rad(Reynolds,AngleOfAttack);
    otherwise
        error('Stall method is not choosed by the user,or not correct model name.')
end
if length(obj.StallInTime)~=1
    if strcmp(obj.StallInTime{2},'Paraschivoiu Adaption')
        [Cl2] = obj.windTurbine.blade.airfoil.getCl_rad(Reynolds,AngleOfAttack);
        [Cd2] = obj.windTurbine.blade.airfoil.getCd_rad(Reynolds,AngleOfAttack);
        fd = (thita>=(deg2rad(20))) & (thita <deg2rad(135));
        fn = ~fd;
        Cl = Cl2.*fn + Cl.*fd';
        Cd = Cd2.*fn + Cd.*fd';
        
    end
end