function [Cd,Cm,ReynoldsNumber]=importCdCmWater()
Data = xlsread('CdCmWater.xlsx');
ReynoldsNumber = Data(2:end,1)*10^4;
Cd = Data(2:end,2);
Cm = Data(2:end,3);