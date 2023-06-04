function [x] = bisec(f, a, b, tol, iter)
steps = 1;
while 1
    c = (a + b) / 2;

    if f(a) * f(c) < 0
        b = c;
    elseif f(b) * f(c) < 0
        a = c;
    end

    err = b - a;
    steps = steps + 1;

    if steps == iter || err < tol
        x = c;
        return
    end
end
end