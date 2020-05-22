%% Calculate a list of grains, remove small grains and smooth boundaries

% Select which data to include for grains calculation: 
% - 'Indexed' = all indexed phases
% - 'Titanium cubic' = just the beta phase
% - 'Ti-hex' = just the alpha phase

ebsd = ebsd('Indexed');
ebsd = ebsd('Titanium cubic'); 
ebsd = ebsd('Ti-hex');

%% Calculate the list of grains

% Calculate the grains and assign to a variable named 'grains' -
% set misorientation threshold for calculation i.e. 10*degree

[grains, ebsd.grainId, ebsd.mis2mean] = calcGrains(ebsd,'angle',10*degree);

%% Clean the ebsd data

% Remove ebsd data that contributes to small grains 
ebsd(grains(grains.grainSize<=5)) = [];

%% Clean the grains list

% Remove grains from the grain list that constitute small grains
grains(grains.grainSize<=5) = [];

%% Recalculate grains

% Recalculate the list of grains from the cleaned ebsd data set
[grains, ebsd.grainId, ebsd.mis2mean] = calcGrains(ebsd('indexed'),'angle',10*degree);

%% Smooth  grain boundaries

% smooth grain boundaries to remove 'stepped' effect
grains = smooth(grains,2)