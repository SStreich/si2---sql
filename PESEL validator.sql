CREATE OR REPLACE FUNCTION validate_pesel(pesel varchar)
RETURNS BOOLEAN AS $is_pesel_valid$
  DECLARE
  numbers text[] := regexp_split_to_array(pesel, '');
  BEGIN
    IF pesel ~ E'^\\d{11}' THEN
        IF (9 * numbers[1]::INTEGER +
           7 * numbers[2]::INTEGER +
           3 * numbers[3]::INTEGER +
           1 * numbers[4]::INTEGER +
           9 * numbers[5]::INTEGER +
           7 * numbers[6]::INTEGER +
           3 * numbers[7]::INTEGER +
           1 * numbers[8]::INTEGER +
           9 * numbers[9]::INTEGER +
           7 * numbers[10]::INTEGER) % 10 = numbers[11]::INTEGER THEN

             RETURN TRUE;

        END IF;
    END IF;

    RETURN FALSE;

  END;
  $is_pesel_valid$ LANGUAGE plpgsql;

DO $run$
  BEGIN
  RAISE INFO 'wynik to: %', validate_pesel('95102709562');
  END;
  $run$ LANGUAGE plpgsql;

