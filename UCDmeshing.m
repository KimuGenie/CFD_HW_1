function [x, y] = UCDmeshing(fnx, fny, radius1, arad, brad, ix, iy)

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
for n = 1:fny-1
    uc(n) = 1/(interp1(ix, iy, (n-1)/(fny-1))*(fny-1));
end

uc = uc/sum(uc);

for i=1:fnx
    xleng = x(i, fny) - x(i, 1);
    yleng = y(i, fny) - y(i, 1);
    for j=2:fny-1
        x(i,j) = x(i,j-1)+xleng*uc(j-1);
        y(i,j) = y(i,j-1)+yleng*uc(j-1);
    end
end

%far field align
for j=1:fny
    y(1, j) = 0;
    x(fnx, j) = 0;
end

figure
plot(ix, iy, 'k', 'linewidth', 1)
xlabel('j-Direction')
ylabel('Densitiy')