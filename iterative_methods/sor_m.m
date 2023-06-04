function [x err steps] = sor_m(A, b, x0, w, tol, max_steps)
  % matricele N si P din metoda SOR
  D = diag(diag(A));
  L = tril(A, -1);
  U = triu(A, 1);

  N = D + w * L;
  P = N - w * A;
  
  % inversa lui N -> N este inferior triunghiulara, deci inversa
  % este usor de calculat

  inv_N = inv(N);
  
  % matricea + vectorul de iteratie SOR
  G = inv_N * P;
  c = w * inv_N * b;

  prev_x = x0;
    
  steps = 0;
  while 1
    x = G * prev_x + c;
        
    err = norm(x - prev_x);
        
    steps = steps + 1;
    if (steps == max_steps) || (err < tol)
      return;
    end
        
    prev_x = x;
    end
  end