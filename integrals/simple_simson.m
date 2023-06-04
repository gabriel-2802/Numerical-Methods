function I = simple_simpson(a, b, f)
h = (b - a) / 2;

I = h / 3 * (f(a) + 4 *  f((a + b)/ 2) + f(b));
end