function [x] = Gauss_Seidel(A, b, x0, iter, tol)
N = tril(A);
P = N - A;

inv_N = inv(N);
G = inv_N * P;
c = inv_N * b;

steps = 1;
prev_x = x0;

while 1
    x = G * prev_x + c;
    err = norm(x - prev_x);

    if err < tol || steps == iter
        return
    end
    steps = steps + 1;
    prev_x = x;
end

end