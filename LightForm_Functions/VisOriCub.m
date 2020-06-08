function VisOriCub(ori,CS)

% change specimen symmetry for ODF plots in Euler space
ori.SS = specimenSymmetry('orthorhombic');

% Calculate ODF
ODF = calcDensity(ori);

%%
% plot 3D euler space
figure();
plot3d(ODF); % to plot miller indices orientation change to (ori_cub_mil)

%%
figure();
plot(ODF,'phi2',45*degree);
end