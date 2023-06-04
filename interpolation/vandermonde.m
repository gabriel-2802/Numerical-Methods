function [coef] = vandermonde(x, y)
n = length(x) - 1;
A = zeros(n + 1, n + 1);
A(:, 1) = 1;

for i = 2 : n + 1
    A(:, i) = A(:, i - 1)  .* x;
end

coef = A \ y;
coef = flip(coef);
end