function VisOriHex(ori,CS)

ori_ODF = ori;
ori_ODF.SS = specimenSymmetry('orthorhombic');


%% Create a set of orientations
rand_oris = orientation.rand(100000,CS);
rand_oris.SS = specimenSymmetry('orthorhombic');
oris_mil = rand_oris(angle(rand_oris,ori_ODF)<10*degree);
ODF_mil = calcDensity(oris_mil);

%%
% plot 3D euler space
figure();
plot3d(ODF_mil); % to plot miller indices orientation change to (ori_cub_mil)

%%
figure();
plot(ODF_mil,'phi2',[0 15 30 45 60]*degree);