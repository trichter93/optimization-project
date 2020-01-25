function J = jacobian(x,t)
n = length(x);
if n == 2
    J = [exp(-t.*x(2)) -x(1)*t.*exp(-t.*x(2))];
end
if n == 4
    J = [exp(-t.*x(2)) -x(1)*t.*exp(-t.*x(2)) exp(-t.*x(4)) -x(3)*t.*exp(-t.*x(4))];
end
end