function I = richardson10(f,a,b)
I = zeros(5,1);

for i = 1 : 5
    h = (b - a) / (2^(i -1));
    I(i) = h / 2 * (f(a) + f(b) + 2 * sum(f(a + h : h : b - h)));
end

for j = 2 : 5
    prev_I = I;
    I = (4 ^ (j - 1) * prev_I(2:end) - prev_I(1 : end - 1)) / (4 ^ (j - 1) - 1);
end
end
