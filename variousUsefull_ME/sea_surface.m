function [s,Tp,fm,B,SK,kx,ky] = sea_surface(x,y,wind_data,type,spreading);

%
% SEA_SURFACE: generates sea surface realizations for a given intensity,   
% fetch, and direction of wind velocity. 
% 
% Usage:  [s,Tp,fm,B,Sk,kx,ky] = sea_surface(x,y,wind_data,type,spreading)
% 
%  where x and y are vectors defining the surface grid, wind_data is a structure containing 
%  the intensity, direction and fetch of the wind speed, type describes the spectrum and spreading 
%  is a string defining the angular spreading of the sea surface spectrum 
%  ('none' for no spreading, 'cos2' for cosine-squared spreading, 'mits' 
%  for Mitsuyasu spreading and 'hass' for Hasselmann spreading). The 
%  output is a matrix s (size(s) = [length(y) length(x)]), the peak period 
%  Tp, the peak frequency fm, the sea state B, the spectrum Sk and the wavenumber 
%  vector arguments kx and ky, which define the grid of Sk.
% 
%  Examples: 
%  nx = 101; xmin = 0; xmax = 100; x = linspace(xmin,xmax,nx); 
%  ny =  51; ymin = 0; ymax =  50; y = linspace(ymin,ymax,ny);
%  wind_data.U = 10; wind_data.thetaU = 0; wind_data.X = 1e6;   
%  [s,Tp,fm,B,Sk,kx,ky] = sea_surface(x,y,wind_data,'PM','none');
%  figure(1)
%  subplot(211),mesh(x,y,s),ylabel('y(m)'),xlabel('x(m)') 
%  subplot(212),mesh(kx,ky,Sk),ylabel('ky (1/m)'),xlabel('kx (1/m)') 
%  [s,Tp,fm,B,Sk,kx,ky] = sea_surface(x,y,wind_data,'PM','cos2');
%  figure(1)
%  subplot(211),mesh(x,y,s),ylabel('y(m)'),xlabel('x(m)') 
%  subplot(212),mesh(kx,ky,Sk),ylabel('ky (1/m)'),xlabel('kx (1/m)') 
%  [s,Tp,fm,B,Sk,kx,ky] = sea_surface(x,y,wind_data,'PM','mits');
%  figure(1)
%  subplot(211),mesh(x,y,s),ylabel('y(m)'),xlabel('x(m)') 
%  subplot(212),mesh(kx,ky,Sk),ylabel('ky (1/m)'),xlabel('kx (1/m)') 
%  [s,Tp,fm,B,Sk,kx,ky] = sea_surface(x,y,wind_data,'PM','hass');
%  figure(1)
%  subplot(211),mesh(x,y,s),ylabel('y(m)'),xlabel('x(m)') 
%  subplot(212),mesh(kx,ky,Sk),ylabel('ky (1/m)'),xlabel('kx (1/m)') 
% 
% References:
% 1) Directional wave spectra observed during JONSWAP 1973 
%    D. E. Hasselmann et al. 1980 
% 2) Directional wave spectra using cosine-squared and cosine 2s 
%    spreading functions 
%    Coastal Engineering Technical Note 1985 
% 3) Fourier Synthesis of Ocean Scenes 
%    Gary A. Mastin et al. 1987 
% 4) The generation of a time correlated 2d random process for ocean 
%    wave motion
%    L. M. Linnet et al. 1997    
% 5) Acoustic wave scattering from rough sea surface and sea bed 
%    Chen-Fen Huang, Master Thesis. 1998 
% 6) Tutorial 2: Ocean Waves (1)
%    http://www.naturewizard.com 
% 7) matlabwaves.zip 
%    http://neumeier.perso.ch/matlab/waves.html

%***************************************************************************************
% First  version: 30/07/2008
% First update  : 14/10/2009 => match with Beaufort scale
% Second update : 25/01/2010 => returns sea state 
% Third  update : 30/03/2010 => JONSWAP spectrum 
% 
% Contact: orodrig@ualg.pt
% 
% Any suggestions to improve the performance of this 
% code will be greatly appreciated. 
% 
%***************************************************************************************
s   = []; 
Sk  = s; 
Tp  = s; 
fm  = s;
B   = s;  
kx  = s;
ky  = s;

     U = wind_data.U; 
thetaU = wind_data.thetaU;

if U == 0
s = zeros(ny,nx);
return
end 

B = fix( ( U/0.836 )^(2/3) );  

imunit = sqrt( -1 ); 

g     = 9.80665; 
gxg   = g*g;
UxU   = U*U;
alpha = 8.1e-3;

nx = length( x );
ny = length( y );

%======================================================================
% Surface generation: 
% since most expressions for the spectrum are given in the frequency 
% domain we need to convert wavenumbers to frequencies, apply the formulas 
% and go back to the wavenumber domain:

dx = x(2) - x(1);
kxmax = 1/( 2*dx );
kx = linspace(-kxmax,kxmax,nx);
dy = y(2) - y(1);
kymax = 1/( 2*dy );
ky = linspace(-kymax,kymax,ny);
[Kx,Ky] = meshgrid(kx,ky);
K = sqrt( Kx.^2 + Ky.^2 ); 
F = sqrt( g*K )/( 2*pi ); % Valid for surface waves over deep oceans
F( F == 0 ) = Inf ; 
K( K == 0 ) = Inf ;  
dFdK = sqrt( g./K )/( 4*pi );
OMEGA = 2*pi*F;

