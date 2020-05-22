% Compute optimal halfwidth from the meanorientations of grains...
psi = calcKernel(ebsd('Titanium cubic').orientations);
HALF_WIDTH = psi;
 
% Plot ODF 
figure();
ori = ebsd('Titanium cubic').orientations;'kernel';psi;
ori.SS = specimenSymmetry('orthorhombic');
odf = calcDensity(ori);
plot(odf,'phi2',45*degree,'antipodal','linewidth',1,'colorbar','cs','ss','minmax','contourf',0:1:10,'colorRange',[0,10]); 


%% You can make these folowing changes in the code above

% change the phase to the phase you are interested in
% indicate the ODF sections to plot eg [0, 15, 30, 45]*degree
% 'colorRange',[0,16] - add this in to control the colour bar range

