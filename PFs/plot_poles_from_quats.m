% This script reads two text files of quaternions (e.g. representing the
% texture before and after a simulation) and then plots a pole figure for
% each. The text files are assumed to have the following format (the
% heading names are not important):
%          w       x            y         z          
%    0.498730  -0.365005   0.55448126  -0.557305
%     ...         ...         ...          ...
% 
% Tested on MATLAB 2019b and MTEX 5.3

paths = {'ori_initial.txt', 'ori_final.txt'};

newMtexFigure('layout', [1,2]);

for index = 1:length(paths)

    % Read the quaternions from the data file
    fid = fopen(paths{index});
    data = textscan(fid, '%f%f%f%f', 'HeaderLines', 1, 'CollectOutput', 1);
    data = data{:};
    fid = fclose(fid);

    q = quaternion(transpose(data));

    cs = crystalSymmetry('cubic');
    ori = orientation(q, cs);

    % Estiamte an ODF from the orientations
    odf = calcDensity(ori);   
    
    % Show a pole figure:
    axesPos = subplot(1,2,index);
    plotPDF(odf, Miller(1, 1, 1, cs), 'parent', axesPos);
    
end

setColorRange('equal')
mtexColorbar

