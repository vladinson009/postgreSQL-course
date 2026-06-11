DELETE FROM board_games AS bg
WHERE
    bg.publisher_id IN (
        SELECT
            p.id
        FROM
            publishers AS p
        WHERE
            p.address_id IN (
                SELECT
                    a.id
                FROM
                    addresses AS a
                WHERE
                    SUBSTRING(a.town, 1, 1) = 'L'
            )
    );

DELETE FROM publishers AS p
WHERE
    p.address_id IN (
        SELECT
            a.id
        FROM
            addresses AS a
        WHERE
            SUBSTRING(a.town, 1, 1) = 'L'
    );

DELETE FROM addresses
WHERE
    SUBSTRING(town, 1, 1) = 'L';

-- Alternative
DELETE FROM board_games
WHERE
    publisher_id IN (
        SELECT
            p.id
        FROM
            publishers p
            JOIN addresses a ON a.id = p.address_id
        WHERE
            a.town LIKE 'L%'
    );

DELETE FROM publishers
WHERE
    address_id IN (
        SELECT
            id
        FROM
            addresses
        WHERE
            town LIKE 'L%'
    );

DELETE FROM addresses
WHERE
    town LIKE 'L%';