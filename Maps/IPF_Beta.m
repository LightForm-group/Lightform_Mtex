%% Plot ebsd data or grains in IPF colours

%% Plot ebsd data with IPF colours
figure();
oM = ipfHSVKey(ebsd('Titanium cubic'));
oM.inversePoleFigureDirection = xvector;
color = oM.orientation2color(ebsd('Titanium cubic').orientations);
plot(ebsd('Titanium cubic'),color);

figure();
oM = ipfHSVKey(ebsd('Titanium cubic'));
oM.inversePoleFigureDirection = yvector;
color = oM.orientation2color(ebsd('Titanium cubic').orientations);
plot(ebsd('Titanium cubic'),color);

figure();
oM = ipfHSVKey(ebsd('Titanium cubic'));
oM.inversePoleFigureDirection = zvector;
color = oM.orientation2color(ebsd('Titanium cubic').orientations);
plot(ebsd('Titanium cubic'),color);

%% Plot grains with IPF colours using grains.meanOrientation X, Y and Z - Cubic

figure();
ipfKey = ipfColorKey(grains('Titanium cubic'));
ipfKey.inversePoleFigureDirection = xvector;
color = ipfKey.orientation2color(grains('Titanium cubic').meanOrientation);
plot(grains('Titanium cubic'),color);

figure();
ipfKey = ipfColorKey(grains('Titanium cubic'));
ipfKey.inversePoleFigureDirection = yvector;
color = ipfKey.orientation2color(grains('Titanium cubic').meanOrientation);
plot(grains('Titanium cubic'),color)

figure();
ipfKey = ipfColorKey(grains('Titanium cubic'));
ipfKey.inversePoleFigureDirection = zvector;
color = ipfKey.orientation2color(grains('Titanium cubic').meanOrientation);
plot(grains('Titanium cubic'),color);