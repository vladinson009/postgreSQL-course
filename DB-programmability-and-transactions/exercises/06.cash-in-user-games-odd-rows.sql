CREATE
OR REPLACE FUNCTION fn_cash_in_users_games (game_name VARCHAR(50)) RETURNS TABLE (total_cash NUMERIC) LANGUAGE plpgsql AS $$
BEGIN
    RETURN QUERY SELECT
        ROUND(SUM(cash), 2) AS total_cash
    FROM (SELECT ROW_NUMBER() OVER (ORDER BY ug.cash DESC ) AS row_number,
                 ug.*
          FROM users_games AS ug
                   JOIN games AS g ON g.id = ug.game_id
          WHERE g.name = game_name) AS ranked
    WHERE row_number % 2 = 1;
END;
$$;

--Example usage
SELECT
    fn_cash_in_users_games ('Love in a mist')