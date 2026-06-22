USE hospital_management;

SELECT
    ward,

    COUNT(bed_id) AS total_beds,

    SUM(
        CASE 
            WHEN is_occupied = TRUE 
            THEN 1
            ELSE 0
        END
    ) AS occupied_beds,

    SUM(
        CASE 
            WHEN is_occupied = FALSE
            THEN 1
            ELSE 0
        END
    ) AS available_beds,

    ROUND(
        (
            SUM(
                CASE 
                    WHEN is_occupied = TRUE
                    THEN 1
                    ELSE 0
                END
            ) 
            / COUNT(bed_id)
        ) * 100,
        2
    ) AS occupancy_percentage

FROM beds

GROUP BY ward;