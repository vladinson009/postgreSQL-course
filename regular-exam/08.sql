SELECT
    c.id AS customer_id,
    CONCAT_WS(' ', c.first_name, c.last_name) AS full_name,
    COUNT(o.id) AS total_orders,
    CASE c.loyalty_card
        WHEN TRUE THEN 'Loyal Customer'
        ELSE 'Regular Customer'
    END AS loyalty_status
FROM
    customers AS c
    LEFT JOIN orders AS o ON o.customer_id = c.id
    LEFT JOIN reviews AS r ON r.customer_id = c.id
WHERE
    o.customer_id > 0
    AND c.id NOT IN (
        SELECT
            reviews.customer_id
        FROM
            reviews
    )
GROUP BY
    c.id,
    full_name,
    c.loyalty_card
ORDER BY
    total_orders DESC,
    c.id