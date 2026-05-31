SELECT
    c.photo_id,
    TO_CHAR(p.capture_date, 'YYYY-MM-DD HH24:MI:SS') AS capture_date,
    p.description,
    COUNT(c.*) AS comments_count
FROM
    photos AS p
    JOIN comments AS c ON c.photo_id = p.id
WHERE
    p.description IS NOT NULL
GROUP BY
    c.photo_id,
    p.capture_date,
    p.description
ORDER BY
    comments_count DESC
LIMIT
    3;