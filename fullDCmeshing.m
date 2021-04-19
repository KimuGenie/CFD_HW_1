function [x1, y1, x2, y2] = fullDCmeshing(fnx, fny, radius1, arad, brad, xd, yd)

theta = (pi)/(fnx-1);

%far field1
for i=1:fnx
x1(i,1) = radius1*cos(pi-theta*(i-1));
y1(i,1) = radius1*sin(pi-theta*(i-1));

x1(i, fny) = (cos(pi-theta*(i-1)))/sqrt(cos(pi-theta*(i-1))^2/arad^2 ...
    + sin(pi-theta*(i-1))^2/brad^2);
y1(i, fny) = (sin(pi-theta*(i-1)))/sqrt(cos(pi-theta*(i-1))^2/arad^2 ...
    + sin(pi-theta*(i-1))^2/brad^2);
end

%interior1
for n = 1:fny-1
    m(n) = 1/interp1(xd, yd, n/(fny-1));
end

m = m/sum(m);

for i=1:fnx
    xleng = x1(i, fny) - x1(i, 1);
    yleng = y1(i, fny) - y1(i, 1);
    for j=1:fny-2
        x1(i,j+1) = x1(i,j)+xleng*m(j);
        y1(i,j+1) = y1(i,j)+yleng*m(j);
    end
end

%far field align1
for j=1:fny
    y1(1, j) = 0;
    y1(fnx, j) = 0;
end



%far field2
for i=1:fnx
x2(i,1) = radius1*cos(-theta*(i-1));
y2(i,1) = radius1*sin(-theta*(i-1));

x2(i, fny) = (cos(-theta*(i-1)))/sqrt(cos(-theta*(i-1))^2/arad^2 ...
    + sin(-theta*(i-1))^2/brad^2);
y2(i, fny) = (sin(-theta*(i-1)))/sqrt(cos(-theta*(i-1))^2/arad^2 ...
    + sin(-theta*(i-1))^2/brad^2);
end

%interior2
for n = 1:fny-1
    m(n) = 1/interp1(xd, yd, n/(fny-1));
end

m = m/sum(m);

for i=1:fnx
    xleng = x2(i, fny) - x2(i, 1);
    yleng = y2(i, fny) - y2(i, 1);
    for j=1:fny-2
        x2(i,j+1) = x2(i,j)+xleng*m(j);
        y2(i,j+1) = y2(i,j)+yleng*m(j);
    end
end

%far field align2
for j=1:fny
    y2(1, j) = 0;
    y2(fnx, j) = 0;
end

figure
plot(xd, yd, 'k', 'linewidth', 1.5)
xlabel('Stretch Direction')
ylabel('Densitiy')