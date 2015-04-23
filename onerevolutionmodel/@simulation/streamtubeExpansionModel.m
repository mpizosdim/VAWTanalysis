function NewInterferenceFactor = streamtubeExpansionModel(obj,side)

NewInterferenceFactor = zeros(obj.ThitaNodePerSide,obj.NumberOfNodes);

if strcmp(side,'Upwind')
    for node = 1:obj.NumberOfNodes
        for thitaNode = 1:obj.ThitaNodePerSide
            fun = @(theta2) ((obj.CnUp(thitaNode,node)*cos(theta2)+obj.CtUp(thitaNode,node)*sin(theta2)/(cos(obj.windTurbine.blade.delta(node))))*(obj.localRelativeVelocityUp(thitaNode,node)/obj.V1(node))^2);
            K=(8*pi*obj.windTurbine.blade.localRadius(node))/(obj.windTurbine.NumOfBlades*obj.windTurbine.blade.chord);
            K0 = sin(obj.azimuthalThitaUpwind.rad(thitaNode)+deg2rad(obj.dthita/2))-sin(obj.azimuthalThitaUpwind.rad(thitaNode)-deg2rad(obj.dthita/2));
            Integral1 = integral(fun,obj.azimuthalThitaUpwind.rad(thitaNode)-deg2rad(obj.dthita/2),obj.azimuthalThitaUpwind.rad(thitaNode)+deg2rad(obj.dthita/2));
            NewInterferenceFactor(thitaNode,node) = ((K*K0)*obj.windTurbine.blade.ni(node))/(((K*K0)*obj.windTurbine.blade.ni(node))+Integral1);
        end
    end
elseif strcmp(side,'Downwind')
    for node = 1:obj.NumberOfNodes
        for thitaNode = 1:obj.ThitaNodePerSide
            fun = @(theta2) ((obj.CnDown(thitaNode,node)*cos(theta2)+obj.CtDown(thitaNode,node)*sin(theta2)/(cos(obj.windTurbine.blade.delta(node))))*(obj.localRelativeVelocityDown(thitaNode,node)/obj.V2(node))^2);%check this out with the V(thitaNode,node)
            K=(8*pi*obj.windTurbine.blade.localRadius(node))/(obj.windTurbine.NumOfBlades*obj.windTurbine.blade.chord);
            K0 = sin(obj.azimuthalThitaDownwind.rad(thitaNode)+deg2rad(obj.dthita/2))-sin(obj.azimuthalThitaDownwind.rad(thitaNode)-deg2rad(obj.dthita/2));
            Integral1 = integral(fun,obj.azimuthalThitaDownwind.rad(thitaNode)-deg2rad(obj.dthita/2),obj.azimuthalThitaDownwind.rad(thitaNode)+deg2rad(obj.dthita/2));
            NewInterferenceFactor(thitaNode,node) = ((-K*K0)*obj.windTurbine.blade.ni(node))/(((-K*K0)*obj.windTurbine.blade.ni(node))+Integral1);
        end
    end
    
else
    error('Invalid input in Stream Tube Expansion')
    
end
%all these should be checked again.
%  NewInterferenceFactor(:,1) = NewInterferenceFactor(:,3);
%   NewInterferenceFactor(:,2) = NewInterferenceFactor(:,3);
%  NewInterferenceFactor(:,end) = NewInterferenceFactor(:,end-2);
%  NewInterferenceFactor(:,end-1) = NewInterferenceFactor(:,end-2);
 NewInterferenceFactor(NewInterferenceFactor>1)=1;
 NewInterferenceFactor(NewInterferenceFactor<0)=0.8;