USE hospital_management;

SELECT
    d.department,
    COUNT(a.appointment_id) AS total_appointments
FROM doctors d

JOIN appointments a
ON d.doctor_id = a.doctor_id

GROUP BY d.department

ORDER BY total_appointments DESC;