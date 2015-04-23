function [CriticalAngleOfAttack,ReynoldsCritical] = importCriticalAngleOfAttack(obj,name)
if strcmp(name,'NACA 0012')
    Data = xlsread('Naca0012CriticalAngleOfAttackDeg.xlsx');
elseif strcmp(name,'NACA 0015')
    Data = xlsread('Naca0015CriticalAngleOfAttackDeg.xlsx');
elseif strcmp(name,'NACA 0018')
    Data = xlsread('Naca0018CriticalAngleOfAttackDeg.xlsx');
else
    error('Wrong Input for NACA')
end






%Data = xlsread('Naca0015CriticalAngleOfAttackDeg.xlsx');

ReynoldsCritical = Data(:,1)*10^6;
CriticalAngleOfAttack = Data(:,2);