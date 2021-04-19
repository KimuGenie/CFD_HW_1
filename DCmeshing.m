function [x, y] = DCmeshing(fnx, fny, radius1, arad, brad, xd, yd)

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
    m(n) = 1/interp1(xd, yd, n/(fny-1));
end

m = m/sum(m);

for i=1:fnx
    xleng = x(i, fny) - x(i, 1);
    yleng = y(i, fny) - y(i, 1);
    for j=1:fny-2
        x(i,j+1) = x(i,j)+xleng*m(j);
        y(i,j+1) = y(i,j)+yleng*m(j);
    end
end

%far field align
for j=1:fny
    y(1, j) = 0;
    x(fnx, j) = 0;
end

figure
plot(xd, yd, 'k', 'linewidth', 1.5)
xlabel('Stretch Direction')
ylabel('Densitiy')