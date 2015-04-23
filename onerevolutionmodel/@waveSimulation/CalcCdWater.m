function [Cd] = CalcCdWater(obj,ReynoldsNumber)
Cd = interp1(obj.ReynoldsNumberData,obj.CdData,ReynoldsNumber);
if isempty(Cd)==1
   warning('Cd is assumed 1.Reynolds numbers seems to be out of range of data');
   Cd = 1;
end