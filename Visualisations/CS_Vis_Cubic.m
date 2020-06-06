%%                                  *** Definitions ***
% to ensure RD is north, TD is east and ND is out of plane for pole figures
setMTEXpref('xAxisDirection','north');
setMTEXpref('zAxisDirection','intoPlane');

%% Define crystal symmetry and shape
CS = (crystalSymmetry('m-3m', [3.192 3.192 3.192], 'mineral', 'Titanium cubic', 'color', 'blue'));
cShape = crystalShape.cube(CS)

%% Define pole figures to plot
pfs=[Miller(0,0,1,CS), Miller(1,1,0,CS), Miller(1,1,1,CS), Miller(1,1,2,CS)]; 

%%                                 *** Cubic Orientation ***

%% Define cubic orientations that you want to visualise
% by Euler
% ori_cub = orientation.byEuler(0*degree,0*degree,0*degree,CS)

% or by Miller 
ori = orientation.byMiller([1,1,2],[1,1,0],CS)

%% Plot interactive cubic crystal orientation schematic
figure()
plot(cShape * 10) % ignore
hold on
plot(ori * crystalShape.cube(CS))
arrow3d(0.5*[vector3d.X,vector3d.Y,vector3d.Z],'labeled')  % include flag 'labeled' to visualise xyz vectors
text3(vector3d.X,'RD')
text3(vector3d.Y,'TD')
text3(vector3d.Z,'ND')
hold off

%% Plot pole figures 

figure()
plotPDF(ori,pfs,'antipodal','MarkerSize',20); 

%%                              Plot orientations in Euler space

% To obtain Euler angles of an orientation in euler space (that was defined
% as Miller indices, plot in 3D euler space and select data curser. Click
% on orientation for euler angles. 

VisOriCub(ori,CS)
