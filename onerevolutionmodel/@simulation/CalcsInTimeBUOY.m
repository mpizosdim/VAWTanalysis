function obj = CalcsInTimeBUOY(obj)
h=waitbar(0,'Loading simulation of Offshore wind turbine motion');
q_output = ode4(@obj.OdeFunBUOY,obj.time,obj.InitialConditions');
obj.Surge = q_output(:,1);
obj.Pitch = q_output(:,2);
obj.Sway  = q_output(:,3);
obj.Roll = q_output(:,4);
obj = CalcSpectrumOfMotionBUOY(obj,q_output);
close(h)

