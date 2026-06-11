CREATE TABLE
    search_results (
        id SERIAL PRIMARY KEY,
        name VARCHAR(50),
        release_year INT,
        rating FLOAT,
        category_name VARCHAR(50),
        publisher_name VARCHAR(50),
        min_players VARCHAR(50),
        max_players VARCHAR(50)
    );

CREATE
OR REPLACE PROCEDURE usp_search_by_category (category VARCHAR(50)) LANGUAGE plpgsql AS $$
BEGIN
    TRUNCATE TABLE search_results;
    INSERT INTO search_results(name, release_year, rating, category_name, publisher_name, min_players, max_players)
    SELECT bg.name,
           bg.release_year,
           bg.rating,
           ca.name                           AS category_name,
           p.name                            AS publisher_name,
           CONCAT(pr.min_players, ' people') AS min_players,
           CONCAT(pr.max_players, ' people') AS max_players


    FROM board_games AS bg
             JOIN categories AS ca ON bg.category_id = ca.id
             JOIN publishers AS p ON bg.publisher_id = p.id
             JOIN players_ranges AS pr ON pr.id = bg.players_range_id
    WHERE ca.name = category
    ORDER BY p.name, bg.release_year DESC;
END
$$;