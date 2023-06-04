function [x, err, steps] = Jacobi_ec(A, b, x0, tol, max_steps)
  prev_x = x0;
  steps = 0;
  
  n = length(A);
  x = zeros(n, 1);

  while 1
    steps = steps + 1;

    for i = 1:n
      x(i) = (b(i) - A(i, 1:i-1) * prev_x(1:i-1) - A(i, i+1:n) * prev_x(i+1:n)) / A(i, i);
    end
    
    err = norm(x - prev_x);

    if err < tol || steps == max_steps
      return;
    end
    
    % inchidem ciclul -> continuam procesul iterativ
    prev_x = x;
    end
  end