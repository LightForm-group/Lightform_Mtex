function IPF_hex(ebsd, symmetry, axis)
% Plot EBSD data with IPF colours, crystal-symmetry must be hexagonal
% ebsd_map is the map to plot.
% Symmetry is the crystal symmetry e.g. "Ti-Hex", "Titanium cubic".
% Axis is, "x", "y", or "z".

if axis == "x"
    vector = xvector;
elseif axis == "y"
    vector = yvector;
elseif axis == "z"
    vector = zvector;
else
    throw(MException('Unknown axis type %s. Use "x", "y" or "z".',axis));
end

figure();
% Select the phase to be plotted
oM = ipfHSVKey(ebsd(symmetry));
% Select the axis to be plotted
oM.inversePoleFigureDirection = vector;
% Select the colour map to use in the plot
color = oM.orientation2color(ebsd(symmetry).orientations);
% plot the IPF
plot(ebsd(symmetry),color);

