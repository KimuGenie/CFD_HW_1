clear
close all

fnx = 50;
fny = 100;
radius1 = 1;
stretch = 1.03;
arad = 3;
brad = 7;

ix = [0 0.1 0.4 1];
iy = [2 0.5 1 0.1];

%input data information
%fnx: imax
%fny: jmax
%radius1: inner circle radius
%arad: 타원 단반경
%brad: 타원 장반경
%stretch: stretching factor, >1이면, inner circle에서 멀어질수록 stretching함.
%ix, iy: UCDmeshing에 사용할 좌표

%원하는 meshing method만 주석 해제해서 사용
%[x, y] = stretchmeshing(fnx, fny, radius1, stretch, arad, brad);
%[x, y] = uniformmeshing(fnx, fny, radius1, arad, brad);
[x, y] = UCDmeshing(fnx, fny, radius1, arad, brad, ix, iy);
meshplot(x, y, fnx, fny, arad, brad);