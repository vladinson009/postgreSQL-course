CREATE
OR REPLACE PROCEDURE sp_transfer_money (
    sender_id INT,
    receiver_id INT,
    amount NUMERIC(19, 4)
) LANGUAGE plpgsql AS $$
BEGIN
    CALL sp_withdraw_money(sender_id, amount);
    CALL sp_deposit_money(receiver_id, amount);
END;
$$;