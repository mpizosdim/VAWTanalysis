function [FwindX,FwindY,TwindX,TwindY] = CalcWindForces4DOF(obj,t,q)
FwindX = 0;
FwindY = 0;
TwindX = 0;
TwindY = 0;
indexT=round(t/obj.timestepPerThitaNode)+1;
if obj.UseConstantWind == 0
    windFluctuationX = obj.WindSimulation.fluctuationX(:,indexT);
    windFluctuationY = 0;
else
    windFluctuationX = 0;
    windFluctuationY = 0;
end
Index2 = indexT;
Velocity = (obj.WindSimulation.Vatmospheric'+windFluctuationX);
[~,indexOfTable] = min(abs(obj.Data.VelocityRange-(Velocity(round(obj.NumberOfNodes/2))-((q(5)+q(6)*obj.windTurbine.blade.PhysicalHeight(round(obj.NumberOfNodes/2))')))));
ReynoldsTable = reshape(obj.Data.localReynoldNumberTotal(indexOfTable,:,:),obj.NumberOfNodes,obj.ThitaNodeTotal);
InterferenceFactorTable = reshape(obj.Data.InterferenceFactorTotaltrial(indexOfTable,:,:),obj.NumberOfNodes,obj.ThitaNodeTotal);
VtotalTable = reshape(obj.Data.VTotal(indexOfTable,:,:),obj.NumberOfNodes,obj.ThitaNodeTotal);
for BladeN =1:obj.windTurbine.NumOfBlades
    Index3 = mod(Index2,obj.ThitaNodeTotal);
    if Index3 == 0
        Index3 = 72;
    end
    V = VtotalTable(:,Index3);
    thita =obj.azimuthalThitaTotal.rad(Index3);
    Reynolds =ReynoldsTable(:,Index3);
    InterferenceFactor = InterferenceFactorTable(:,Index3);
    RelativeVelocity = sqrt(((((Velocity-(q(5)+q(6)*obj.windTurbine.blade.PhysicalHeight')).*InterferenceFactor)*sin(thita)+((windFluctuationY-(q(7)+q(8)*obj.windTurbine.blade.PhysicalHeight')).*InterferenceFactor)*cos(thita)-obj.rotationalSpeed.*obj.windTurbine.blade.localRadius').^2)+((((windFluctuationY-(q(7)+q(8)*obj.windTurbine.blade.PhysicalHeight')).*InterferenceFactor)*sin(thita)-((Velocity-(q(5)+q(6)*obj.windTurbine.blade.PhysicalHeight')).*InterferenceFactor)*cos(thita)).^2).*cos(obj.windTurbine.blade.delta').^2);
    obj.RelativeVelocity(indexT,BladeN,:) = RelativeVelocity;
    obj.AngleOfAttack_InTime(indexT,BladeN,:) = asin(((((windFluctuationY-(q(7)+q(8)*obj.windTurbine.blade.PhysicalHeight')).*InterferenceFactor)*sin(thita)-((Velocity-(q(5)+q(6)*obj.windTurbine.blade.PhysicalHeight')).*InterferenceFactor)*cos(thita)).*cos(obj.windTurbine.blade.delta')./RelativeVelocity));
    if indexT ~=1
        PreviousAngleOfAttack = obj.AngleOfAttack_InTime(indexT-1,BladeN,:);
    else
        PreviousAngleOfAttack = obj.AngleOfAttack_InTime(indexT,BladeN,:);
    end
    ReconstractedAngleOfAttack = reshape(obj.AngleOfAttack_InTime(indexT,BladeN,:),size(obj.AngleOfAttack_InTime(indexT,BladeN,:),3),1);
    ReconstractedPreviousAngleOfAttack = reshape(PreviousAngleOfAttack ,size(PreviousAngleOfAttack,3),1);
    [Cl,Cd] = obj.ClCdCalcTimeDomain(Reynolds,ReconstractedAngleOfAttack,ReconstractedPreviousAngleOfAttack,RelativeVelocity,thita);
    [Cn,Ct] = obj.CnCtCalc(Cl,Cd,ReconstractedAngleOfAttack);
    obj.Cl(indexT,BladeN,:) = Cl;
    obj.Cd(indexT,BladeN,:) = Cd;
    [Fx,Fy] = calcFxFyInTime(obj,Cn,Ct,thita,RelativeVelocity);
    Tx = Fx.*obj.windTurbine.blade.PhysicalHeight'.*cos(obj.windTurbine.blade.delta')*cos(q(2));
    Ty = Fy.*obj.windTurbine.blade.PhysicalHeight'.*cos(obj.windTurbine.blade.delta')*cos(q(4));
    FxBlade= sum(Fx);
    FyBlade = sum(Fy);
    TxBlade= sum(Tx);
    TyBlade = sum(Ty);
    if BladeN==1
        obj.FxforOneBlade(indexT) =  FxBlade;
        obj.FyforOneBlade(indexT) =  FyBlade;
    end
    FwindX = FxBlade + FwindX;
    FwindY = FyBlade + FwindY;
    TwindX = TxBlade + TwindX;
    TwindY = TyBlade + TwindY;
    Index2 = Index2+obj.ThitaNodeTotal/obj.windTurbine.NumOfBlades;
end
if obj.GyroscopicEffect == 1
    TwindY = TwindY - obj.windTurbine.Izz*obj.rotationalSpeed*q(6);%q(8) fi, q(6) thita
    TwindX = TwindX + obj.windTurbine.Izz*obj.rotationalSpeed*q(8);
end