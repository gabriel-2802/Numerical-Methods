function [I] = trapezoidal(f, a, b, n)
h = (b - a) / n;

I = h / 2 * (f(a) + f(b) + 2 * sum(f(a + h: h : b - h)));
end