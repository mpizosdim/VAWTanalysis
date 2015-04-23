function [Cl,AoA_Cl,Reynolds_Cl] = importCldata(name)
if strcmp(name,'NACA 0012')
    Data = xlsread('Naca0012Cl.xlsx');
elseif strcmp(name,'NACA 0015')
    Data = xlsread('Naca0015Cl.xlsx');
elseif strcmp(name,'NACA 0018')
    Data = xlsread('Naca0018Cl.xlsx');
else
    error('Wrong Input for NACA')
end
AoA_Cl = Data(2:end,1);
Reynolds_Cl = Data(1,2:end)*10^6;
Cl = Data(2:end,2:end);
AoA_Cl.deg=[-AoA_Cl(end:-1:2);AoA_Cl];
AoA_Cl.rad = deg2rad(AoA_Cl.deg);
Cl=[-flipud(Cl);Cl];
Cl(end/2,:)=[];
