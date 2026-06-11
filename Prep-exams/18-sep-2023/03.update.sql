UPDATE players_ranges
SET
    max_players = max_players + 1
WHERE
    max_players = min_players;

UPDATE board_games
SET
    name = CONCAT(name, ' V2')
WHERE
    release_year >= 2020;