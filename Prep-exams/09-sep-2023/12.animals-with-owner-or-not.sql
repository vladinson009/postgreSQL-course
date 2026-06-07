CREATE
OR REPLACE PROCEDURE sp_animals_with_owners_or_not (animal_name VARCHAR(30), OUT output VARCHAR(30)) LANGUAGE plpgsql AS $$
DECLARE
    --output VARCHAR(30);
BEGIN
    SELECT o.name
    INTO output
    FROM animals AS a
             LEFT JOIN owners AS o ON a.owner_id = o.id
    WHERE a.name = animal_name;

    IF output IS NULL THEN
       output := 'For adoption';
    END IF;
    RAISE NOTICE '%', output;
END;
$$;