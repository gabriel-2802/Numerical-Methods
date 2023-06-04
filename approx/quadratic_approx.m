function [a] = quadratic_approx(x, y)

  S = zeros(1, 5);  
  for i = 1:5
    S(i) = sum(x .^ (i - 1));
  end
  
  b = zeros(3, 1);
  % vectorul termenilor liberi, in care vom pune sumele
  for i = 1:3
    b(i) = sum(y .* (x .^ (i - 1)));
  endfor
  
  % matricea sistemului, in care vom pune sumele
  A = zeros(3);
  for i = 1:3
    for j = 1:3
      A(i,j) = S(i + j - 1);
    end
  end
  
  a = A \ b;
  end