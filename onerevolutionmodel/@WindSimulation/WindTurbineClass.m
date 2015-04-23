function obj =WindTurbineClass(obj)


switch obj.Class
    case 'AI'
        obj.Class.Vref = 50;
        obj.Class.Iref = 0.16;
    case 'AII'
        obj.Class.Vref = 42.5;
        obj.Class.Iref = 0.16;
    case 'AIII'
        obj.Class.Vref = 37.5;
        obj.Class.Iref = 0.16;
    case 'BI'
        obj.Class.Vref = 50;
        obj.Class.Iref = 0.14;
    case 'BII'
        obj.Class.Vref = 42.5;
        obj.Class.Iref = 0.14;
    case 'BIII'
        obj.Class.Vref = 37.5;
        obj.Class.Iref = 0.14;
    case 'CI'
        obj.Class.Vref = 50;
        obj.Class.Iref = 0.12;
    case 'CII'
        obj.Class.Vref = 42.5;
        obj.Class.Iref = 0.12;
    case 'CIII'
        obj.Class.Vref = 37.5;
        obj.Class.Iref = 0.12;
end

