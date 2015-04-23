function SmouthedMatrix = Smouth2DmatrixWithNaN(matrix)
[r,c] = ndgrid(1:size(matrix,1),1:size(matrix,2));
l0 = ~isnan(matrix);
F = scatteredInterpolant(r(l0),c(l0),matrix(l0));
SmouthedMatrix  = F(r,c);