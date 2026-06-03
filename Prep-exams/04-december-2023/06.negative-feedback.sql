SELECT
    f.product_id,
    f.rate,
    f.description,
    f.customer_id,
    c.age,
    c.gender
FROM
    feedbacks AS f
    JOIN customers AS c ON f.customer_id = c.id
WHERE
    rate < 5
    AND c.gender = 'F'
    AND c.age > 30
ORDER BY
    f.product_id DESC