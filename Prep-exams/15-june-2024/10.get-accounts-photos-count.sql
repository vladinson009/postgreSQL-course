CREATE
OR REPLACE FUNCTION udf_accounts_photos_count (account_username VARCHAR(30)) RETURNS INT LANGUAGE plpgsql AS $$
BEGIN

    RETURN (SELECT COUNT(p.*) AS photo_count
            FROM accounts AS a
                     LEFT JOIN accounts_photos AS ap ON a.id = ap.account_id
                     LEFT JOIN photos AS p ON p.id = ap.photo_id
            WHERE a.username = account_username);
END;
$$;

-- TEST FUNC
SELECT
    udf_accounts_photos_count ('ssantryd') AS photos_count;