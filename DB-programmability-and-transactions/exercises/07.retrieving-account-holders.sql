CREATE
OR REPLACE PROCEDURE sp_retrieving_holders_with_balance_higher_than (searched_balance NUMERIC) LANGUAGE plpgsql AS $$
DECLARE
    holder_record RECORD;
    total_balance NUMERIC;
BEGIN

    FOR holder_record IN
        SELECT ah.id,
               ah.first_name,
               ah.last_name
        FROM account_holders AS ah
        ORDER BY ah.first_name, ah.last_name

        LOOP
            SELECT SUM(a.balance)
            INTO total_balance
            FROM accounts AS a
            WHERE a.account_holder_id = holder_record.id;

            IF total_balance > searched_balance THEN
                RAISE NOTICE 'NOTICE: % % - %',
                    holder_record.first_name,
                    holder_record.last_name,
                    total_balance;
            END IF;

        END LOOP;
END;
$$;

CALL sp_retrieving_holders_with_balance_higher_than (200000);