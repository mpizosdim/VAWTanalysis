function [TurbulenceVelocityX,fluctuationX,TurbulenceVelocityY,fluctuationY]= TurbWindVelocityCalc(obj,t,df,fHighCut)
[~,obj.bpx,~,obj.bpy,obj.epsilon] = KaimalSpectrum(obj,df,fHighCut);
M=length(t);
for Node = 1:length(obj.Vatmospheric)
    fluctuationX(Node,:)=M*real(ifft(pad2(obj.bpx(Node,:).*exp(1i*obj.epsilon),M)));%fluctuation
    TurbulenceVelocityX(Node,:)=fluctuationX(Node,:)+obj.Vatmospheric(Node);
end
for Node = 1:length(obj.Vatmospheric)
    fluctuationY(Node,:)=M*real(ifft(pad2(obj.bpy(Node,:).*exp(1i*obj.epsilon),M)));%fluctuation
    TurbulenceVelocityY(Node,:)=fluctuationY(Node,:);
end