%======================================================================   
%  Calculate the spectrum in the frequency domain:   

if type == 'PM'
fm = 0.13*g/U;
Tp = 1/fm; 
SF = alpha*gxg/( (2*pi)^4 )*( F.^(-5) ).*exp( -5/4*( fm./F ).^4 );
elseif type == 'JS'
X       = wind_data.X; 
OMEGAp  = 7*pi*( g/U )*( g*X/UxU )^(-0.33);
fm      = OMEGAp/( 2*pi ); 
Tp      = 2*pi/OMEGAp; 
cgamma  =  3.3;
csigma0 = 0.07*ones( size( OMEGA ) );
indexes = find( OMEGA > OMEGAp ); 
csigma0( indexes ) = 0.09; 
calpha = 0.076*( g*X/U )^(-0.22); 
delta = exp( -( ( OMEGA - OMEGAp ).^2 )./( 2*csigma0.^2*OMEGAp^2 ) );
SF = calpha*gxg*OMEGA.^(-5).*( exp( -(5/4)*( OMEGA/OMEGAp ).^(-4) ) ).*( cgamma.^( delta ) );
else
disp('Unknown spectrum type...')
end 
%======================================================================   
%  Convert spectrum from frequency domain to wavenumber domain:

SK = SF.*dFdK;

%======================================================================
%  A real sea surface requires a symmetric spectrum in the wavenumber 
%  domain; thus, wherever required, additional calculations will ensure
%  that the spreading matrix is indeed symmetrical:

THETA = angle( Kx+imunit*Ky ) - thetaU;

switch spreading
   
case 'none' % no spreading 
        
     D = ones(size(K)); 
   
case 'cos2' % cosinus-squared spreading
        
     D = cos( THETA ).^2;
        
case 'mits' % Mitsuyasu spreading

     ss = 9.77*( F/fm ).^(-2.5);
     indexes1 = ( F < fm );
     ss( indexes1 ) = 6.97*( F(indexes1)/fm ).^5; 
     Nss = gamma( ss + 1 )./( 2*sqrt(pi)*gamma( ss + 0.5 ) );
     D = ( ( cos( THETA/2 ).^2 ).^(ss) ).*Nss;
     D = D + fliplr( flipud( D ) );
        
case 'hass' % Hasselmann spreading
        
     Mu = 4.06*ones( size(K) );
     indexes1 = ( F > fm ); 
     Mu( indexes1 ) = -2.34; 
     pp = 9.77*( F/fm ).^Mu;
     Npp = pi*2.^( 1 - 2*pp ).*gamma( 2*pp + 1 )./( gamma( pp + 1 ) ).^2;
     D = cos( THETA/2 ).^(2*pp)./Npp;
     D = ( ( cos( THETA/2 ).^2 ).^pp )./Npp;
     D = D + fliplr( flipud( D ) );

otherwise
   
     disp('Unknown sea surface spreading.')
   
end

%======================================================================
% Get the power spectrum: 
   
D = D/max( D(:) )*2/pi; % spreading normalization
SK = SK.*D;             % power spectrum(k,theta) = spectrum(k)*spreading(theta) 

%======================================================================   
% Get the surface realization from the spectrum: 

white_noise     = unifrnd(-127,127,ny,nx)/127;
WHITE_NOISE     = fft2( white_noise );
NOISE_amplitude =  abs( WHITE_NOISE );

NOISE_energy = sum( WHITE_NOISE(:).^2 );
WHITE_NOISE  = WHITE_NOISE/NOISE_energy; 

centered_WHITE_NOISE = fftshift( WHITE_NOISE );
NOISE_phase = angle( centered_WHITE_NOISE );

% Modulate noise amplitude with the power spectrum: 
NOISE_amplitude = NOISE_amplitude .* SK;

% Randomize modulated noise in the wavenumber space combining 
% modulated amplitudes with original phases: 
NOISE_ipart = NOISE_amplitude .* sin( NOISE_phase );
NOISE_rpart = NOISE_amplitude .* cos( NOISE_phase );

filtered_NOISE = NOISE_rpart + imunit*NOISE_ipart;
filtered_NOISE = fftshift( filtered_NOISE );

% Get the 2D surface through an inverse fft:  
s = ifft2( filtered_NOISE );
s = real( s );
average_height = ( max(s(:)) - min(s(:)) )/2; 

%Beaufort scale (according to Wikipedia): 
velocities   = [0 0.3 1.5 3.3 5.5 8.0 11.0 14.0 17.0 20.0 24 28.0 32];
wave_heights = [0 0   0.2 0.5 1.0 2.0  3.0  4.0  5.5  7.5 10 12.5 16];

if U > max(velocities)
   wave_height = 16; % I guess this really should be a very large wave... 
elseif U <= 0.3; 
   wave_height = 0;
else 
   wave_height = interp1(velocities,wave_heights,U);
end 

if average_height > 0
s = wave_height*s/average_height;
else
s = 0*s; 
end  

