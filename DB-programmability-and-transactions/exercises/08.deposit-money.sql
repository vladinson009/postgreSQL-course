CREATE
OR REPLACE PROCEDURE sp_deposit_money (account_id INT, money_amount NUMERIC(19, 4)) LANGUAGE plpgsql AS $$
BEGIN
    UPDATE accounts
    SET balance = balance + money_amount
    WHERE id = account_id;

    COMMIT;
END;
$$;

CALL sp_deposit_money (1, 200);

CALL sp_deposit_money (2, 500);

CALL sp_deposit_money (4, 1000);

SELECT
    id,
    account_holder_id,
    balance
FROM
    accounts
WHERE
    id IN (1, 10, 14)