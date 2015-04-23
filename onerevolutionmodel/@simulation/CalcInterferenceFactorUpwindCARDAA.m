function FinalInterferenceFactorUpwindCARDAA = CalcInterferenceFactorUpwindCARDAA(obj)
checker = 0;

for node=1:obj.NumberOfNodes
    InterferenceFactor = 1;
    NewInterferenceFactor = CalcUpwindFunctionCARDAA(obj,InterferenceFactor,node);
    while (abs(InterferenceFactor-NewInterferenceFactor)>10e-4)
        InterferenceFactor = NewInterferenceFactor;
        NewInterferenceFactor = CalcUpwindFunctionCARDAA(obj,InterferenceFactor,node);
        checker = checker+1;
        if checker>100
            InterferenceFactor = (NewInterferenceFactor+FinalInterferenceFactorUpwind(node-1))/2;
            NewInterferenceFactor = InterferenceFactor;
            warning('solution out of iterations in the following node:')
            display(['node: ' num2str(node) ' azimuthal angle(deg): ' num2str(obj.azimuthalThitaUpwind.deg(jj)) ',interference factor for this node:' num2str(NewInterferenceFactor)])
        end
    end
    FinalInterferenceFactorUpwindCARDAA(node) = NewInterferenceFactor;
    checker = 0;
end