classdef floater< handle
    properties
        type
        Mass
        InertiaCM
        Radius
        CrossSectionArea
        Length
        Z_node
        draft
        TetherLength
        CenterMass
        Zmoor
        Kmoor
    end
    
    methods
        function obj = floater(Mass,InertiaCM,Radius,Length,type,draft,Kmoor,Zmoor)
            obj.Mass = Mass;
            obj.InertiaCM = InertiaCM;
            obj.Radius = Radius;
            obj.Length = Length;
            obj.draft = draft;
            obj.type = type;
            obj.Kmoor = Kmoor;
            obj.Zmoor = Zmoor;
            if isequal(Length,draft)==0
                warning('it is recommended to make length and draft same value.Further research is not done is this subject.')
            end
            if draft > 0 
                warning('Draft and Length are considered to have negative value in this program.')
                obj.draft = -draft;
            end
            if Length > 0
                warning('Draft and Length are considered to have negative value in this program.')
                obj.Length = -Length;
            end
            if Zmoor > 0 
                warning('Zmoor is considered to have negative value in this program.');
                obj.Zmoor = -Zmoor;
            end
            obj.CenterMass = obj.Length*(0.79);            
        end
        [Z_node] = ZpositionCalc(obj,NumberOfNodes);
        TetherLength = TetherLengthCalc(obj,SeaDepth);
    end
    
end