function IPF_grains_map(grains, symmetry, axis)
% Plot mean orientation of grains with IPF colours,
% grains is the list of grains to plot
% Symmetry is the crystal symmetry e.g. "Ti-Hex", "Titanium cubic"
% Axis is RD, TD or ND which must previously have been defined using Define_Vectors.

% create new figure
figure();
% Define the colour key
ipfKey = ipfColorKey(grains(symmetry));
% Define the IPF direction 
ipfKey.inversePoleFigureDirection = axis;
% Assign the orientataions to the colour key
color = ipfKey.orientation2color(grains(symmetry).meanOrientation);
% plot the mean orientation of the calculated grains in defined colour key
plot(grains(symmetry),color);
end
