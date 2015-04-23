function Checks(obj)
if obj.windTurbine.Solidity>0.2
    warning('Solidity is higher of 0.2!! Glauert momentum theory is not valid outside this range!!')
end

if any(obj.FinalInterferenceFactorUpwind(:)<0.5) || any(obj.FinalInterferenceFactorDownwind(:)<0.5)
    
    warning('Interference factor below 0.5 is found. Solution could be not accurate.Recalculate with different values')
end

if obj.timestepPerThitaNode>1
    warning('timestep is higher than 1.Runge phenomenon is expected.Resolution of the model should be higher to avoid the phenomenon')    
end

if (2*(obj.windTurbine.tower.Radius)/obj.WaveSimulation.Length)<0.1 || (2*(obj.windTurbine.tower.Radius)/obj.WaveSimulation.Length)>0.2
    ratio = 2*(obj.windTurbine.tower.Radius)/(obj.WaveSimulation.Length);
    warning(['tower diameter/wave Length ratio' num2str(ratio) '.Should be in the range 0.1 to 0.2.Recommenced to try other values for wave Length.'])
    
end
    
if ((obj.TotalTime/(2^13))-obj.timestepPerThitaNode)> 0.1
   warning('Check the timestep.For accurate results be close to this ratio: dt = DurationTime/(2^13)') 
end

%if localTipSpeedRatio<5 &&
%testSimulation.windTurbine.blade.chord/testSimulation.windTurbine.blade.R
%     warning('ë <5 and C/R>0.1! strong dynamic stall is to be expected')
%end