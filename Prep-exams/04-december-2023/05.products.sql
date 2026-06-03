SELECT
    p.name,
    p.recipe,
    p.price
FROM
    products AS p
WHERE
    price BETWEEN 10 AND 20
ORDER BY
    p.price DESC