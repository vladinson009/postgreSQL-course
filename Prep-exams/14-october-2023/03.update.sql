UPDATE coaches AS c
SET
    salary = salary * coach_level
WHERE
    LEFT(first_name, 1) LIKE 'C'
    AND (
        SELECT
            COUNT(*)
        FROM
            players_coaches
        WHERE
            coach_id = c.id
    ) > 0