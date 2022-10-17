T = 4;
N = 100;
W = 2*pi /T;
dt = T/N;
figure(1)
hold on;
axis([-4 4 -4 4])
x = zeros(3, 1);
y = zeros(3, 1);
frame = plot (x, y);

for i = 1: 2000
    delete(frame);
    theta = W * dt * i;
    point1 = [cos(theta) sin(theta)];
    point2 = [cos(theta)+0.5*cos(2*theta + 1) sin(theta)+0.5*sin(2*theta + 1)];
    x(2) = point1(1);
    y(2) = point1(2);
    x(3) = point2(1);
    y(3) = point2(2);
    frame = plot (x, y);
    pause(dt);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
