function [x, err, steps] = sor_ec(A, b, x0, w, tol, max_steps)
  
  % initializari
  prev_x = x0;
  steps = 0;
  
  % n - dimensiunea sistemului
  n = length(A);

  % prealocare pentru x - pentru a-l folosi direct la prima iteratie (este
  % mai eficienta prealocarea de la inceput)
  x = zeros(n, 1);

  while 1
    steps = steps + 1;

    % calculul nematriceal al lui x
    for i = 1:n
      x(i) = (1 - w) * (b(i) - A(i, 1:i-1) * prev_x(1:i-1) - A(i, i+1:n) * prev_x(i+1:n)) / A(i, i);
      x(i) =  x(i) + w * (b(i) - A(i, 1:i-1) * x(1:i-1) - A(i, i+1:n) * prev_x(i+1:n)) / A(i, i);
    end
    
    % eroarea, exprimata relativ la solutia de la pasul precedent.
    err = norm(x - prev_x);

    if err < tol || steps == max_steps
      return;
    end
    
    % inchidem ciclul -> continuam procesul iterativ
    prev_x = x;
  end
end