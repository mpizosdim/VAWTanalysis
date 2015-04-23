function obj = flowCalculationCARDAA(obj)
%upwind
obj.FinalInterferenceFactorUpwind = CalcInterferenceFactorUpwindCARDAA(obj);
obj.V1 = obj.FinalInterferenceFactorUpwind.*obj.WindSimulation.Vatmospheric;
if any(isnan(obj.V1(:)))
    obj.V1 = Smouth1DmatrixWithNaN(obj.V1);
end

[obj.CnUp,obj.CtUp,obj.localRelativeVelocityUp,obj.AngleOfAttackUp,obj.localReynoldNumberUp,obj.ClUp,obj.CdUp,obj.localTSRUp] = obj.Calc_Cn_Ct_W_AoA_UpwindCARDAA(obj.V1);
obj.Vequlibrium = ((2*obj.FinalInterferenceFactorUpwind)-1).*obj.WindSimulation.Vatmospheric;
%downwind
obj.FinalInterferenceFactorDownwind = CalcInterferenceFactorDownwindCARDAA(obj);
obj.V2 = obj.FinalInterferenceFactorDownwind.*obj.Vequlibrium;
if any(isnan(obj.V2(:)))
    obj.V2 = Smouth1DmatrixWithNaN(obj.V2);
end

[obj.CnDown,obj.CtDown,obj.localRelativeVelocityDown,obj.AngleOfAttackDown,obj.localReynoldNumberDown,obj.ClDown,obj.CdDown,obj.localTSRDown] = obj.Calc_Cn_Ct_W_AoA_DownwindCARDAA(obj.V2);

