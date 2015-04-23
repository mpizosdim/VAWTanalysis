%% Basic Function Purpose - Organizing Vector Data In A 3D Surface Form

x = 1:50;
y = 1:50;
z = sin(x) + cos(y);

x = x';
y = y';
z = z';

figure
plot3(x,y,z,'.b');
grid on
title('Actual Data Points In 3D Space For Demonstration 1/2');

[x_3d,y_3d,z_3d] = vecsurf(x,y,z);

figure
surf(x_3d,y_3d,z_3d)
colormap(jet(256))
camlight right
lighting phong
title(sprintf('Demonstration 1:\nBasic Function Purpose - Organizing Vector Data In A 3D Surface Form'));

%% Function Option - Comeplete Missing Data In The 3D Surface Using The Mosaic Picture Option

x = 1:50;
y = 1:50;
z = sin(x) + cos(y);

x = x';
y = y';
z = z';

[x_3d,y_3d,z_3d] = vecsurf(x,y,z,'MosaicPicture');

figure
surf(x_3d,y_3d,z_3d)
colormap(jet(256))
camlight right
lighting phong
title(sprintf(['Demonstration 2:\nComeplete Missing Data In The 3D\n' ...
               'Surface Using The Mosaic Picture Option']));

clear 

x =-8:0.5:8;
y =x';
[xi,yi] = meshgrid(x,y);
r = sqrt(xi.^2+yi.^2)+eps;
zi= sin(r)./r;

X(1,1:33) = xi(1:33,17);
Y(1,1:33) = yi(1:33,17);
Z(1,1:33) = zi(1:33,17);

X(1,34:66) = xi(17,1:33);
Y(1,34:66) = yi(17,1:33);
Z(1,34:66) = zi(17,1:33);

x = X';
y = Y';
z = Z';

figure
plot3(x,y,z,'.r');
title('Actual Data Points In 3D Space For Demonstration 3');
grid on

[x_3d,y_3d,z_3d] = vecsurf(x,y,z,'MosaicPicture');

figure
surf(x_3d,y_3d,z_3d);
colormap(hsv(256))
camlight right
lighting phong
title(sprintf(['Demonstration 3:\nComeplete Missing Data In The 3D\n' ...
               'Surface Using The Mosaic Picture Option']));

%% Function Option - 1)Adding Extra Grid Points Using Mosaic Grid Points Option
%                  -  2)Adding A value Boundry To The Extra Grid Points
%                  -  Using Mosaic Grid Points Value Boundry

clear

x = linspace(-1.5,1.5,50);
y(1,1:50) = 0;
z = exp(-(x.^2));

x = x';
y = y';
z = z';

figure
plot3(x,y,z,'.g');
grid on
title('Actual Data Points In 3D Space For Demonstration 4/5');
xlabel('Dimension One');
ylabel('Dimension Tow');

[x_3d,y_3d,z_3d] = vecsurf(x,y,z,'MosaicPicture','SecGridPoints',50);

figure
surf(x_3d,y_3d,z_3d);
xlabel('Dimension One');
ylabel('Dimension Tow');
colormap(hot(256));
camlight(-40,30)
lighting phong;
shading interp
title(sprintf(['Demonstration 4:\nAdding Extra Grid Points Using Mosaic Grid Points Option.\n ' ...
               'Adding Extra Grid Points To The Second Dimension Hence That A 3D Surface Has\n' ...
               'To Have At Least Tow Grid Points For Each Of The First And Second Dimensions.']));
           

 [x_3d,y_3d,z_3d] = vecsurf(x,y,z,'MosaicPicture','SecGridPoints',50,'SecBoun',[-0.5,0.5]);

figure
surf(x_3d,y_3d,z_3d);
xlabel('Dimension One');
ylabel('Dimension Tow');
colormap(winter);
camlight(-40,30)
shading interp
title(sprintf(['Demonstration 5:\nAdding A value Boundry To The Extra Grid Points\n' ...
               ' Using Mosaic Grid Points Value Boundry -\n' ...
               'Value Boundry: [-0.5,0.5]']));

 
 %% Function Option - Saving Time With Larg Calculations Using Representational Three Dimensional Surface Option
 %                  - Using Progress Option To See Function Progress 
 %                  - Using Smooth Option To Create A Smooth Surface
 
clear

x = linspace(-3,3,1000000);

f = exp(-(x.^2));
X = x(1,1:1000000);
Y(1,1:1000000) = 0;
X(1,1000001:2000000) = 0;
Y(1,1000001:2000000) = x(1,1:1000000);
Z(1,1:1000000) = f;
Z(1,1000001:2000000) = f;

X = X';
Y = Y';
Z = Z';

figure
plot3(X,Y,Z,'.m');
grid on
title('Actual Data Points In 3D Space For Demonstration 6/7');

[x_3d,y_3d,z_3d] = vecsurf(X,Y,Z,'Representation',[60,60],'Progress');

figure
surf(x_3d,y_3d,z_3d);
colormap cool
title(sprintf(['Demonstration 6:\nSaving Time With Larg Calculations Using Representational\n' ...
               'Three Dimensional Surface Option. Using Progress Option To See Function Progress.\n' ....
               'For This Demonstration I Used 1000000 Sameples Of Data.']));
shading interp
lighting phong
light
% material shiny

[x_3d,y_3d,z_3d] = vecsurf(X,Y,Z,'Representation',[60,60],'Progress','Smooth',[2,2,1]);

figure
surf(x_3d,y_3d,z_3d);
colormap cool
title(sprintf(['Demonstration 7:\nWhen Representational Three Dimensional Surface Option\n' ...
               'Is Used, Smooth Option Can Be Used To Smoothness The Surface.']));

shading interp
lighting phong
light
material shiny

%% Function Option - Zoom In On Specific Parts Of The 3D Surface Without Losing Detail Using Representational Three
%                  - Dimensional Surface Grid Value Boundry
%                  - Using Plot Option To Make The Function Plot The Result

clear

n1 = 15;
n2 = 15;
theta = rand(n1,1)*pi/2;
r = rand(1,n2);

x = cos(theta)*r;
y = sin(theta)*r;
x=x(:);
y=y(:);

X = [[0 0 1 1]';x;x;1-x;1-x];
Y = [[0 1 0 1]';y;1-y;y;1-y];

Z = sin(4*X+5*Y).*cos(7*(X-Y))+exp(X+Y);

vecsurf(X,Y,Z,'Representation',[60,60],'Plot',1,'Smooth',[2,2,1]);

title(sprintf('Demonstration 8:\nUsing Plot Option To Make The Function Plot The Result.'));
colormap(hot(256))
camlight right
lighting phong

vecsurf(X,Y,Z,'Representation',[60,60],'Plot',1,'Smooth',[2,2,2],'RepOneBoun',[0.2,0.7],'RepSecBoun',[0.2,0.7]);

title(sprintf(['Demonstration 9:\n Zoom In On Specific Parts Of The 3D Surface Without Losing Detail\n' ...
               'Using Representational Three Dimensional Surface Grid Value Boundry.']));
colormap(hot(256))
camlight right
lighting phong
