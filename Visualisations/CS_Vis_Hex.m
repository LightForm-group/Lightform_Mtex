%%                                  *** Definitions ***
% to ensure RD is north, TD is east and ND is out of plane for pole figures
setMTEXpref('xAxisDirection','north');
setMTEXpref('zAxisDirection','intoPlane');

%% Define crystal symmetry and shape
CS = (crystalSymmetry('6/mmm', [2.954 2.954 4.729], 'X||a*', 'Y||b', 'Z||c*', 'mineral', 'Ti-Hex', 'color', 'cyan'))
cShape = crystalShape.hex(CS)

%% Define pole figures to plot
pfs = [Miller(0,0,0,1,CS), Miller(1,1,-2,0,CS), Miller(1,0,-1,0,CS)]; 

%%                                 *** Hex Orientation ***

%% Define hex orientations that you want to visualise
% from euler angles
% ori = orientation.byEuler(0*degree,0*degree,0*degree,CS)

%% from miller indices
ori = orientation.byMiller([0,0,0,1],[1,0,-1,0],CS)

%% Plot interactive hex crystal orientation schematic
figure()
plot(cShape * 10);
hold on
plot(ori * crystalShape.hex(CS)) 
arrow3d(0.5*[vector3d.X,vector3d.Y,vector3d.Z],'labeled') % include flag 'labeled' to visualise xyz vectors
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

VisOriHex(ori,CS)