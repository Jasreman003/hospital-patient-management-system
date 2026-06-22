USE hospital_management;

SELECT
    d.name AS doctor_name,
    d.specialization,
    d.department,

    COUNT(a.appointment_id) AS total_appointments,

    SUM(
        CASE 
            WHEN a.status = 'completed'
            THEN 1
            ELSE 0
        END
    ) AS completed_appointments,

    SUM(
        CASE 
            WHEN a.status = 'scheduled'
            THEN 1
            ELSE 0
        END
    ) AS scheduled_appointments,

    SUM(
        CASE 
            WHEN a.status = 'cancelled'
            THEN 1
            ELSE 0
        END
    ) AS cancelled_appointments

FROM doctors d

LEFT JOIN appointments a
ON d.doctor_id = a.doctor_id

GROUP BY
    d.doctor_id,
    d.name,
    d.specialization,
    d.department

ORDER BY total_appointments DESC;