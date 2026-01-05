(
    SELECT DISTINCT
        start_date AS date,
        YEAR(start_date) AS year,
        MONTH(start_date) AS month,
        DAY(start_date) AS day
    FROM dbo.History_Position
    UNION
    SELECT DISTINCT
        end_date AS date,
        YEAR(end_date) AS year,
        MONTH(end_date) AS month,
        DAY(end_date) AS day
    FROM dbo.History_Position
    UNION
    SELECT DISTINCT
        start_date AS date,
        YEAR(start_date) AS year,
        MONTH(start_date) AS month,
        DAY(start_date) AS day
    FROM dbo.Holidays
    UNION
    SELECT DISTINCT
        end_date AS date,
        YEAR(end_date) AS year,
        MONTH(end_date) AS month,
        DAY(end_date) AS day
    FROM dbo.Holidays
)