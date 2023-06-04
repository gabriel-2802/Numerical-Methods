function [x] = systems(F, J, x0, iter, tol)
steps = 1;
prev_x = x0;

while 1
delta_x = J \ F{x};
x = prev_x - delta_x;
err = norm(x - prev_x);

if steps == iter || err < tol
    return
end
prev_x = x;
end
end