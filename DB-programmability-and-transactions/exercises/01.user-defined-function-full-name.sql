--VARIANT 1
CREATE FUNCTION fn_full_name (first_name VARCHAR, last_name VARCHAR) RETURNS VARCHAR LANGUAGE SQL AS $$
SELECT NULLIF(
               CONCAT_WS(
                   ' ',
                   INITCAP(first_name),
                   INITCAP(last_name)
               ), ''
      );
$$
-- VARIANT 2
CREATE FUNCTION fn_full_name (first_name VARCHAR, last_name VARCHAR) RETURNS VARCHAR LANGUAGE SQL AS $$
SELECT CASE
           WHEN first_name IS NULL AND last_name IS NULL THEN NULL
           WHEN first_name IS NULL THEN INITCAP(last_name)
           WHEN last_name IS NULL THEN INITCAP(first_name)
           ELSE INITCAP(first_name) || ' ' || INITCAP(last_name)
           END;
$$
--VARIANT 3 with plpgsql
CREATE
OR REPLACE FUNCTION fn_full_name (first_name VARCHAR, last_name VARCHAR) RETURNS VARCHAR LANGUAGE plpgsql AS $$
BEGIN
    IF first_name IS NULL AND last_name IS NULL THEN
        RETURN NULL;
    ELSIF first_name IS NULL THEN
        RETURN INITCAP(last_name);
    ELSEIF last_name IS NULL THEN
        RETURN INITCAP(first_name);
    ELSE
        RETURN CONCAT_WS(' ', INITCAP(first_name), INITCAP(last_name));
    END IF;
END;
$$