function TurbineReynolds = TurbineReynoldsCalc(obj,wmega)
viscocityOfAir = 1.58e-5;%check where to put this one , m/s^2
TurbineReynolds = obj.blade.R*wmega*obj.blade.chord/viscocityOfAir;%check with the nondimensionalization

