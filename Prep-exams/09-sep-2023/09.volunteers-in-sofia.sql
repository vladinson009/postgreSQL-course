SELECT
    v.name AS volunteers,
    v.phone_number,
    TRIM(
        BOTH
        FROM
            RIGHT(
                TRIM(
                    BOTH
                    FROM
                        v.address
                ),
                -7
            )
    ) AS address
FROM
    volunteers AS v
    JOIN volunteers_departments AS vd ON v.department_id = vd.id
WHERE
    vd.department_name = 'Education program assistant'
    AND v.address ILIKE '%Sofia%'
ORDER BY
    v.name;