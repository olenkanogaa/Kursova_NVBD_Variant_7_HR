UPDATE History_Position
SET end_date = CASE 
                   WHEN start_date > '2018-01-01' THEN NULL
                   ELSE DATEADD(DAY, 180, start_date)
               END;

UPDATE Holidays
SET end_date = DATEADD(DAY, 20, start_date);
