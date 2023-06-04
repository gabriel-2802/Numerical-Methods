function [x] = tangent(f, df, x0, tol, iter)
prev_x = x0;
steps = 0;

while 1
    x = prev_x - f(prev_x) / df(prev_x);
    steps = steps + 1;
    err = abs(x - prev_x);

    if steps == iter || err < tol
        return
    end

    prev_x = x;
    
end