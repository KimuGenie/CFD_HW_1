function meshplot(x, y, fnx, fny, arad, brad)

figure
hold on

%interior line plot
for i=1:fnx
    plot(x(i, :), y(i, :), 'k', 'linewidth', 0.5)
end
for j=1:fny
    plot(x(:, j), y(:, j), 'k', 'linewidth', 0.5)
end

%far field line plot
plot(x(1, :), y(1, :), 'k', 'linewidth', 1.5)
plot(x(fnx, :), y(fnx, :), 'k', 'linewidth', 1.5)
plot(x(:, 1), y(:, 1), 'k', 'linewidth', 1.5)
plot(x(:, fny), y(:, fny), 'k', 'linewidth', 1.5)

xlabel('X-Coordinate')
ylabel('Y-Coordinate')

axis equal
axis([-arad-1 1 -1 brad+1])