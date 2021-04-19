clear
close all

fnx = 50;
fny = 100;
radius1 = 1;
stretch = 1.03;
arad = 3;
brad = 7;

xd = [0 0.2 0.4 1];
yd = [2 0.5 2 0.1];

%input data information
%fnx: imax
%fny: jmax
%radius1: inner circle radius
%arad: 타원 단반경
%brad: 타원 장반경
%stretch: stretching factor, >1이면, inner circle에서 멀어질수록 stretching함.
%xd, yd: 밀도 곡선을 그릴 때 사용할 좌표

%원하는 meshing method만 주석 해제해서 사용
%uniform: 등간격  stretch: 등비수열  DC: 밀도 곡선
%fullDC를 사용할 땐 fullmeshpolt으로 플롯

%[x, y] = uniformmeshing(fnx, fny, radius1, arad, brad);
%[x, y] = stretchmeshing(fnx, fny, radius1, stretch, arad, brad);
[x, y] = DCmeshing(fnx, fny, radius1, arad, brad, xd, yd);
%[x1, y1, x2, y2] = fullDCmeshing(fnx, fny, radius1, arad, brad, xd, yd);
meshplot(x, y, fnx, fny, arad, brad);
%fullmeshplot(x1, y1, x2, y2, fnx, fny, arad, brad);