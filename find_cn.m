function cn = find_cn(M, f_t, W, N)

T = 2*pi / W;
dt = T/N;
cn = zeros(M, 2);

for l = 1:M
    cn(l, :) = 0;
    for k = 1:N
        cn(l, 1) = cn(l, 1) + exp(-W * l * k * dt * 1j) * f_t(k);
        cn(l, 2) = cn(l, 2) + exp(W * l * k * dt * 1j) * f_t(k);
    end
    cn(l, 1) = cn(l, 1) * dt / T;
    cn(l, 2) = cn(l, 2) * dt / T;
end

end