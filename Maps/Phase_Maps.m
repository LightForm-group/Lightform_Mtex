%% Plot phase data

% Comment out unwanted figures - for grains a list of grains must have been
% calculated first, using calcGrains command or calculate grains script

%% From ebsd data

figure()
plot(ebsd('Indexed'))

figure()
plot(ebsd('Ti-Hex'))

figure()
plot(ebsd('Titanium cubic'))

%% From grains list

figure()
plot(grains('Indexed'))

figure()
plot(grains('Ti-Hex'))

figure()
plot(grains('Titanium cubic'))
