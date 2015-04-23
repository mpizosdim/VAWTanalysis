function sweptArea = CalcSweptArea(obj,localRadius,localHeights,shapeType)
if strcmp(shapeType,'V-type')==0
    xx = [-localRadius localRadius];
    yy = [localHeights fliplr(localHeights)];
    xx = [xx xx(1)];
    yy = [yy yy(1)];
    sweptArea = polyarea(xx,yy);
else
    sweptArea = localRadius(end)*localHeights(end);
end