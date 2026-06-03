CREATE
OR REPLACE FUNCTION fn_feedbacks_for_product (product_name VARCHAR(25)) RETURNS TABLE (
    customer_id INT,
    customer_name VARCHAR(75),
    feedback_description VARCHAR(255),
    feedback_rate NUMERIC(4, 2)
) LANGUAGE plpgsql AS $$
BEGIN
    RETURN QUERY SELECT f.customer_id,
                        c.first_name,
                        f.description,
                        f.rate
                 FROM products AS p
                          JOIN feedbacks AS f ON f.product_id = p.id
                          JOIN customers AS c ON c.id = f.customer_id
                 WHERE p.name = product_name
                 ORDER BY f.customer_id;

END;
$$;