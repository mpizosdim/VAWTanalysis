classdef simulation < handle
    properties
        windTurbine@windTurbine
        rotationalSpeed % rotational speed of wind turbine, s-1
        WindSimulation@WindSimulation %@WindSimulation %change to windSimulation class type
        WaveSimulation@waveSimulation %WaveSimulation class type
        NumberOfNodes % calculation nodes for blade
        dthita % deltathita for the azimuthal angle
        azimuthalThitaUpwind % thita where the calcs are made
        azimuthalThitaDownwind
        azimuthalThitaTotal
        ThitaNodePerSide
        ThitaNodeTotal
        TotalMeshGrid
        V1
        V2
        Vtotal
        Vequlibrium
        FinalInterferenceFactorDownwind
        FinalInterferenceFactorUpwind
        CnUp
        CnDown
        CtUp
        CtDown
        localRelativeVelocityUp
        localRelativeVelocityDown
        AngleOfAttackUp
        AngleOfAttackDown
        CnTotal
        CtTotal
        localRelativeVelocityTotal
        AngleOfAttackTotal
        Fn
        Ft
        localReynoldNumberUp
        localReynoldNumberDown
        localReynoldNumberTotal
        ClUp
        CdUp
        ClDown
        CdDown
        localTSRUp
        localTSRDown
        model
        towerEffect
        Stall
        timestepPerThitaNode
        StallInTime
        time
        TotalTime
        Cp1
        Cp2
        averageCycleTorque
        AngleOfAttack_InTime
        TimedomainSimulation
        %------equationofmotion
        BuyancyForce
        MassMatrix
        AddedMassMatrix
        Cmatrix
        InterferenceFactorTotal
        Data
        %---frequency results
        period_surge
        period_sway
        period_pitch
        period_roll
        psV_Hub
        psEta
        psSurgeX
        psSurgeY
        psThitaX
        psFiY
        fFFT
        initialRemode
        time2
        psFy
        psFx
        %TIME Domain
        Surge
        Sway
        Pitch
        Roll
        Xmotion
        Ymotion
        ThitaMotion
        FiMotion
        %Use of parameters
        UseWave
        UseWind
        UseConstantWind
        InitialConditions
        FwindX
        FwindY
        FhydroX
        FhydroY
        TwindX
        TwindY
        ThydroX
        ThydroY
        psTwindX
        psTwindY
        ForcesXtotal
        ForcesYtotal
        MomentXtotal
        MomentYtotal
        %--for one blade
        FxforOneBlade
        FyforOneBlade
        psFxOneblade
        psFyOneblade
        %options for the Gui
        GyroscopicEffect
        KmoorAutoCalculate
        %additonal in simulation
        RelativeVelocity
        Cl
        Cd
    end
    
    properties(Constant = true)
        speedOfSound = 340.29;
    end
    
    methods
        function obj = simulation(windTurbine,rotationalSpeed,WindSimulation,WaveSimulation,NumberOfNodes,dthita,model,towerEffect,Stall,StallInTime,TotalTime,fHighCut,TimedomainSimulation,Data,initialRemode,UseWind,UseWave,UseConstantWind,InitialConditions,GyroscopicEffect,KmoorAutoCalculate)
            obj.windTurbine = windTurbine;
            obj.rotationalSpeed = rotationalSpeed;
            obj.WindSimulation = WindSimulation;
            obj.WaveSimulation = WaveSimulation;
            obj.NumberOfNodes = NumberOfNodes;
            obj.TimedomainSimulation = TimedomainSimulation;
            obj.dthita = dthita;
            obj.model = model;
            obj.towerEffect = towerEffect;
            obj.Stall = Stall;
            obj.Data = Data;
            obj.initialRemode = initialRemode;
            obj.UseWave = UseWave;
            obj.UseWind = UseWind;
            obj.UseConstantWind = UseConstantWind;
            obj.InitialConditions = InitialConditions;
            obj.KmoorAutoCalculate = KmoorAutoCalculate;
            obj.GyroscopicEffect = GyroscopicEffect;
            if TotalTime < 300
                error('Total should be bigger than 300 second in order to evaluate the spectrum of the motion without Initial conditions have impact')
            end
            obj.TotalTime = TotalTime;
            obj.azimuthalThitaUpwind.deg = linspace(-90+dthita/2,90-dthita/2,180/dthita);
            obj.azimuthalThitaDownwind.deg = linspace(90+dthita/2,270-dthita/2,180/dthita);
            obj.azimuthalThitaUpwind.rad = deg2rad(obj.azimuthalThitaUpwind.deg);
            obj.azimuthalThitaDownwind.rad = deg2rad(obj.azimuthalThitaDownwind.deg);
            obj.azimuthalThitaTotal.rad = [obj.azimuthalThitaUpwind.rad obj.azimuthalThitaDownwind.rad ];
            obj.azimuthalThitaTotal.deg = [obj.azimuthalThitaUpwind.deg obj.azimuthalThitaDownwind.deg];
            [obj.windTurbine.blade.ni,obj.windTurbine.blade.zita,obj.windTurbine.blade.delta,obj.windTurbine.blade.localHeights,obj.windTurbine.blade.localRadius,obj.windTurbine.blade.deltaZ,obj.windTurbine.blade.PhysicalHeight] = obj.windTurbine.blade.RotorBladeShapeCalc(NumberOfNodes,windTurbine.shapeType,obj.windTurbine.Z_r); % calculates the blade shape (ni,zita,delta),should check what to do wit hthe radians!
            obj.windTurbine.sweptArea = obj.windTurbine.CalcSweptArea(obj.windTurbine.blade.localRadius,obj.windTurbine.blade.localHeights,obj.windTurbine.shapeType);
            [obj.windTurbine.blade.Length] = obj.windTurbine.blade.bladeLengthCalc(obj.windTurbine.shapeType);
            obj.windTurbine.Solidity = obj.windTurbine.CalcSolidity();
            [obj.windTurbine.blade.BladeReynoldsNumber] = obj.windTurbine.blade.BladeReynoldsNumberCalc(rotationalSpeed);
            obj.WindSimulation.Vatmospheric = obj.WindSimulation.WindVelocityCalc(obj.windTurbine.blade.H,obj.windTurbine.Z_r,obj.windTurbine.blade.localHeights);
            obj.ThitaNodePerSide = length(obj.azimuthalThitaUpwind.deg);
            obj.ThitaNodeTotal = 2*obj.ThitaNodePerSide;
            obj.timestepPerThitaNode = ((2*pi)/rotationalSpeed)/obj.ThitaNodeTotal;
            obj.TotalMeshGrid =  [num2str(NumberOfNodes) 'x' num2str([obj.ThitaNodePerSide])];
            obj.StallInTime = StallInTime;
            obj.time = 0:obj.timestepPerThitaNode:(TotalTime-obj.timestepPerThitaNode);
            %---------------------------------
            df = 1/obj.time(end);
            %--------------WAVE------------------------------
            obj.windTurbine.floater.Z_node = obj.windTurbine.floater.ZpositionCalc(NumberOfNodes);
            [obj.WaveSimulation.WaterElevation,obj.WaveSimulation.WaterVelocity,obj.WaveSimulation.WaterAccelaration] = obj.WaveSimulation.CalcVelAccelWater(df,fHighCut,obj.time,obj.windTurbine.floater.Z_node);
            [obj.WaveSimulation.ReynoldsNumber] = obj.WaveSimulation.CalcReynoldsNumberWater(obj.WaveSimulation.WaterVelocity,obj.WaveSimulation.KinematicViscocity,obj.windTurbine.floater.Radius);
            [obj.WaveSimulation.Cd] = obj.WaveSimulation.CalcCdWater(obj.WaveSimulation.ReynoldsNumber);
            [obj.WaveSimulation.Cm] = obj.WaveSimulation.CalcCmWater(obj.WaveSimulation.ReynoldsNumber);
            obj.windTurbine.floater.TetherLength = obj.windTurbine.floater.TetherLengthCalc(obj.WaveSimulation.SeaDepth);
            % ------turbulence wind-------
            if strcmp(obj.WindSimulation.WindModel,'Turbulence Model(Kaimal)')
                [obj.WindSimulation.TurbulenceVelocityX,obj.WindSimulation.fluctuationX,obj.WindSimulation.TurbulenceVelocityY,obj.WindSimulation.fluctuationY] = obj.WindSimulation.TurbWindVelocityCalc(obj.time,df,fHighCut);
                if obj.WindSimulation.Gust.Implimintation==1
                    [obj.WindSimulation.TurbulenceVelocityX,obj.WindSimulation.fluctuationX] = obj.WindSimulation.CalcExtremeWind(obj.WindSimulation.fluctuationX,obj.timestepPerThitaNode,obj.windTurbine.blade.H,obj.windTurbine.Z_r,obj.windTurbine.blade.localHeights,obj.time);
                end
            end
            obj = flowCalculationCARDAA(obj);
            [obj.Cp1,obj.Cp2,obj.averageCycleTorque ] = CpCalculation(obj);
            %-------------------Changing the angle of the flow
            if strcmp(obj.WindSimulation.WindModel,'Turbulence Model(Kaimal)')
                if obj.WindSimulation.EDC.Implimintation==1
                    [obj.WindSimulation.TurbulenceVelocityX,obj.WindSimulation.fluctuationX,obj.WindSimulation.TurbulenceVelocityY,obj.WindSimulation.fluctuationY,obj.Vtotal_InTime,obj.azimuthalThitaTotal_InTime,obj.localReynoldNumberTotal_InTime] = obj.WindSimulation.ExtremeDirectionChange(obj.timestepPerThitaNode,obj.time,obj.Vtotal_InTime2,obj.azimuthalThitaTotal_InTime2,obj.localReynoldNumberTotal_InTime2);
                end
            end
            if strcmp(obj.TimedomainSimulation,'Yes')
                if strcmp(obj.windTurbine.floater.type,'BUOY')
                    obj = BUOYmatrix(obj);
                    obj = CalcsInTimeBuoy(obj);
                elseif strcmp(obj.windTurbine.floater.type,'TLP')
                    obj.BuyancyForce = CalcBuyancyForce(obj);
                    obj = TLPmatrix(obj);
                    obj = CalcsInTimeTLP(obj);
                elseif strcmp(obj.windTurbine.floater.type,'Barge')
                    error('Barge model is not implimented yet.Coming soon...')
                else
                    error('Floating model not correct.Check again')
                end
            end
            
        end
        [Cn,Ct] = CnCtCalc(obj,Cl,Cd,AngleOfAttack);
        Checks(obj)
        Fn = CalculationFn(obj,thetaNode)
        Ft = CalculationFt(obj,thetaNode)
        Torque = CalculationTorque(obj,thetaNode)
        [Cp1,Cp2,averageCycleTorque ] = CpCalculation(obj)
        obj = PlotAllChecker(obj)
        FinalInterferenceFactorUpwindCARDAA = CalcInterferenceFactorUpwindCARDAA(obj)
        NewInterferenceFactor = CalcUpwindFunctionCARDAA(obj,InterferenceFactor,node);
        obj = flowCalculationCARDAA(obj,model)
        [CnUp,CtUp,localRelativeVelocityUp,AngleOfAttackUp,localReynoldNumberUp,ClUp,CdUp,localTSRUp] = Calc_Cn_Ct_W_AoA_UpwindCARDAA(obj,V1);
        [CnDown,CtDown,localRelativeVelocityDown,AngleOfAttackDown,localReynoldNumberDown,ClDown,CdDown,localTSRDown] = Calc_Cn_Ct_W_AoA_DownwindCARDAA(obj,V2);
        BuyancyForce = CalcBuyancyForce(obj)
        obj = TLPmatrix(obj)
        %---------------------------------In time TLP
        obj = CalcsInTimeTLP(obj)
        dqdt = OdeFunTLP(obj,t,q)
        [FhydroX,FhydroY] = CalcHydroForces(obj,t,q)
        [FwindX,FwindY] = CalcWindForces(obj,t,q)
        [Cl,Cd] = ClCdCalcTimeDomain(obj,Reynolds,AngleOfAttack,PreviousAngleOfAttack,RelativeVecity,thita)
        [Fx,Fy] = calcFxFyInTime(obj,Cn,Ct,theta,RelativeVelocity)
        %spectra
        obj = CalcSpectrumOfMotionTLP(obj,Motion)
        SpectrumOfMotion = CalcSpectrumOfMotionBUOY(obj,Motion)
        %---------------------------------In time Bouy--------------
        obj = CalcsInTimeBuoy(obj)
        obj = BUOYmatrix(obj)
        dqdt = OdeFunBOUY(obj,t,q)
        %---------------------DynamicSTALL--------------
        [Cl,Cd] = DynamicStallG_InTime(obj,Reynolds,AngleOfAttack,PreviousAngleOfAttack,RelativeVecity)
        [Cl,Cd] = DynamicStallS_InTime(obj,Reynolds,AngleOfAttack,PreviousAngleOfAttack,RelativeVecity)
        [Cl,Cd] = DynamicStallB_InTime(obj,Reynolds,AngleOfAttack,PreviousAngleOfAttack,RelativeVecity)
        %-------------Spectrum--------------
        [freq,psdx] = CalcPowerSpectra(obj,Data)
    end
end