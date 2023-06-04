function I = romberg(f,a,b,n)
I = zeros(n + 1, 1);

for i = 1 : n + 1
    I(i) = simpson(f,a,b,2 ^(i - 1));
    % sau trapezoidal
end

for j = 2:n+1
    prev_I = I;
    I = (4 ^ j * prev_I(2:end) - prev_I(1:end-1)) / (4 ^ j - 1);
end
end