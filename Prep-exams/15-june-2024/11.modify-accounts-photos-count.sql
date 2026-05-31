CREATE
OR REPLACE PROCEDURE udp_modify_account (
    address_street VARCHAR(30),
    address_town VARCHAR(30)
) LANGUAGE plpgsql AS $$
BEGIN
    UPDATE accounts AS a
    SET job_title = CONCAT_WS(' ', '(Remote)', job_title)
    WHERE a.id IN (SELECT account_id
                   FROM addresses
                   WHERE addresses.street = address_street
                     AND addresses.town = address_town);
END;
$$;