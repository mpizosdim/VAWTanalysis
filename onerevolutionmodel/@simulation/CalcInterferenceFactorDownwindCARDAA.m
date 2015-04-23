function FinalInterferenceFactorDownwindCARDAA = CalcInterferenceFactorDownwindCARDAA(obj)
checker = 0;

for node=1:obj.NumberOfNodes
    InterferenceFactor = obj.FinalInterferenceFactorUpwind(node);
    NewInterferenceFactor = CalcDownwindFunctionCARDAA(obj,InterferenceFactor,node);
    while (abs(InterferenceFactor-NewInterferenceFactor)>10e-4)
        InterferenceFactor = NewInterferenceFactor;
        NewInterferenceFactor = CalcDownwindFunctionCARDAA(obj,InterferenceFactor,node);
        checker = checker+1;
        if checker>100
            %InterferenceFactor = (NewInterferenceFactor+FinalInterferenceFactorDownwindCARDAA(node-1))/2;
            NewInterferenceFactor = InterferenceFactor;
            warning('solution out of iterations in the following node:')
            %display(['node: ' num2str(node) ' azimuthal angle(deg): ' num2str(obj.azimuthalThitaDownwind.deg(jj)) ',interference factor for this node:' num2str(NewInterferenceFactor)])
        end
    end
    FinalInterferenceFactorDownwindCARDAA(node) = NewInterferenceFactor;
    checker = 0;
end