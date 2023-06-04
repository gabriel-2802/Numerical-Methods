function [x] = secant(f, x0, x1, tol, iter)
steps = 1;
prev_x = x1;
prev2_x = x0;

while 1
   df = f(prev_x) - f(prev2_x) / (prev_x - prev2_x);
   x = prev_x - f(prev_x) / df;
    
   steps = steps + 1;
   err = abs(x - prev_x);
   if err < tol || steps == iter
       return
   end

   prev2_x = prev_x;
   prev_x = x;
end