%expansion
if strcmp(obj.model,'Stream Tube Expansion')
    obj.FinalInterferenceFactorUpwind = obj.streamtubeExpansionModel('Upwind')';
    obj.FinalInterferenceFactorDownwind = obj.streamtubeExpansionModel('Downwind')';
    %     use tower effect soon.
    if strcmp(obj.towerEffect,'Tower Effect')
        warning('Tower effect simulation is still under implimentation')
        ft = 1-(2*obj.windTurbine.tower.Radius./(2*obj.windTurbine.blade.localRadius+2*obj.windTurbine.tower.Radius));
        obj.FinalInterferenceFactorDownwind = bsxfun(@times,ft',obj.FinalInterferenceFactorDownwind);
    end
    obj.V1 = bsxfun(@times,obj.FinalInterferenceFactorUpwind,obj.WindSimulation.Vatmospheric');
    if any(isnan(obj.V1(:)))
        obj.V1 = Smouth2DmatrixWithNaN(obj.V1);
    end
    
    [obj.CnUp,obj.CtUp,obj.localRelativeVelocityUp,obj.AngleOfAttackUp,obj.localReynoldNumberUp,obj.ClUp,obj.CdUp,obj.localTSRUp] = obj.Calc_Cn_Ct_W_AoA_Upwind(obj.V1);
    %----------Check Nan values Upwind----------------------------
    if any(isnan(obj.CnUp(:)))
        obj.CnUp = Smouth2DmatrixWithNaN(obj.CnUp);
    end
    if any(isnan(obj.CtUp(:)))
        obj.CtUp = Smouth2DmatrixWithNaN(obj.CtUp);
    end
    if any(isnan(obj.localRelativeVelocityUp(:)))
        obj.localRelativeVelocityUp= Smouth2DmatrixWithNaN(obj.localRelativeVelocityUp);
    end
    if any(isnan(obj.AngleOfAttackUp(:)))
        obj.AngleOfAttackUp = Smouth2DmatrixWithNaN(obj.AngleOfAttackUp);
    end
    if any(isnan(obj.localReynoldNumberUp(:)))
        obj.localReynoldNumberUp = Smouth2DmatrixWithNaN(obj.localReynoldNumberUp);
    end
    if any(isnan(obj.ClUp(:)))
        obj.ClUp = Smouth2DmatrixWithNaN(obj.ClUp);
    end
    if any(isnan(obj.CdUp(:)))
        obj.CdUp= Smouth2DmatrixWithNaN(obj.CdUp);
    end
    if any(isnan(obj.localTSRUp(:)))
        obj.localTSRUp = Smouth2DmatrixWithNaN(obj.localTSRUp);
    end
    %-------------------------------------------------------
    
    
    obj.Vequlibrium = bsxfun(@times,((2*obj.FinalInterferenceFactorUpwind)-1),obj.WindSimulation.Vatmospheric');
    obj.V2 = obj.FinalInterferenceFactorDownwind.*fliplr(obj.Vequlibrium);
    if any(isnan(obj.V2(:)))
        obj.V2 = Smouth2DmatrixWithNaN(obj.V2);
    end
    
    [obj.CnDown,obj.CtDown,obj.localRelativeVelocityDown,obj.AngleOfAttackDown,obj.localReynoldNumberDown,obj.ClDown,obj.CdDown,obj.localTSRDown] = obj.Calc_Cn_Ct_W_AoA_Downwind(obj.V2);
    %----------Check Nan values Upwind----------------------------
    if any(isnan(obj.CnDown(:)))
        obj.CnDown = Smouth2DmatrixWithNaN(obj.CnDown);
    end
    if any(isnan(obj.CtDown(:)))
        obj.CtDown = Smouth2DmatrixWithNaN(obj.CtDown);
    end
    if any(isnan(obj.localRelativeVelocityDown(:)))
        obj.localRelativeVelocityDown= Smouth2DmatrixWithNaN(obj.localRelativeVelocityDown);
    end
    if any(isnan(obj.AngleOfAttackDown(:)))
        obj.AngleOfAttackDown = Smouth2DmatrixWithNaN(obj.AngleOfAttackDown);
    end
    if any(isnan(obj.localReynoldNumberDown(:)))
        obj.localReynoldNumberDown = Smouth2DmatrixWithNaN(obj.localReynoldNumberDown);
    end
    if any(isnan(obj.ClDown(:)))
        obj.ClDown = Smouth2DmatrixWithNaN(obj.ClDown);
    end
    if any(isnan(obj.CdDown(:)))
        obj.CdDown= Smouth2DmatrixWithNaN(obj.CdDown);
    end
    if any(isnan(obj.localTSRDown(:)))
        obj.localTSRDown = Smouth2DmatrixWithNaN(obj.localTSRDown);
    end
    %-------------------------------------------------------
    
    
    
    obj.CnTotal = [obj.CnUp' obj.CnDown'];
    obj.CtTotal = [obj.CtUp' obj.CtDown'];
    obj.localRelativeVelocityTotal = [obj.localRelativeVelocityUp obj.localRelativeVelocityDown];
    obj.AngleOfAttackTotal = [obj.AngleOfAttackUp obj.AngleOfAttackDown];
elseif strcmp(obj.model,'No STE')
    obj.CnTotal = [obj.CnUp' obj.CnDown'];
    obj.CtTotal = [obj.CtUp' obj.CtDown'];
    obj.localRelativeVelocityTotal = [obj.localRelativeVelocityUp' obj.localRelativeVelocityDown'];
    obj.AngleOfAttackTotal = [obj.AngleOfAttackUp' obj.AngleOfAttackDown'];
else
    error('no model is selected for the simulation')
end

obj.Vtotal = [obj.V1 obj.V2];
obj.InterferenceFactorTotal = [obj.FinalInterferenceFactorUpwind obj.FinalInterferenceFactorDownwind];
obj.localReynoldNumberTotal = [obj.localReynoldNumberUp obj.localReynoldNumberDown];



%

%chech this again after this comment.!!!!
for thetaNode = 1:obj.ThitaNodeTotal
    Fn(thetaNode) = CalculationFn(obj,thetaNode);
    Ft(thetaNode) = CalculationFt(obj,thetaNode);
end

if any(isnan(Fn(:)))
    Fn = Smouth1DmatrixWithNaN(Fn);
end
if any(isnan(Ft(:)))
    Ft = Smouth1DmatrixWithNaN(Ft);
end
obj.Fn = Fn;
obj.Ft = Ft;