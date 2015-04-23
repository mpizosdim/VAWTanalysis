function [ExtremeWindX,ExtremefluctuationX] = CalcExtremeWind(obj,flactution,timestepPerThitaNode,H,Z_r,z,TotalTime)
Ve50 = 1.4*obj.Class.Vref*((z+H+Z_r)./(H+Z_r)).^(0.11);
Ve1 = 0.8*Ve50;
t=0:timestepPerThitaNode:obj.Gust.Period;
Vgust = min(1.35*(Ve1-obj.VatmosphericEquator),3.3*(obj.Sigma/(1+0.1)));
if range(Vgust)==1
    warning('Vgust differs in the height')
end
Vgust = Vgust(round(length(Vgust)/2));
fluctutionTemp = -0.36*Vgust.*sin(3*pi*t./obj.Gust.Period).*(1-cos(2*pi*t./obj.Gust.Period))+5 ;
jj=1;
for ii=1:length(TotalTime)
    if TotalTime(ii)>obj.Gust.StartingTime && TotalTime(ii)<(obj.Gust.StartingTime+obj.Gust.Period)
        fluctuationTemp2(:,ii) = flactution(:,ii)+fluctutionTemp(jj);
        jj=jj+1;
    else
        fluctuationTemp2(:,ii) = flactution(:,ii);
    end
end
ExtremefluctuationX = fluctuationTemp2;
for Node = 1:length(obj.Vatmospheric)
    ExtremeWindX(Node,:)=ExtremefluctuationX(Node,:)+obj.Vatmospheric(Node);
end