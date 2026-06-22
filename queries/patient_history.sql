USE hospital_management;

SELECT 
    p.name AS patient_name,
    a.scheduled_at,
    d.name AS doctor_name,
    d.specialization,
    a.status,
    a.notes,
    pr.medication,
    pr.dosage,
    pr.duration_days
FROM patients p

JOIN appointments a
ON p.patient_id = a.patient_id

JOIN doctors d
ON a.doctor_id = d.doctor_id

LEFT JOIN prescriptions pr
ON a.appointment_id = pr.appointment_id

WHERE p.patient_id = 1

ORDER BY a.scheduled_at DESC;