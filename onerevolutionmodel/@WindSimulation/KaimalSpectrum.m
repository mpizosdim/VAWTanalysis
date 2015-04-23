function [Sx,bpx,Sy,bpy,epsilon] = KaimalSpectrum(obj,df,fHighCut)
frequencydomain=df:df:fHighCut;
for Node = 1:length(obj.Vatmospheric)
    Sx(Node,:)=(4*obj.Intensity^2*obj.Vatmospheric(Node)*obj.lx)./(1+6*(frequencydomain*obj.lx./obj.Vatmospheric(Node))).^(5/3);
    bpx(Node,:)=(2*Sx(Node,:)*df).^0.5;
end
for Node = 1:length(obj.Vatmospheric)
    Sy(Node,:)=(4*obj.Intensity^2*obj.Vatmospheric(Node)*obj.ly)./(1+6*(frequencydomain*obj.ly./obj.Vatmospheric(Node))).^(5/3);
    bpy(Node,:)=(2*Sy(Node,:)*df).^0.5;
end
epsilon=2*pi*rand(1,length(frequencydomain));
