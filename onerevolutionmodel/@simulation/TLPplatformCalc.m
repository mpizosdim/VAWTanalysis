function obj=TLPplatformCalc(obj)
qInitial=[0 0];
[t,y] = ode45(@OdeFun,tspan,qInitial,[],obj);
