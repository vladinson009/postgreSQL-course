UPDATE animals AS a
SET
    owner_id = (
        SELECT
            o.id
        FROM
            owners AS o
        WHERE
            o.name = 'Kaloqn Stoqnov'
    )
WHERE
    a.owner_id IS NULL;