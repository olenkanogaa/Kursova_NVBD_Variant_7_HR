SELECT
    e.id AS employee_id,                    
    e.id_departament AS department_id,      
    e.position AS position_id,              
    h.start_date AS holiday_start_date, 
    ISNULL(h.end_date, NULL) AS holiday_end_date,    
    hp.start_date AS work_start_date,                 
    ISNULL(hp.end_date, NULL) AS work_end_date, 
    ISNULL(DATEDIFF(DAY, h.start_date, ISNULL(h.end_date, GETDATE())), 0) AS vacation_days,
    p.salary * p.rate AS total_salary                
FROM Employees e
JOIN Positions p ON e.position = p.id
JOIN Departments d ON e.id_departament = d.id
LEFT JOIN Holidays h ON h.id_employee = e.id
LEFT JOIN History_Position hp ON hp.id_empoyee = e.id
WHERE 
    e.id_departament IN (
        SELECT id_departament
        FROM Employees
        GROUP BY id_departament
        HAVING COUNT(id) <= 20
    )
    AND NOT EXISTS (
        SELECT 1
        FROM Holidays h_inner
        JOIN Employees e_inner ON h_inner.id_employee = e_inner.id
        WHERE 
            e_inner.id_departament = e.id_departament
            AND ISNULL(h_inner.end_date, GETDATE()) >= GETDATE()
        GROUP BY e_inner.id_departament, h_inner.start_date, h_inner.end_date
        HAVING COUNT(h_inner.id) > 5
    )
    AND (
        SELECT COUNT(*)
        FROM Employees e_inner
        WHERE e_inner.id_departament = e.id_departament
    ) <= 20;