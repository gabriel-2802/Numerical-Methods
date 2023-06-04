function [a] = cubic_approx(x, y)

  S = zeros(1, 9);
  for i = 1:9
    S(i) = sum(x .^ (i - 1));
  end
  
  b = zeros(4, 1);
  
  % vectorul termenilor liberi, in care vom pune sumele
  for i = 1:4
    b(i) = sum(y .* (x .^ (i - 1)));
  end
  
  % matricea sistemului, in care vom pune sumele
  A = zeros(4);
  for i = 1:4
    for j = 1:4
      A(i,j) = S(i + j - 1);
    end
  end
  
  a = A \ b;
end