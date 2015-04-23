function [ReynoldsNumber] =  CalcReynoldsNumberWater(obj,Velocity,kinematicViscosity,Radius)
ReynoldsNumber = Velocity.*2*(Radius)/kinematicViscosity;%CHECK VER2 

