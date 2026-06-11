CREATE
OR REPLACE FUNCTION fn_creator_with_board_games (first_name_of_creator VARCHAR(30)) RETURNS INT LANGUAGE plpgsql AS $$
BEGIN
   RETURN ( SELECT COUNT(*)
    FROM
        board_games AS bg
            JOIN creators_board_games AS cbg ON cbg.board_game_id = bg.id
            JOIN creators AS c ON cbg.creator_id = c.id
    WHERE c.first_name = first_name_of_creator);
END
$$;