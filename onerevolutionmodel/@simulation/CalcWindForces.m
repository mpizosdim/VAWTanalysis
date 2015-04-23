function [FwindX,FwindY] = CalcWindForces(obj,t,q)
FwindX = 0;
FwindY = 0;
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
[~,indexOfTable] = min(abs(obj.Data.VelocityRange-(Velocity(round(obj.NumberOfNodes/2))-q(3))));
ReynoldsTable = reshape(obj.Data.localReynoldNumberTotal(indexOfTable,:,:),obj.NumberOfNodes,obj.ThitaNodeTotal);
InterferenceFactorTable = reshape(obj.Data.InterferenceFactorTotaltrial(indexOfTable,:,:),obj.NumberOfNodes,obj.ThitaNodeTotal);
VtotalTable = reshape(obj.Data.VTotal(indexOfTable,:,:),obj.NumberOfNodes,obj.ThitaNodeTotal);
for BladeN =1:obj.windTurbine.NumOfBlades
    Index3 = mod(Index2,obj.ThitaNodeTotal);
    if Index3 == 0
        Index3 = 72;
    end
    V = VtotalTable(:,Index3);
    InterferenceFactor = InterferenceFactorTable(:,Index3);
    thita = obj.azimuthalThitaTotal.rad(Index3);
    Reynolds = ReynoldsTable(:,Index3);
    RelativeVelocity = sqrt(((((Velocity-q(3)).*InterferenceFactor)*sin(thita)+((windFluctuationY-q(4)).*InterferenceFactor)*cos(thita)-obj.rotationalSpeed.*obj.windTurbine.blade.localRadius').^2)+((((windFluctuationY-q(4)).*InterferenceFactor)*sin(thita)-((Velocity-q(3)).*InterferenceFactor)*cos(thita)).^2).*cos(obj.windTurbine.blade.delta').^2);
    obj.AngleOfAttack_InTime(indexT,BladeN,:) = asin(((((windFluctuationY-q(4)).*InterferenceFactor)*sin(thita)-((Velocity-q(3)).*InterferenceFactor)*cos(thita)).*cos(obj.windTurbine.blade.delta')./RelativeVelocity));
    if indexT ~=1
        PreviousAngleOfAttack = obj.AngleOfAttack_InTime(indexT-1,BladeN,:);
    else
        PreviousAngleOfAttack = obj.AngleOfAttack_InTime(indexT,BladeN,:);
    end
    ReconstractedAngleOfAttack = reshape(obj.AngleOfAttack_InTime(indexT,BladeN,:),size(obj.AngleOfAttack_InTime(indexT,BladeN,:),3),1);
    ReconstractedPreviousAngleOfAttack = reshape(PreviousAngleOfAttack ,size(PreviousAngleOfAttack,3),1);
    [Cl,Cd] = obj.ClCdCalcTimeDomain(Reynolds,ReconstractedAngleOfAttack,ReconstractedPreviousAngleOfAttack,RelativeVelocity,thita);
    [Cn,Ct] = obj.CnCtCalc(Cl,Cd,ReconstractedAngleOfAttack);
    [Fx,Fy] = calcFxFyInTime(obj,Cn,Ct,thita,RelativeVelocity);
    FxBlade= sum(Fx);
    FyBlade = sum(Fy);
    if BladeN==1
        obj.FxforOneBlade(indexT) =  FxBlade;
        obj.FyforOneBlade(indexT) =  FyBlade;
    end
    FwindX = FxBlade + FwindX;
    FwindY = FyBlade + FwindY;
    Index2 = Index2+obj.ThitaNodeTotal/obj.windTurbine.NumOfBlades;
end