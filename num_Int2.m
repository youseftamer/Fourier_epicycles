function result = num_Int2(f_x, dx, N)
result = 0;
for i = 1:N
    result = result + f_x(i);
end
result = result * dx;

end