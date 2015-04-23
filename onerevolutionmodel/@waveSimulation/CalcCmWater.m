function [Cm] = CalcCmWater(obj,ReynoldsNumber)
Cm = interp1(obj.ReynoldsNumberData,obj.CmData,ReynoldsNumber);
if isempty(Cm)==1
   warning('Cm is assumed 1.Reynolds numbers seems to be out of range of data');
   Cm = 1;
end