function [lambda, x] = mpi(A, x0, iter, tol)
prev_x = x0;
prev_x = prev_x / norm(prev_x);
steps = 1;

while 1
    x = A \ prev_x;
    x = x / norm(x);
    steps = steps + 1;

    err = norm(x - prev_x);
    if err < tol || steps == iter
        lambda = x' * A * x;
        return
    end
    prev_x = x;
end
end