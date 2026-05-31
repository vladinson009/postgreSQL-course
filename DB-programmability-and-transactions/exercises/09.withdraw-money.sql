CREATE
OR REPLACE PROCEDURE sp_withdraw_money (account_id INT, money_amount NUMERIC(19, 4)) LANGUAGE plpgsql AS $$
BEGIN
    IF (SELECT balance FROM accounts WHERE accounts.id = account_id) - money_amount < 0 THEN
        RAISE NOTICE 'NOTICE: Insufficient balance to withdraw %', money_amount;
    ELSE
        UPDATE accounts
        SET balance = balance - money_amount
        WHERE accounts.id = account_id;
        COMMIT;
    END IF;
END;
$$;

--TEST CALLS
CALL sp_withdraw_money (3, 5050.7500);

CALL sp_withdraw_money (6, 5437.0000);

SELECT
    id,
    account_holder_id,
    balance
FROM
    accounts
WHERE
    id = 3