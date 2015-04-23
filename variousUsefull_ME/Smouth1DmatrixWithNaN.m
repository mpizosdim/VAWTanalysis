function NewMatrix = Smouth1DmatrixWithNaN(Matrix)
ii = ~isnan(Matrix);
i0 = reshape(1:numel(Matrix),size(Matrix));
NewMatrix = interp1(i0(ii),Matrix(ii),i0,'spline');