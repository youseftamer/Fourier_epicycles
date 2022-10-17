N = 100;
T = 4;
dt = T/N;
M = 50;
W = 2*pi/T;
t = linspace(0, T, N);

f_t(1:0.5*N) = t(1:0.5*N) + t(1:0.5*N).^ 2 * 1j;
f_t(0.5*N + 1 : N) = t(0.5*N + 1 : N) + sin(t(1:0.5*N)) * 1j;

cn = find_cn(M, f_t, W, N);
cn0 = num_Int2(f_t, dt, N)/T;
figure(1)
hold on
plot(f_t);
plot_epicycles(cn0, cn, W, T, 5, 100, 100, 2)