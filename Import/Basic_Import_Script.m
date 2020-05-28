%% Import Script for EBSD Data

%% Specify Crystal and Specimen Symmetries

% crystal symmetry
CS = {... 
  'notIndexed',...
  crystalSymmetry('6/mmm', [3 3 4.7], 'X||a*', 'Y||b', 'Z||c*', 'mineral', 'Ti-Hex', 'color', [0.53 0.81 0.98]),...
  crystalSymmetry('m-3m', [3.2 3.2 3.2], 'mineral', 'Titanium cubic', 'color', [0.56 0.74 0.56])};

% plotting convention
setMTEXpref('xAxisDirection','east');
setMTEXpref('zAxisDirection','outOfPlane');

%% Specify File Names

% path to files
pname = '/Users/nicholasbyres/Documents/MATLAB/My Matlab/Lightform_Mtex/Data';

% which files to be imported
fname = [pname '/Sample.cpr'];

%% Import the Data

% create an EBSD variable containing the data
ebsd = EBSD.load(fname,CS,'interface','crc',...
  'convertEuler2SpatialReferenceFrame');

%% rotate the orientation data but not the spatial data

rot=rotation('Euler', 90*degree, 0*degree, 0*degree);
ebsd=rotate(ebsd,rot,'keepXY'); % 'keepXY' allows you to apply a rotation to your orientation data without changing the spatial data

RD = vector3d.X;
TD = vector3d.Y;
ND = vector3d.Z;

%% ebsd IPF
IPF_map(ebsd, 'Ti-Hex', RD)
IPF_map(ebsd, 'Titanium cubic', RD)

%% Calculate a list of grains
[grains, ebsd.grainId, ebsd.mis2mean] = calcGrains(ebsd,'angle',10*degree);

%% Plot the grains
IPF_grains_map(grains, 'Ti-Hex', RD)
IPF_grains_map(grains, 'Titanium cubic', RD)

%% Clean data by removing small grains - noise
ebsd = clean_grains(ebsd, grains, 3);

%% Recalculate the grains from the cleaned ebsd data set
[grains, ebsd.grainId, ebsd.mis2mean] = calcGrains(ebsd,'angle',10*degree);

%% Plot the cleaned grains IPF 
IPF_grains_map(grains, 'Ti-Hex', RD)
IPF_grains_map(grains, 'Titanium cubic', RD)

%% Smooth grain boundaries
grains = smooth(grains,3)

%% Plot the smoothed grains
IPF_grains_map(grains, 'Ti-Hex', RD)
IPF_grains_map(grains, 'Titanium cubic', RD)

%% Pole Figure
% plotting convention
setMTEXpref('xAxisDirection','north');
setMTEXpref('zAxisDirection','intoPlane');

%% PF Cubic

figure();
ori=ebsd('Titanium cubic').orientations;
x=[Miller(0,0,1,ori.CS), Miller(1,1,0,ori.CS), Miller(1,1,1,ori.CS)]; % include hkil figures here
plotPDF(ori,x,'antipodal', 'contourf', 1:2:14.0, 'minmax', 'colorRange',[0,14]); % plot with contouring
mtexColorbar ('location','southOutSide','title','mrd'); % to move the colour bar to below and include a title

%% ODF

% Compute optimal halfwidth from the meanorientations of grains...
psi = calcKernel(ebsd('Titanium cubic').orientations);
HALF_WIDTH = psi;
 
% Plot ODF 
figure();
ori = ebsd('Titanium cubic').orientations;'kernel';psi;
ori.SS = specimenSymmetry('orthorhombic');
odf = calcDensity(ori);
plot(odf,'phi2',45*degree,'antipodal','linewidth',1,'colorbar','cs','ss','minmax','contourf',0:1:10,'colorRange',[0,10]);  