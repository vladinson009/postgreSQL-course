SELECT
    id,
    last_name,
    loyalty_card
FROM
    customers AS c
WHERE
    (
        POSITION('m' IN last_name) > 0
        OR POSITION('M' IN last_name) > 0
    )
    AND loyalty_card IS TRUE
ORDER BY
    last_name DESC,
    id