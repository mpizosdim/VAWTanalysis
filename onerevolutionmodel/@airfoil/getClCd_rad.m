function [Cl,Cd] = getClCd_rad(obj,Reynolds,angleofattack,Stall,localRelativeVelocity,timestep,ThitaNodePerSide,rotationalSpeed,SpeedOfSound,thickness,chord,theta)
switch Stall{1}
    case 'Dynamic Gormonts'
        if size(angleofattack,1)==1;angleofattack = angleofattack';Reynolds=Reynolds';localRelativeVelocity=localRelativeVelocity';end
        for Node = 1:size(angleofattack,2)
            angleofattack2 = angleofattack(:,Node)';
            Sa = sign(angleofattack2);
            alpha = abs(angleofattack2);
            alphaRate = ([alpha(1) diff(alpha)])/timestep/(1+(alpha(1)==1));
            for angleNode = 1:length(angleofattack2)
                %             alphaRate=(alpha-(angleNode>1)*angleofattack(angleNode-1))/(obj.timestepPerThitaNode/(1+(angleNode==1)));
                [Clperm(angleNode),Cdperm(angleNode)] = obj.DynamicStallG(Reynolds(angleNode,Node),alpha(angleNode),alphaRate(angleNode),localRelativeVelocity(angleNode,Node),ThitaNodePerSide,rotationalSpeed,SpeedOfSound,thickness,chord);
            end
            Cl(:,Node) = Sa.*Clperm;
            Cd(:,Node) = Cdperm;
            
        end
        if size(angleofattack,2)==1;Cl=Cl';Cd=Cd';end
    case 'Dynamic Berg'
        if size(angleofattack,1)==1;angleofattack = angleofattack';Reynolds=Reynolds';localRelativeVelocity=localRelativeVelocity';end
        for Node = 1:size(angleofattack,2)
            angleofattack2 = angleofattack(:,Node)';
            Sa = sign(angleofattack2);
            alpha = abs(angleofattack2);
            alphaRate = ([alpha(1) diff(alpha)])/timestep/(1+(alpha(1)==1));
            for angleNode = 1:length(angleofattack2)
                %             alphaRate=(alpha-(angleNode>1)*angleofattack(angleNode-1))/(obj.timestepPerThitaNode/(1+(angleNode==1)));
                [Clperm(angleNode),Cdperm(angleNode)] = obj.DynamicStallB(Reynolds(angleNode,Node),alpha(angleNode),alphaRate(angleNode),localRelativeVelocity(angleNode,Node),ThitaNodePerSide,rotationalSpeed,SpeedOfSound,thickness,chord);
            end
            Cl(:,Node) = Sa.*Clperm;
            Cd(:,Node) = Cdperm;
            
        end
        if size(angleofattack,2)==1;Cl=Cl';Cd=Cd';end
    case 'Static'
        %         if any(Reynolds > obj.ReynoldsNumCl(end))
        %             method = 'spline';
        %             warning('Reynolds number in the node is out of the limit of the input data.Extrapolation is made with Spline method.Results could be inaccurate!!')
        %         else
        %             method = 'linear';
        %         end
        %         Cl = interp2(obj.ReynoldsNumCl,obj.angleOfAttackCl.rad,obj.Cl,Reynolds,angleofattack,method);
        %         Cd = interp2(obj.ReynoldsNumCd,obj.angleOfAttackCd.rad,obj.Cd,Reynolds,angleofattack,method);
        [Cl] = getCl_rad(obj,Reynolds,angleofattack);
        [Cd] = getCd_rad(obj,Reynolds,angleofattack);
        
        
    case 'Dynamic Strickland'
%         if size(angleofattack,1)==1;angleofattack = angleofattack';end
        for Node = 1:size(angleofattack,2)
            angleofattack2 = angleofattack(:,Node)';
            Sa = sign(angleofattack2);
            alpha = abs(angleofattack2);
            alphaRate = ([alpha(1) diff(alpha)])/timestep/(1+(alpha(1)==1));
            for angleNode = 1:length(angleofattack2)
                %             alphaRate=(alpha-(angleNode>1)*angleofattack(angleNode-1))/(obj.timestepPerThitaNode/(1+(angleNode==1)));
                [Clperm(angleNode),Cdperm(angleNode)] = obj.DynamicStallS(Reynolds(angleNode,Node),alpha(angleNode),alphaRate(angleNode),localRelativeVelocity(angleNode,Node),ThitaNodePerSide,rotationalSpeed,SpeedOfSound,thickness,chord);
            end
            Cl(:,Node) = Sa.*Clperm;
            Cd(:,Node) = Cdperm;
            
        end
        if size(angleofattack,2)==1;Cl=Cl';Cd=Cd';end
        
        
    otherwise
        error('Stall method is not choosed by the user')
end
if length(Stall)~=1
    if strcmp(Stall{2},'Paraschivoiu Adaption')
%         if size(angleofattack,2)==1;Reynolds = Reynolds';end
        Cln = getCl_rad(obj,Reynolds,angleofattack);
        Cdn = getCd_rad(obj,Reynolds,angleofattack);
        fd =   (theta>=(deg2rad(20))) & (theta<deg2rad(135));
        fn = ~fd;
        %         fn=(cos(theta) < cos(-90*pi/180)) & ((sin(theta) <= sin(15*pi/180)) & (sin(theta) >= sin(135*pi/180)));
        %         fd=(cos(theta) >= cos(-90*pi/180)) | ((sin(theta) >= sin(15*pi/180)) | (sin(theta) <= sin(135*pi/180)));
        %         if size(angleofattack,2)==1;angleofattack = angleofattack';end
        if size(angleofattack,2)==1
            Clperm = Cl';
            Cdperm = Cd';
        else
            Clperm =Cl;
            Cdperm = Cd;
        end
        clear Cl Cd
        for Node = 1:size(angleofattack,2)
            Cl(:,Node) = Cln(:,Node).*fn' + Clperm(:,Node).*fd';
            Cd(:,Node) = Cdn(:,Node).*fn' + Cdperm(:,Node).*fd';
            %     alpha= ..;
            %     alpha=..;
        end
        if size(angleofattack,2)==1;Cl=Cl';Cd=Cd';end
    end
end





%CHECK FOR OPTIMIZE IN THE FUTURE.WORKS FOR FULL SIMULATION.DOESNT WORK FOR
%CALCULATING THE CRITICAL ANGLE OF ATTACK.
% [XGrid,YGrid]=meshgrid(obj.ReynoldsNumCl,obj.angleOfAttackCl.rad);
% F=griddedInterpolant(XGrid', YGrid',obj.Cl',method);
% Cl=F(Reynolds,angleofattack);

% [XGridd,YGridd]=meshgrid(obj.ReynoldsNumCd,obj.angleOfAttackCd.rad);
% F=griddedInterpolant(XGridd', YGridd',obj.Cd',method);
% Cd=F(Reynolds,angleofattack);