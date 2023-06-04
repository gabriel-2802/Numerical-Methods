function w = euler(a, b, n, alpha, f)
h = (b - a) / n;
t = a;

w = zeros(n + 1, 1);
w(1) = alpha;

for i = 1 : n
    w(i + 1) = w(i) + h * f(t, w(i));
    t = a + i * h;
end
end