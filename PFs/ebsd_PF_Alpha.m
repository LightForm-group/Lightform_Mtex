% plotting convention
setMTEXpref('yAxisDirection','north');
setMTEXpref('zAxisDirection','east');

%% Plot PF Alpha

figure();
ori=ebsd('Ti-Hex').orientations;
x=[Miller(0,0,0,1,ori.CS), Miller(1,0,-1,0,ori.CS), Miller(1,1,-2,0,ori.CS)]; % include hkil figures here
plotPDF(ori,x,'antipodal', 'contourf', 0:1:10.0, 'minmax', 'colorRange',[0,10]); % plot with contouring
mtexColorbar ('location','southOutSide','title','mrd'); % to move the colour bar to below and include a title

