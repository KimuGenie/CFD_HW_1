function fullmeshplot(x1, y1, x2, y2, fnx, fny, arad, brad)

figure
hold on

%interior line plot
for i=1:fnx
    plot(x1(i, :), y1(i, :), 'k', 'linewidth', 0.5)
end
for j=1:fny
    plot(x1(:, j), y1(:, j), 'k', 'linewidth', 0.5)
end

%far field line plot
plot(x1(1, :), y1(1, :), 'k', 'linewidth', 1.5)
plot(x1(fnx, :), y1(fnx, :), 'k', 'linewidth', 1.5)
plot(x1(:, 1), y1(:, 1), 'k', 'linewidth', 1.5)
plot(x1(:, fny), y1(:, fny), 'k', 'linewidth', 1.5)


%interior line plot
for i=1:fnx
    plot(x2(i, :), y2(i, :), '-.k', 'linewidth', 0.5)
end
for j=1:fny
    plot(x2(:, j), y2(:, j), '-.k', 'linewidth', 0.5)
end
 
%far field line plot
plot(x2(1, :), y2(1, :), '-.k', 'linewidth', 1.5)
plot(x2(fnx, :), y2(fnx, :), '-.k', 'linewidth', 1.5)
plot(x2(:, 1), y2(:, 1), '-.k', 'linewidth', 1.5)
plot(x2(:, fny), y2(:, fny), '-.k', 'linewidth', 1.5)

xlabel('X-Coordinate')
ylabel('Y-Coordinate')

axis equal
axis([-arad-1 arad+1 -1-brad brad+1])