% Plot EBSD data with IPF colours - maps X, Y and Z - Hex

figure();
oM = ipfHSVKey(ebsd('Ti-Hex'));
oM.inversePoleFigureDirection = xvector;
color = oM.orientation2color(ebsd('Ti-Hex').orientations);
plot(ebsd('Ti-Hex'),color);

figure();
oM = ipfHSVKey(ebsd('Ti-Hex'));
oM.inversePoleFigureDirection = yvector;
color = oM.orientation2color(ebsd('Ti-Hex').orientations);
plot(ebsd('Ti-Hex'),color);

figure();
oM = ipfHSVKey(ebsd('Ti-Hex'));
oM.inversePoleFigureDirection = zvector;
color = oM.orientation2color(ebsd('Ti-Hex').orientations);
plot(ebsd('Ti-Hex'),color);

%% Plot grains with IPF colours using grains.meanOrientation X, Y and Z - Cubic
 
figure();
ipfKey = ipfColorKey(grains('Ti-Hex'));
ipfKey.inversePoleFigureDirection = xvector;
color = ipfKey.orientation2color(grains('Ti-Hex').meanOrientation);
plot(grains('Ti-Hex'),color);

figure();
ipfKey = ipfColorKey(Hex_grains('Ti-Hex'));
ipfKey.inversePoleFigureDirection = yvector;
color = ipfKey.orientation2color(Hex_grains('Ti-Hex').meanOrientation);
plot(Hex_grains('Ti-Hex'),color);

figure();
ipfKey = ipfColorKey(grains('Ti-Hex'));
ipfKey.inversePoleFigureDirection = zvector;
color = ipfKey.orientation2color(grains('Ti-Hex').meanOrientation);
plot(grains('Ti-Hex'),color);