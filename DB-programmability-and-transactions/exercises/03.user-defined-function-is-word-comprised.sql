CREATE
OR REPLACE FUNCTION fn_is_word_comprised (set_of_letters VARCHAR(50), word VARCHAR(50)) RETURNS BOOLEAN LANGUAGE plpgsql AS $$
DECLARE
    current_char CHAR(1);
    idx          INT := 1;
BEGIN
    word := LOWER(word);
    set_of_letters := LOWER(set_of_letters);

    WHILE idx <= LENGTH(word)
        LOOP
            current_char := SUBSTRING(word, idx, 1);

            IF current_char ~ '[a-z]' THEN
                IF POSITION(current_char IN set_of_letters) = 0 THEN
                    RETURN FALSE;
                END IF;
            END IF;
            idx := idx + 1;
        END LOOP;
    RETURN TRUE;
END;
$$;