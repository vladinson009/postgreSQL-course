CREATE
OR REPLACE PROCEDURE sp_increase_salary_by_id (id INT) LANGUAGE plpgsql AS $$
BEGIN
    IF EXISTS (SELECT 1
               FROM employees
               WHERE employee_id = id) THEN
        UPDATE employees
        SET salary = salary * 1.05
        WHERE employee_id = id;
    END IF;
END;
$$;

CALL sp_increase_salary_by_id (1);