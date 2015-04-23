function obj = TotalConstantVariables(obj)

NaturalTotalRoundsOfTurbine  = ceil(length(obj.time)/obj.ThitaNodeTotal);
obj.Vtotal_InTime = repmat(obj.Vtotal,1,NaturalTotalRoundsOfTurbine);
obj.azimuthalThitaTotal_InTime = repmat(obj.azimuthalThitaTotal.rad,1,NaturalTotalRoundsOfTurbine);
obj.localReynoldNumberTotal_InTime= repmat(obj.localReynoldNumberTotal,1,NaturalTotalRoundsOfTurbine);
obj.Vtotal_InTime2 =repmat(obj.Vtotal,1,2*NaturalTotalRoundsOfTurbine);
% obj.InterferenceFactorTotalIntime2= repmat(obj.InterferenceFactorTotal,1,2*NaturalTotalRoundsOfTurbine);
obj.InterferenceFactorTotalIntime = repmat(obj.InterferenceFactorTotal,1,2*NaturalTotalRoundsOfTurbine);
obj.azimuthalThitaTotal_InTime2 = repmat(obj.azimuthalThitaTotal.rad,1,2*NaturalTotalRoundsOfTurbine);
obj.localReynoldNumberTotal_InTime2 = repmat(obj.localReynoldNumberTotal,1,2*NaturalTotalRoundsOfTurbine);
obj.Vtotal_InTime(:,(length(obj.time)+1):end) = [];
obj.azimuthalThitaTotal_InTime(:,(length(obj.time)+1):end) = [];
obj.localReynoldNumberTotal_InTime(:,(length(obj.time)+1):end) = [];