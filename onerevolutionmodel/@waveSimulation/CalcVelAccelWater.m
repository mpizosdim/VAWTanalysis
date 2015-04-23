function [WaterElevation,WaterVelocity,WaterAccelaration] = CalcVelAccelWater(obj,df,fHighCut,time,Z)
[frequencydomain,ap,~] = obj.JONSWAPspectrum(df,fHighCut);
omega = 2*pi*frequencydomain;
epsilon=2*pi*rand(1,length(frequencydomain));
M=length(time);
WaterElevation=M*real(ifft(pad2(ap.*exp(1i*epsilon),M)));
options = optimset('Display','off');
for ii = 1:length(frequencydomain)
    k(ii) = fsolve(@(k) obj.Gravity*k*tanh(k*abs(obj.SeaDepth)) - omega(ii)^2,1,options);
end
for Node = 1:length(Z)
    for frequencyNode = 1:length(frequencydomain)
        VelocityFreqDomain(frequencyNode) = (omega(frequencyNode)*ap(frequencyNode))*((cosh(k(frequencyNode)*(Z(Node)+abs(obj.SeaDepth))))/(sinh(k(frequencyNode)*abs(obj.SeaDepth))));
        AccelerationFreqDomain(frequencyNode) = 1i*((omega(frequencyNode)^2)*ap(frequencyNode))*((cosh(k(frequencyNode)*(Z(Node)+abs(obj.SeaDepth))))/(sinh(k(frequencyNode)*abs(obj.SeaDepth))));
    end
    WaterVelocity(Node,:)=M*real(ifft(pad2(VelocityFreqDomain.*exp(1i*epsilon),M)));
    WaterAccelaration(Node,:)=M*real(ifft(pad2(AccelerationFreqDomain.*exp(1i*epsilon),M)));
    
end
