CREATE TABLE
    notification_emails (
        id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        recipient_id INT NOT NULL,
        subject TEXT NOT NULL,
        body TEXT NOT NULL
    );

CREATE
OR REPLACE FUNCTION trigger_fn_send_email_on_balance_change () RETURNS TRIGGER LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO notification_emails(recipient_id, subject, body)
    VALUES (NEW.account_id, CONCAT_WS(' ', 'Balance change for account:', NEW.account_id),
            CONCAT_WS(' ', 'On', CURRENT_TIME, 'your balance was changed from', NEW.old_sum, 'to',
                      NEW.new_sum || '.'));
    RETURN NEW;
END;
$$;

CREATE
OR REPLACE TRIGGER tr_send_email_on_balance_change
AFTER
UPDATE ON logs FOR EACH ROW
EXECUTE FUNCTION trigger_fn_send_email_on_balance_change ();