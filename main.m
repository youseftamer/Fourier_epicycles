T = 0.5;
M = 300;
W = 2*pi/T;
invert = 1;
speed = 1;
frames = 1500;
window = 50;
t_shift = 2;
circle_shift = 550;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% function
data = load ('photos/fourier.dat');
x = data(:, 1);
y = data(:, 2);
a = size (data);
x(a + 1) = x(1);
y(a + 1) = y(1);

if invert == 1
    y = y - mean(y);
    y = -y;
    x = x - mean(x);
end

axis = max(max([y x])); 

N = a(1);
dt = T/N;
t = linspace(0, T, N);

f_t = x + y *1j;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cn = find_cn(M, f_t, W, N);
cn0 = num_Int2(f_t, dt, N)/T;

figure(1)
hold on
subplot(2,2, 4);
plot(f_t);
plot_epicycles(cn0, cn, W, T, axis, frames, 100, speed, window, circle_shift, t_shift)

