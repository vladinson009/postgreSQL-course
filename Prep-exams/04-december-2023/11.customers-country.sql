CREATE
OR REPLACE PROCEDURE sp_customer_country_name (
    customer_full_name VARCHAR(50),
    INOUT country_name VARCHAR(50)
) LANGUAGE plpgsql AS $$
BEGIN

    SELECT (SELECT countries.name FROM countries WHERE c.country_id = countries.id)
    INTO country_name

    FROM customers AS c
    WHERE CONCAT_WS(' ', c.first_name, c.last_name) = customer_full_name;
END;
$$;