function res = my_fft(x)
    n = length(x);

    if n == 1
        res = x;
        return;
    end
    
    even_indices = 1 : 2 : n;
    odd_indices = 2 : 2 : n;

    res_even = my_fft(x(even_indices));
    res_odd = my_fft(x(odd_indices));

    factor = exp(-2 * j * pi * (0 : n / 2 - 1) / n);
    res = [res_even + factor .* res_odd , res_even - factor .* res_odd];
end
