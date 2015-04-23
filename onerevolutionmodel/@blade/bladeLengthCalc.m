function bladeLength = bladeLengthCalc(obj,shapetype)

    localHeight = linspace(-obj.H,obj.H,100);
    if strcmp(shapetype,'H-type')
        localRadius = obj.R*ones(1,100);
    elseif strcmp(shapetype,'V-type')
        thetablade = atan(obj.R/(2*obj.H));
        localHeight = linspace(-obj.H,obj.H,100) ;
        bladeLength = localHeight./(ones(1,100)*cos(thetablade));
        localRadius = bladeLength.*sin(thetablade) ; 
    else
        
        localRadius = obj.R*(1-((localHeight)/obj.H).^2);
    end
    bladeLength = arclength(localHeight,localRadius);


