%% rotate the orientation data but not the spatial data

rot=rotation('Euler', 90*degree, 0*degree, 0*degree);
ebsd=rotate(ebsd,rot,'keepXY'); % 'keepXY' allows you to apply a rotation to your orientation data without changing the spatial data


