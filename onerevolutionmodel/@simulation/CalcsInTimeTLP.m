function obj = CalcsInTimeTLP(obj)
h=waitbar(0,'Loading simulation of Offshore wind turbine motion');
q_output = ode4(@obj.OdeFunTLP,obj.time,obj.InitialConditions');
obj.Surge = q_output(:,1);
obj.Sway  = q_output(:,2);
obj = CalcSpectrumOfMotionTLP(obj,q_output);
close(h)
