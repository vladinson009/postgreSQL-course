CREATE
OR REPLACE FUNCTION fn_difficulty_level (level INT) RETURNS VARCHAR(50) LANGUAGE plpgsql AS $$
BEGIN
    RETURN
        CASE
            WHEN level <= 40 THEN 'Normal Difficulty'
            WHEN level <= 60 THEN 'Nightmare Difficulty'
            WHEN level > 60 THEN 'Hell Difficulty'
            END::VARCHAR(50);
END;
$$;

-- TEST QUERY
SELECT
    ug.user_id,
    ug.level,
    ug.cash,
    fn_difficulty_level (ug.level) AS difficulty_level
FROM
    users AS u
    JOIN users_games AS ug ON ug.user_id = u.id
ORDER BY
    ug.user_id