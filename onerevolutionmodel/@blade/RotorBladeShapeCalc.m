function [ni,zita,delta,localHeights,localRadius,deltaZ,PhysicalHeight] = RotorBladeShapeCalc(obj,NumberOfNodes,shapeType,Z_r)
localHeights = linspace(-obj.H,obj.H,NumberOfNodes);
zita = localHeights./obj.H;
if strcmp(shapeType,'Default')
    localRadius = obj.R*(1-((localHeights)/obj.H).^2)+(obj.R/NumberOfNodes);%CHECK THIS:what should i do to this for the first and last value
    ni = localRadius./(obj.R+(obj.R/NumberOfNodes));
    delta = deg2rad(90)-abs(atan(1./(2*zita)));% DELTA IS STILL NOT SURE HOW TO CALCULATE!!!
elseif strcmp(shapeType,'User Input')
    [filename,~,~] = uigetfile({'*.xlsx'},'Pick User Data:(1st:zita,2nd:ni,3rd:delta)');
    Data = xlsread(filename);
    zitaData = Data(:,1);
    ni = interp1(zitaData,Data(:,2),zita);
    delta = interp1(zitaData,Data(:,3),zita);
elseif strcmp(shapeType,'H-type')
    ni = ones(1,NumberOfNodes);
    delta = zeros(1,NumberOfNodes);
    delta = abs(delta);
    localRadius = ni*obj.R;
elseif strcmp(shapeType,'V-type')
    thetablade = atan(obj.R/(2*obj.H));
    localHeights = linspace(0,2*obj.H,NumberOfNodes) ;
    PhysicalHeight  = linspace(0,2*obj.H,NumberOfNodes) ;
    bladeLength = localHeights./(ones(1,NumberOfNodes).*cos(thetablade));
    localRadius = bladeLength.*sin(thetablade)+(obj.R/NumberOfNodes) ;
    ni = localRadius./(obj.R+(obj.R/NumberOfNodes));
    zita = localHeights./(2*obj.H);
    delta = ones(1,NumberOfNodes).*thetablade;% DELTA IS STILL NOT SURE HOW TO CALCULATE!!!
    
else
    Data = xlsread('WindTurbineShapes.xlsx');
    zitaData = Data(:,2);
    switch shapeType
        case 'Ideal Troposkien'
            ni = interp1(zitaData,Data(:,3),zita);
            delta = interp1(zitaData,Data(:,4),zita);
        case 'Catenary'
            ni = interp1(zitaData,Data(:,5),zita);
            delta = interp1(zitaData,Data(:,6),zita);
        case 'Parabola'
            ni = interp1(zitaData,Data(:,7),zita);
            delta = interp1(zitaData,Data(:,8),zita);
        case 'Sandia Type'
            ni = interp1(zitaData,Data(:,9),zita);
            delta = interp1(zitaData,Data(:,10),zita);
        case 'Modifiend Troposkien'
            ni = interp1(zitaData,Data(:,11),zita);
            delta = interp1(zitaData,Data(:,12),zita);
        otherwise
            error('Wrong input in the shape design')
    end
    if ~strcmp(shapeType,'H-type')==1
        ni(1) = ni(2)/2;
        ni(end) = ni(end)/2;
    end
    delta = abs(delta);
    localRadius = ni*obj.R;
end
deltaZtemp = diff(localHeights);
if range(deltaZtemp) < 0.01%tolerance
    deltaZ = deltaZtemp(1);
else
    deltaZ = deltaZtemp(2);
    warning('distances between nodes are not equal.Check the values.Was chosen the second value.')
end
if strcmp(shapeType,'V-type')==0
    PhysicalHeight = Z_r + linspace(0,2*obj.H,NumberOfNodes);
end