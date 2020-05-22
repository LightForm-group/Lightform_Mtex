function IPF_cubic(grains, symmetry, axis)
% Plot EBSD data with IPF colours, crystal-symmetry must be hexagonal
% grains is the grains to plot
% Symmetry is the crystal symmetry e.g. "Ti-Hex", "Titanium cubic"
% Axis is, "x", "y", or "z"

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
ipfKey = ipfColorKey(grains(symmetry));
ipfKey.inversePoleFigureDirection = vector;
color = ipfKey.orientation2color(grains(symmetry).meanOrientation);
plot(grains(symmetry),color);
