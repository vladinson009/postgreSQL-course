SELECT
    a.name AS animal,
    TO_CHAR(a.birthdate, 'YYYY') AS birth_year,
    at.animal_type
FROM
    animals AS a
    LEFT JOIN owners AS o ON a.owner_id = o.id
    LEFT JOIN animal_types AS at ON a.animal_type_id = at.id
WHERE
    a.owner_id IS NULL
    AND AGE ('2022-01-01', a.birthdate) < INTERVAL '5 years'
    AND at.animal_type != 'Birds'
ORDER BY
    a.name;