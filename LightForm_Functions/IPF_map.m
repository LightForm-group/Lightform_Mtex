function IPF_map(ebsd, symmetry, axis)
% Plot ebsd data of any phase in IPF colours of any direction.
% ebsd is the ebsd data set to plot.
% Symmetry is the crystal symmetry e.g. "Ti-Hex", "Titanium cubic".
% Axis is, RD, TD, or ND which must previously have been defined using Define_Vectors.

% create new figure
figure();
% Define the colour key
oM = ipfHSVKey(ebsd(symmetry));
% Define the IPF direction 
oM.inversePoleFigureDirection = axis;
% Assign the orientataions to the colour key
colour = oM.orientation2color(ebsd(symmetry).orientations);
% plot the ebsd data in defined colour key
plot(ebsd(symmetry),colour);
end

