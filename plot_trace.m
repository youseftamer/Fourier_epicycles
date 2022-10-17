function f_t = plot_trace(cn0, cn, N, W, T)

f_t = ones(1,N)*cn0;
t = linspace(0, T, N);

for k = 1:height(cn)
    f_t = f_t + cn(k, 1) * exp(t * W * k * 1j) + cn(k, 2) * exp(-t * W * k * 1j);
end

plot (f_t, 'b-');