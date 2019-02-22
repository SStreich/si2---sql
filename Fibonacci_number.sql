CREATE OR REPLACE FUNCTION nth_fib(n integer)
RETURNS INTEGER AS $nth_fib$
  DECLARE
  x INTEGER := 0;
  y INTEGER := 1;
  m INTEGER := 0;
  BEGIN
    IF n = 0 THEN RETURN 0;
    ELSIF n = 1 THEN RETURN 1;
    ELSE
     FOR i in 1..n-1 LOOP
        m := x + y;
        x := y;
        y := m;
      END LOOP;
    END IF;
    RETURN m;
  END;
  $nth_fib$ LANGUAGE  plpgsql;

DO $fib$
  BEGIN
   IF nth_fib(4) >= 0 THEN
     raise info 'Fibonacci nth number: %', nth_fib(40);
     raise info 'Fibonacci nth number: %', nth_fib(0);
     raise info 'Fibonacci nth number: %', nth_fib(1);
     raise info 'Fibonacci nth number: %', nth_fib(12);
     raise info 'Fibonacci nth number: %', nth_fib(37);

   end if;
  END;
  $fib$ LANGUAGE  plpgsql;