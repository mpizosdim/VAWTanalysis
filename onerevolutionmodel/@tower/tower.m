classdef tower < handle 
   properties
       Height % height of the tower
       Radius % radius of the tower
       Mass
       Inertia
       CenterMass
       CenterOfThrust
   end
   
   methods
       function obj = tower(Mass,Height,Radius,Inertia)
           obj.Mass = Mass;
          obj.Height = Height;
          obj.Radius = Radius;
          obj.Inertia = Inertia;
          obj.CenterMass = (1/2)*Height;
          obj.CenterOfThrust = (1/3)*Height;
       end
       
   end
end