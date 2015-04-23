function [FwindX,FwindY] = CalcWindForces3(obj,t,q)
FwindX = 0;
FwindY = 0;
indexT=round(t/obj.timestepPerThitaNode)+1;
windFluctuationX = obj.WindSimulation.fluctuationX(:,indexT);
windFluctuationY = obj.WindSimulation.fluctuationY(:,indexT);
Index2 = indexT;
% [~,indexOfTable] = min(abs(obj.Data.VelocityRange-(obj.WindSimulation.TurbulenceVelocityX(round(obj.NumberOfNodes/2),indexT)-q(3))));
% Reynolds = reshape(obj.Data.localReynoldNumberTotal(indexOfTable,:,:),obj.NumberOfNodes,obj.ThitaNodeTotal);
% InterferenceFactor = reshape(obj.Data.InterferenceFactorTotaltrial(indexOfTable,:,:),obj.NumberOfNodes,obj.ThitaNodeTotal);
Velocity = obj.WindSimulation.TurbulenceVelocityX(:,Index2);
for BladeN =1:obj.windTurbine.NumOfBlades
    Index3 = mod(Index2,obj.ThitaNodeTotal);
    if Index3 == 0
        Index3 = 72;
    end
    V = obj.Vtotal(:,Index3);
    
    InterferenceFactor = obj.InterferenceFactorTotal(:,Index3);
    thita = obj.azimuthalThitaTotal.rad(Index3);%this one
    Reynolds = obj.localReynoldNumberTotal(:,Index3);%this one
    
    %fluctuations for y direction should find out what to do.for now
    %assumed same fluctuation with the x direction
    RelativeVelocity = sqrt((((V+(windFluctuationX-q(3))*InterferenceFactor)*sin(thita)+((windFluctuationY-q(4))*InterferenceFactor)*cos(thita)-obj.rotationalSpeed.*obj.windTurbine.blade.localRadius').^2)+((((windFluctuationY-q(4))*InterferenceFactor)*sin(thita)-(V+(windFluctuationX-q(3))*InterferenceFactor)*cos(thita)).^2).*cos(obj.windTurbine.blade.delta').^2);
    %should also find a way to get the previous AngleOfAttack in order to
    %calc the dynamic stall.
    obj.AngleOfAttack_InTime(indexT,BladeN,:) = asin(((((windFluctuationY-q(4))*InterferenceFactor)*sin(thita)-(V+(windFluctuationX-q(3))*InterferenceFactor)*cos(thita)).*cos(obj.windTurbine.blade.delta')./RelativeVelocity));
    if indexT ~=1
        PreviousAngleOfAttack = obj.AngleOfAttack_InTime(indexT-1,BladeN,:);
    else
        PreviousAngleOfAttack = obj.AngleOfAttack_InTime(indexT,BladeN,:);
    end
    
    ReconstractedAngleOfAttack = reshape(obj.AngleOfAttack_InTime(indexT,BladeN,:),size(obj.AngleOfAttack_InTime(indexT,BladeN,:),3),1);
    ReconstractedPreviousAngleOfAttack = reshape(PreviousAngleOfAttack ,size(PreviousAngleOfAttack,3),1);
    
    
    
    
    [Cl,Cd] = obj.ClCdCalcTimeDomain(Reynolds,ReconstractedAngleOfAttack,ReconstractedPreviousAngleOfAttack,RelativeVelocity,thita);
    [Clstatic] = obj.windTurbine.blade.airfoil.getCl_rad(Reynolds,ReconstractedAngleOfAttack);
    [Cdstatic] = obj.windTurbine.blade.airfoil.getCd_rad(Reynolds,ReconstractedAngleOfAttack);
    
    %     if BladeN ==1
    %         subplot(4,1,1)
    %         plot(indexT,Cl(25),'ro',indexT,Clstatic(25),'o')
    %         hold on
    %         subplot(4,1,2)
    %         plot(indexT,Cd(25),'ro',indexT,Cdstatic(25),'o')
    %         hold on
    %         subplot(4,1,3)
    %         plot(indexT,rad2deg(ReconstractedAngleOfAttack(25)),'o')
    %         hold on
    %         subplot(4,1,4)
    %         plot(indexT,Reynolds(25),'o')
    %         hold on
    %     end
    
    
    [Cn,Ct] = obj.CnCtCalc(Cl,Cd,ReconstractedAngleOfAttack);
    % if BladeN ==1
    % subplot(4,2,2)
    % plot(indexT,Cn(25),'o')
    % title('Cn')
    % hold on
    %
    % subplot(4,2,4)
    % plot(indexT,Ct(25),'o')
    % title('Ct')
    % hold on
    % else
    % subplot(4,2,2)
    % plot(indexT,Cn(25),'ro')
    % title('Cn')
    % hold on
    %
    % subplot(4,2,4)
    % plot(indexT,Ct(25),'ro')
    % title('Ct')
    % hold on
    % end
    %     if BladeN ==1
    %         subplot(3,1,1)
    %        plot(indexT,Cl(25) ,'ro')
    %         hold on
    %     plot(indexT,Cl2 ,'bo')
    %         subplot(3,1,2)
    %        plot(indexT,Cd(25) ,'ro')
    %         hold on
    %     plot(indexT,Cd2 ,'bo')
    %     subplot(3,1,3)
    %        plot(indexT,rad2deg(ReconstractedAngleOfAttack(25)),'ro')
    %         hold on
    %     end
    %
    %
    %
    %
    
    
    [Fx,Fy] = calcFxFyInTime(obj,Cn,Ct,thita,RelativeVelocity);
    
    FxBlade= sum(Fx);%check the other way also with 2/NumberOfNodes
    FyBlade = sum(Fy);%check the other way also with 2/NumberOfNodes
    
    FwindX = FxBlade + FwindX;
    FwindY = FyBlade + FwindY;
    
    
    
    
    %
    %
    %
    %         if BladeN ==1
    %             subplot(4,3,1)
    %             plot(indexT,InterferenceFactor(25),'o')
    %             hold on
    %             title('InterferenceFactor')
    %             subplot(4,3,2)
    %             plot(indexT,thita,'o')
    %             hold on
    %             title(['thita:' num2str(rad2deg(thita))])
    %             subplot(4,3,3)
    %             plot(indexT,Reynolds(25),'o')
    %             hold on
    %             title('Reynolds')
    %             subplot(4,3,4)
    %             plot(indexT,Cl(25),'o',indexT,Clstatic(25),'ro')
    %             hold on
    %             title('Cl,ClstaticRED')
    %             subplot(4,3,5)
    %             plot(indexT,Cd(25),'o',indexT,Cdstatic(25),'ro')
    %             hold on
    %             title('CD,CDstaticRED')
    %             subplot(4,3,6)
    %             plot(indexT,ReconstractedAngleOfAttack(25),'o')
    %             hold on
    %             title('AngleOfAttack')
    %             subplot(4,3,7)
    %             plot(indexT,RelativeVelocity(25),'o')
    %             hold on
    %             title('RelativeVelocity')
    %
    %         end
    
    
    
    
    
    
    
    
    Index2 = Index2+obj.ThitaNodeTotal/obj.windTurbine.NumOfBlades;
end
Index2 = [];
% FwindY = FyBladeFinal;
% subplot(4,3,8)
% plot(indexT,FwindX,'o')
% hold on
% title('FwindX')
% subplot(4,3,9)
% plot(indexT,FwindY,'o')
% hold on
% title('FwindY')