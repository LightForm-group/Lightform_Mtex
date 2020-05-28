%% Import Script for EBSD Data

% This example script is written to demonstrate the importation of ebsd data
% and subsequent texture analysis - using the Lightform MTEX repository. The script
% has been written to work with the sample ebsd file included in the Data
% folder.

%% Specify Crystal Symmetries

% crystal symmetry
CS = {... 
  'notIndexed',...
  crystalSymmetry('m-3m', [3.2 3.2 3.2], 'mineral', 'Titanium cubic', 'color', [0.56 0.74 0.56]),...
  crystalSymmetry('6/mmm', [3 3 4.7], 'X||a*', 'Y||b', 'Z||c*', 'mineral', 'Ti-Hex', 'color', [0.53 0.81 0.98])
};

% plotting convention
setMTEXpref('xAxisDirection','east');
setMTEXpref('zAxisDirection','intoPlane');

%% Specify File Names

% path to files
pname = '/Users/nicholasbyres/Documents/MATLAB/My Matlab/Lightform_Mtex/Data/';

% which files to be imported
fname = [pname 'Sample.cpr'];

%% Import the Data

% create an EBSD variable containing the data
ebsd = EBSD.load(fname,CS,'interface','crc',...
  'convertEuler2SpatialReferenceFrame');

%% Rotate the orientation data but not the spatial data

rot=rotation('Euler', 90*degree, 0*degree, 0*degree);
ebsd=rotate(ebsd,rot,'keepXY'); % 'keepXY' allows you to apply a rotation to your orientation data without changing the spatial data

%% Define the vectors as directions

RD = vector3d.X;
TD = vector3d.Y;
ND = vector3d.Z;

%% Plot IPF maps of the raw ebsd data

% pass the following arguments: ebsd, crystal symmetry and IPF direction
IPF_map(ebsd, 'Ti-Hex', RD)
IPF_map(ebsd, 'Titanium cubic', RD)

%% Grains - calculate a list of grains that contains new information about the data

% after the grains have been calculated, each ebsd data point will have an
% associated grain id. Each grain in the list will be also possess new
% attributes that did not exist before the calcGrains command was executed.

[grains, ebsd.grainId, ebsd.mis2mean] = calcGrains(ebsd,'angle',10*degree);

%% Plot the mean orientation of each grain in IPF colours

IPF_grains_map(grains, 'Ti-Hex', RD)
IPF_grains_map(grains, 'Titanium cubic', RD)

%% Clean the data by removing grains of a specific size

% pass the following arguments: ebsd, grains and grain size (in number of
% pixels) to be removed from the ebsd data set
ebsd = clean_grains(ebsd, grains, 3);

%% Recalculate the list of grains from the cleaned ebsd data set 

%Plotting a cubic map requires caluclating the grains first.
[grains, ebsd.grainId, ebsd.mis2mean] = calcGrains(ebsd,'angle',10*degree);

%% Plot the newly calculated "clean" grains 
IPF_grains_map(grains, 'Ti-Hex', RD)
IPF_grains_map(grains, 'Titanium cubic', RD)

%% Smooth grain boundaries to remove stepped effect
grains = smooth(grains,2)

%% Plot the grains with smooth boundaries
IPF_grains_map(grains, 'Ti-Hex', RD)
IPF_grains_map(grains, 'Titanium cubic', RD)

%% Pole Figure
% set the plotting convention
setMTEXpref('xAxisDirection','north');
setMTEXpref('zAxisDirection','intoPlane');

%% Plot PF Alpha

figure();
ori=ebsd('Ti-Hex').orientations;
x=[Miller(0,0,0,1,ori.CS), Miller(1,0,-1,0,ori.CS), Miller(1,1,-2,0,ori.CS)]; % include hkil figures here
plotPDF(ori,x,'antipodal', 'contourf', 1:2:10.0, 'minmax', 'colorRange',[0,10]); % plot with contouring
mtexColorbar ('location','southOutSide','title','mrd'); % to move the colour bar to below and include a title

%% PF Cubic

figure();
ori=ebsd('Titanium cubic').orientations;
x=[Miller(0,0,1,ori.CS), Miller(1,1,0,ori.CS), Miller(1,1,1,ori.CS)]; % include hkil figures here
plotPDF(ori,x,'antipodal', 'contourf', 1:2:10.0, 'minmax', 'colorRange',[0,10]); % plot with contouring
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