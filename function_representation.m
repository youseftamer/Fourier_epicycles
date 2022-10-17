%% domain representation 
N = 10000;
M = 1000;
a = zeros(M, 0);
b = zeros(M, 0);
domain = [0, 50];
T = (domain(2) - domain(1));
dx = T / N;
x = linspace(domain(1), domain(2), N);
W = 2*pi/ T;


%% funtion representation 

%f_x = sin(x); %normal function 

%f_x(1:N/2) = sin(x(1:N/2));       %pieceWise representation
%f_x(N/2 + 1: N) = x(N/2 + 1: N);

%figure(1);
%plot (x, f_x);

%%
f_x(1:N/2) = sin(x(1:N/2));       %pieceWise representation
f_x(N/2 + 1: N) = x(N/2 + 1: N);

a0 = 2 * num_Int2(f_x, dx, N) / T;
for i = 1:M
    f_x_cos = f_x .* cos(i*W*x);
    f_x_sin = f_x .* sin(i*W*x);
    a(i) = num_Int2(f_x_cos, dx, N) * 2 / T;
    b(i) = num_Int2(f_x_sin, dx, N) * 2 / T;
end

sum = a0 / 2;

for i = 1:M
    sum = sum + a(i) * cos(i*W*x) + b(i) * sin(i*W*x);
    plot(x, sum)
    pause(0.1)
end