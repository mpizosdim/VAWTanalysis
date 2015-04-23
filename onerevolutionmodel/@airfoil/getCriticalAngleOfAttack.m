function CriticalAngleOfAttack = getCriticalAngleOfAttack(obj,Reynolds)
[Cl,~] = getClCd_deg(obj,Reynolds,obj.angleOfAttackCl.deg);
numberOfSamplesOfAoA = length(obj.angleOfAttackCl.deg);
numberExaminedAoA = floor(numberOfSamplesOfAoA/2);
Clexamined = Cl((numberExaminedAoA+1):end);
AoAexamined = obj.angleOfAttackCl.deg((numberExaminedAoA+1):end);
SlopeClandAngleOfAttack = diff(Clexamined)./diff(AoAexamined);
% flag = abs((SlopeClandAngleOfAttack - SlopeClandAngleOfAttack(1))/SlopeClandAngleOfAttack(1)) > 1.8/(2*pi);
flag2 = SlopeClandAngleOfAttack < -0.08; %CHECK THIS OUT! IMPORTANT% maybe i=1 for the critical from the plot seems the angle before is the correct one for this.
CriticalAngleOfAttack.deg = min(AoAexamined(flag2));%not sure if its correct.
CriticalAngleOfAttack.rad = deg2rad(CriticalAngleOfAttack.deg );
if isempty(CriticalAngleOfAttack.deg)
    flag2 = SlopeClandAngleOfAttack < -0.07; %CHECK THIS OUT! IMPORTANT% maybe i=1 for the critical from the plot seems the angle before is the correct one for this.
    CriticalAngleOfAttack.deg = min(AoAexamined(flag2));%not sure if its correct.
    CriticalAngleOfAttack.rad = deg2rad(CriticalAngleOfAttack.deg );
    warning('Lower slope value was used to find the critical angle of attack equal with 0.07')
    if isempty(CriticalAngleOfAttack.deg)
        flag2 = SlopeClandAngleOfAttack < -0.06; %CHECK THIS OUT! IMPORTANT% maybe i=1 for the critical from the plot seems the angle before is the correct one for this.
        CriticalAngleOfAttack.deg = min(AoAexamined(flag2));%not sure if its correct.
        CriticalAngleOfAttack.rad = deg2rad(CriticalAngleOfAttack.deg );
        warning('Lower slope value was used to find the critical angle of attack equal with 0.06')
        if isempty(CriticalAngleOfAttack.deg)
            flag2 = SlopeClandAngleOfAttack < -0.05; %CHECK THIS OUT! IMPORTANT% maybe i=1 for the critical from the plot seems the angle before is the correct one for this.
            CriticalAngleOfAttack.deg = min(AoAexamined(flag2));%not sure if its correct.
            CriticalAngleOfAttack.rad = deg2rad(CriticalAngleOfAttack.deg );
            warning('Lower slope value was used to find the critical angle of attack equal with 0.05')
            
        end
        
    end
end