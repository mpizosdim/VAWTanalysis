# VAWTanalysis
VAWT analysis
A graphical user interface tool to simulate the aerodynamics and the motion of offshore vertical axis wind turbine. MATLAB is used for the simulations.

![alt tag](https://github.com/mpizosdim/VAWTanalysis/blob/master/GUIimage.png)

The GUI is divided in three input blocks and two output blocks. The three input blocks
consist of:

*the simulation inputs block, where the user can choose the following:
 *the number of nodes of the blade in the vertical dimension as well as the 
  which is the degree at which the simulator makes two consecutive calculations
  for the DMS model.
 *the option of using streamtube expansion (described in section 2.3). Calculations
  in this option are slightly more computational expensive.
 *the total time of the simulation as well as the initial removal of time in order
to avoid start-up transients in the frequency and in the statistical analysis.
 *dynamic stall model. The user can choose between: Gormont’s model, adaptation
of Strickland, adaption of Paraschivoiu and modification of Berg.
 *the initial position of the turbine.
 *the option to choose between combined or sole enviromental conditions. For
example, a simulation with only steady wind conditions as well as combined
turbulent wind condition with irregular waves is feasible.
 *the option to choose whether the gyroscopic effect will be included in the
simulation.

*the environmental conditions block, where the user can choose the following:
 *the wind velocity at the equator along with the wind shear exponent that
governs the wind as well as the wave conditions of the simulation time (Hs,
Tp and sea depth).
 *the option to use turbulent wind and along with it the intensity value.
 *the option to generate a gust, in a specified time domain of the simulation,
in order to observe the motion of the turbine in these extreme conditions.
 *the option to generate multiple tables at different wind velocities, containing
the interference factors of one revolution in order for them to be used later
in the coupled simulation.

*the wind turbine panel, where the user can define various design characteristics
for:
 *the blade such as the type of the airfoil, the length of the chord and the blade
mass
 *the geometry and the design of the rotor. The user can choose between: Htype,
V-type, Sandia type, ideal Troposkien or the option to load a custom
geometry file and also the rotational speed of the rotor.
 *the floater characteristics, such as the type of the floater (buoy, TLP), the
mass and radius as well as the tower characteristics.

Concerning the outputs, a panel that analyzes the statistics of the global motion is
presented, where the user can observe the mean and standard deviation of the motion
for different degrees of freedom. Furthermore, through the menu button ‘Results’, the
following outputs can be observed in plots:
*in time domain, where the surge, sway, pitch and roll displacement are illustrated
in with respect to the total simulation time. Furthermore, the aerodynamic forces
acting on the rotor can be plotted with respect to a time frame specified by the
user. The plan view of the turbine is also available in time domain.
*in frequency domain, where the power spectra of the output results can be
viewed. The analysis is done by excluding the initial simulation, where the user
can choose how much this time is.
*the DMS results, such as the thrust and normal coefficient as well as the interference
factor and angle of attack for one revolution per azimuthal angle.
*the environmental conditions, which include time series of the wind velocity,
the wave velocity and the water elevation in between the simulated time.
*the matrix values of the equation of motion. In other words, the option to output
the mass matrix, the added mass matrix and the restoring matrix as well as the
buoyancy force for the TLP design.

The results can be saved in .mat format and loaded again with full functionality offered
by the result outputs menu. Furthermore, a status panel exists in order to provide useful information concerning the loading time of the simulation.

For more info contact me at dimitrisbizopoulos@gmail.com



