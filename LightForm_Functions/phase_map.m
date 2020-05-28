function phase_map(data,crystal_sym)

plot(data(crystal_sym));

end

% input argument data can be of type ebsd or grains
% crystal_sym can be any of the phases in your ebsd data set or 'Indexed'
% to plot all the phases at the same time
