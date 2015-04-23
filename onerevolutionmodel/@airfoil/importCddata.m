function [Cd,AoA_Cd,Reynolds_Cd]  = importCddata(name)
if strcmp(name,'NACA 0012')
    Data = xlsread('Naca0012Cd.xlsx');
elseif strcmp(name,'NACA 0015')
    Data = xlsread('Naca0015Cd.xlsx');
elseif strcmp(name,'NACA 0018')
    Data = xlsread('Naca0018Cd.xlsx');
else
    error('Wrong Input for NACA')
end
AoA_Cd = Data(2:end,1);
AoA_Cd.deg=[-AoA_Cd(end:-1:2);AoA_Cd];
AoA_Cd.rad = deg2rad(AoA_Cd.deg);
Reynolds_Cd = Data(1,2:end)*10^6;
Cd = Data(2:end,2:end);
Cd=[flipud(Cd);Cd];
Cd(end/2,:)=[];