function [BladeReynoldsNumber] = BladeReynoldsNumberCalc(obj,rotationalSpeed)
kinematicViscosity = 1.511e-5;% check this out:what value should i put!!!!
BladeReynoldsNumber = (obj.R*rotationalSpeed*obj.chord)/kinematicViscosity;