CREATE
OR REPLACE FUNCTION udf_classification_items_count (classification_name VARCHAR(30)) RETURNS VARCHAR(50) LANGUAGE plpgsql AS $$
    DECLARE items_count INT;
    BEGIN
        SELECT COUNT(i.id)
        INTO items_count
        FROM classifications c
                 LEFT JOIN items i
                           ON i.classification_id = c.id
        WHERE c.name = classification_name;

        IF items_count = 0 THEN
            RETURN 'No items found.';
        END IF;

        RETURN CONCAT('Found ', items_count, ' items.');
    END;
    $$;