function dqdt = OdeFunTLP(obj,t,q)
indexT5=round(t/obj.timestepPerThitaNode)+1;
if obj.UseWind == 1
    [FwindX,FwindY] = CalcWindForces(obj,t,q);
else
    FwindX = 0;
    FwindY = 0;
end
if obj.UseWave == 1
    [FhydroX,FhydroY] = CalcHydroForces(obj,t,q);
else
    FhydroX = 0;
    FhydroY = 0;
end
waitbar(indexT5/length(obj.time));
obj.FwindX(indexT5) = FwindX;
obj.FwindY(indexT5) = FwindY;
obj.FhydroX(indexT5) = FhydroX;
obj.FhydroY(indexT5) = FhydroY;
obj.ForcesXtotal(indexT5) = FwindX+FhydroX;
obj.ForcesYtotal(indexT5) =FwindY+FhydroY ;
dqdt_temp = (obj.MassMatrix+obj.AddedMassMatrix)\([FwindX;FwindY]+[FhydroX;FhydroY]-obj.Cmatrix*[q(1);q(2)]);
dqdt(1,1) = q(3);
dqdt(2,1) = q(4);
dqdt(3,1) = dqdt_temp(1);
dqdt(4,1) = dqdt_temp(2);