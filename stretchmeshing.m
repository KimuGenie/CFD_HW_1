function [x, y] = stretchmeshing(fnx, fny, radius1, stretch, arad, brad)

theta = (pi/2)/(fnx-1);

%far field
for i=1:fnx
x(i,1) = radius1*cos(pi-theta*(i-1));
y(i,1) = radius1*sin(pi-theta*(i-1));

x(i, fny) = (cos(pi-theta*(i-1)))/sqrt(cos(pi-theta*(i-1))^2/arad^2 ...
    + sin(pi-theta*(i-1))^2/brad^2);
y(i, fny) = (sin(pi-theta*(i-1)))/sqrt(cos(pi-theta*(i-1))^2/arad^2 ...
    + sin(pi-theta*(i-1))^2/brad^2);
end

%interior
c2 = 1-stretch^(fny-1);
for j=2:fny-1
    c1 = 1-stretch^(j-1);
    for i=1:fnx
        xleng = x(i,fny)-x(i,1);
        yleng = y(i,fny)-y(i,1);
        x(i,j) = x(i,1)+xleng*c1/c2;
        y(i,j) = y(i,1)+yleng*c1/c2;
    end
end

%far field align
for j=1:fny
    y(1, j) = 0;
    x(fnx, j) = 0;
end