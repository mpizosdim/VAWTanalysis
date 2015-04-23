function [ExtremeWindX,ExtremefluctuationX,ExtremeWindY,ExtremefluctuationY,indVNew,azimuthalAngleNew,ReynoldsNew] = ExtremeDirectionChange(obj,timestepPerThitaNode,TotalTime,indV,azimuthalAngle,Reynolds)

t=0:timestepPerThitaNode:obj.EDC.periodEDC;

thita_E = 4*atan(obj.Sigma/(obj.VatmosphericEquator*(1+0.1)));
for ii = 1:length(t)
    if TotalTime(ii)<obj.EDC.periodEDC
        thita(ii) = 0.5*thita_E*(1-cos(pi*t(ii)/obj.EDC.periodEDC));
    else
        thita(ii) = thita_E;
    end
end
jj=1;
for ii = 1:length(TotalTime)
    if TotalTime(ii)>obj.EDC.startingTimeEDC && TotalTime(ii)<(obj.EDC.startingTimeEDC+obj.EDC.periodEDC)
        %         fluctuationTempX(:,ii) = obj.fluctuationX(:,ii)*cos(thita(jj))-(obj.Vatmospheric*sin(thita(jj)))';
        %         fluctuationTempY(:,ii) = obj.fluctuationY(:,ii)*cos(thita(jj))+(obj.Vatmospheric*sin(thita(jj)))';
        fluctuationTempX(:,ii) = (obj.fluctuationX(:,ii))*sin(deg2rad(90)-thita(jj))+obj.fluctuationY(:,ii)*sin(thita(jj))-(obj.Vatmospheric*sin(thita(jj)))';
        fluctuationTempY(:,ii) = (obj.fluctuationX(:,ii)+obj.Vatmospheric')*cos(deg2rad(90)-thita(jj))+obj.fluctuationY(:,ii)*cos(thita(jj));
        jj = jj +1;
    elseif TotalTime(ii)>(obj.EDC.startingTimeEDC+obj.EDC.periodEDC)
        %         fluctuationTempX(:,ii) = obj.fluctuationX(:,ii)*cos(thita_E)-(obj.Vatmospheric*sin(thita_E))';
        %         fluctuationTempY(:,ii) = obj.fluctuationY(:,ii)*sin(thita_E)+(obj.Vatmospheric*sin(thita_E))';
        fluctuationTempX(:,ii) = (obj.fluctuationX(:,ii))*sin(deg2rad(90)-thita_E)+obj.fluctuationY(:,ii)*sin(thita_E)-(obj.Vatmospheric*sin(thita_E))';
        fluctuationTempY(:,ii) = (obj.fluctuationX(:,ii)+obj.Vatmospheric')*cos(deg2rad(90)-thita_E)+obj.fluctuationY(:,ii)*cos(thita_E);
        
    else
        fluctuationTempX(:,ii) = obj.fluctuationX(:,ii);
        fluctuationTempY(:,ii) = obj.fluctuationY(:,ii);
        
        
        
    end
    %     subplot(2,1,1)
    %     plot(TotalTime(ii),fluctuationTempX(25,ii),'ro')
    %     hold on
    %     subplot(2,1,2)
    %     plot(TotalTime(ii),fluctuationTempY(25,ii),'bo')
    %     hold on
end
lol = 3;


startingVtotal = find(floor(TotalTime)==obj.EDC.startingTimeEDC,1);

jj = 1;
for ii = 1:length(TotalTime)
    if TotalTime(ii)>obj.EDC.startingTimeEDC && TotalTime(ii)<(obj.EDC.startingTimeEDC+obj.EDC.periodEDC)
        Vtotal_Intime(:,ii) = indV(:,ii+jj);
        Reynolds_Intime(:,ii) = Reynolds(:,ii+jj);
        AzimuthalAngle_Intime(:,ii) = azimuthalAngle(:,ii+jj);
        jj = jj +1;
    elseif TotalTime(ii)>(obj.EDC.startingTimeEDC+obj.EDC.periodEDC)
        Vtotal_Intime(:,ii) = indV(:,ii+jj);
        Reynolds_Intime(:,ii) = Reynolds(:,ii+jj);
        AzimuthalAngle_Intime(:,ii) = azimuthalAngle(:,ii+jj);
    else
        Vtotal_Intime(:,ii) = indV(:,ii);
        Reynolds_Intime(:,ii) = Reynolds(:,ii);
        AzimuthalAngle_Intime(:,ii) = azimuthalAngle(:,ii);
        
    end
end

indVNew = Vtotal_Intime;
azimuthalAngleNew = AzimuthalAngle_Intime;
ReynoldsNew = Reynolds_Intime;


ExtremefluctuationX = fluctuationTempX;
ExtremefluctuationY = fluctuationTempY;

for Node = 1:length(obj.Vatmospheric)
    ExtremeWindX(Node,:) = ExtremefluctuationX(Node,:)+obj.Vatmospheric(Node);
    ExtremeWindY(Node,:) = ExtremefluctuationY(Node,:);
    
end

