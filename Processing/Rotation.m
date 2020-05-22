%% rotate the orientation data but not the spatial data

rot=rotation('Euler', 0*degree, -90*degree, -90*degree);
ebsd=rotate(ebsd,rot,'keepXY'); % 'keepXY' allows you to apply a rotation to your orientation data without changing the spatial data

RD = vector3d.X;
TD = vector3d.Y;
ND = vector3d.Z;
