function [I] = simpson(f, a, b, n)
h = (b - a) / 2 / n;
I = h * (f(a) + f(b) + 4 * sum(f(a+h : 2*h : b-h)) + 2 * sum(f(a+2*h : 2*h : b-2*h))) / 3;
end
