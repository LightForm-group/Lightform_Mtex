function ebsd = clean_grains(ebsd, grains, grain_size);

% ebsd is the ebsd data set to be cleaned
% grains is the list of grains previosuly calculated from the ebsd data set
% to be cleaned
% grain_size is the size of grains (in pixels) to be removed from the ebsd
% data set

ebsd(grains(grains.grainSize<=grain_size)) = [];
end