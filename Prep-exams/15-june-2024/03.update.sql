UPDATE addresses
SET
    country = CASE
        WHEN LEFT(country, 1) = 'B' THEN 'Blocked'
        WHEN LEFT(country, 1) = 'T' THEN 'Test'
        WHEN LEFT(country, 1) = 'P' THEN 'In Progress'
    END
WHERE
    LEFT(country, 1) IN ('B', 'T', 'P');