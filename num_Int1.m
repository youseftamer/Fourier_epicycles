function result = num_Int1(fun, upper, lower, N)

domain = [0, 50];
dx = (upper - lower) / N;
x = linspace(domain(1), domain(2), N);
f_x = eval(fun);
result = 0;

for i = 1:N
    result = result + f_x(i);
end
result = result * dx;

end