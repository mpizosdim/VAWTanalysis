function dqdt = OdeFunBUOY(obj,t,q)
indexT5=round(t/obj.timestepPerThitaNode)+1;
if obj.UseWind == 1
    [FwindX,FwindY,TwindX,TwindY] = CalcWindForces4DOF(obj,t,q);
else
    FwindX = 0;
    FwindY = 0;
    TwindX = 0 ;
    TwindY = 0;
end
if obj.UseWave == 1
    [FhydroX,FhydroY,ThydroX,ThydroY] = CalcHydroForces4DOF(obj,t,q);
else
    FhydroX= 0;
    FhydroY = 0;
    ThydroX = 0;
    ThydroY = 0;
end
obj.FwindX(indexT5) = FwindX;
obj.FwindY(indexT5) = FwindY;
obj.FhydroX(indexT5) = FhydroX;
obj.FhydroY(indexT5) = FhydroY;
obj.TwindX(indexT5) = TwindX;
obj.TwindY(indexT5) = TwindY;
obj.ThydroX(indexT5) = ThydroX;
obj.ThydroY(indexT5) = ThydroY;
obj.ForcesXtotal(indexT5) = FwindX+FhydroX;
obj.ForcesYtotal(indexT5) =FwindY+FhydroY ;
obj.MomentXtotal(indexT5) = TwindX+ThydroX;
obj.MomentYtotal(indexT5) = TwindY+ThydroY;
waitbar(indexT5/length(obj.time));
dqdt_temp = (obj.MassMatrix+obj.AddedMassMatrix)\([FwindX;TwindX;FwindY;TwindY]+[FhydroX;ThydroX;FhydroY;ThydroY]-obj.Cmatrix*[q(1);q(2);q(3);q(4)]);
dqdt(1,1) = q(5);
dqdt(2,1) = q(6);
dqdt(3,1) = q(7);
dqdt(4,1) = q(8);
dqdt(5,1) = dqdt_temp(1);
dqdt(6,1) = dqdt_temp(2);
dqdt(7,1) = dqdt_temp(3);
dqdt(8,1) = dqdt_temp(4);