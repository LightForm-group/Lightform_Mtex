%% Import Script for EBSD Data

% Check which phase is which by opening your ebsd file.

%% Specify Crystal and Specimen Symmetries

% crystal symmetry
CS = {... 
  'notIndexed',...
  crystalSymmetry('6/mmm', [3 3 4.7], 'X||a*', 'Y||b', 'Z||c*', 'mineral', 'Ti-Hex', 'color', [0.53 0.81 0.98]),...
  crystalSymmetry('m-3m', [3.2 3.2 3.2], 'mineral', 'Titanium cubic', 'color', [0.56 0.74 0.56])};

% plotting convention
setMTEXpref('xAxisDirection','east');
setMTEXpref('zAxisDirection','intoPlane');

%% Specify File Names

% path to files
pname = '';

% which files to be imported
fname = [pname ''];

%% Import the Data

% create an EBSD variable containing the data
ebsd = EBSD.load(fname,CS,'interface','crc',...
  'convertEuler2SpatialReferenceFrame');
% ebsd = reduce(ebsd); % uncomment this to reduce the size of your file

%% rotate the orientation data but not the spatial data

rot=rotation('Euler', 0*degree, 0*degree, 0*degree);
ebsd=rotate(ebsd,rot,'keepXY'); % 'keepXY' allows you to apply a rotation to your orientation data without changing the spatial data

RD = vector3d.X;
TD = vector3d.Y;
ND = vector3d.Z;

%% ebsd IPF

%% grains IPF 

%% Pole Figure

% plotting convention

%% PF Cubic

%% ODF
 