function [rez] = lagrange(x, y, a)
    n = length(x);

    V = eye(n) + diag(a - x) * ~eye(n);
    U = eye (n) + ones (n) * diag (x) - diag (x) * ones (n);

    rez = prod (V) ./ prod (U) * y;
end