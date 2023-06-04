function [x] = Jacobi_m(A, b, x0, iter, tol)
N = diag(diag(A));
P = -(A - N);

inv_N  = inv(N);
G = inv_N * P;
c = inv_N * b;

steps = 1;
prev_x = x0;

while 1
    x = G * prev_x + c;
    err = norm(x - prev_x);
    steps = steps + 1;

    if steps == iter || err < tol
        return
    end

    prev_x = x;
end
end