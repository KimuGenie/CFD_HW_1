function [x, y] = uniformmeshing(fnx, fny, radius1, arad, brad)

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
for i=1:fnx
    for j=2:fny-1
        dx = (x(i,fny) - x(i,1))/(fny-1);
        dy = (y(i,fny) - y(i,1))/(fny-1);
        x(i,j) = x(i,1)+dx*(j-1);
        y(i,j) = y(i,1)+dy*(j-1);
    end
end

%far field align
for j=1:fny
    y(1, j) = 0;
    x(fnx, j) = 0;
end