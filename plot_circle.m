function [pl] = plot_circle(c0, cn, circles, M)

figure(1)
hold on
d = linspace(0, 2*pi, 10);
x = abs(c0) * (cos(d) + 1j * sin(d));
plot(x, 'b -');

for i = 1:M
    r = abs(cn(i, 1));
    x = ones(10, 1) * circles(2*i) + r * (cos(d) + 1j * sin(d));
    plot(x, 'b -');
    
    x = ones(10, 1) * circles(2*i + 1) + r * (cos(d) + 1j * sin(d));
    plot(x, 'b -');
end