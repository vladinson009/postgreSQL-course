CREATE TABLE
    gift_recipients (
        id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        name VARCHAR(100),
        country_id INT NOT NULL REFERENCES countries (id) ON DELETE CASCADE ON UPDATE CASCADE,
        gift_sent BOOLEAN DEFAULT FALSE
    );

INSERT INTO
    gift_recipients (name, country_id, gift_sent)
SELECT
    CONCAT_WS(' ', first_name, last_name) AS name,
    country_id,
    CASE
        WHEN country_id IN (7, 8, 14, 17, 26) THEN TRUE
        ELSE FALSE
    END as gift_sent
FROM
    customers;