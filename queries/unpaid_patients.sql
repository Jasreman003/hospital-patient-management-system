USE hospital_management;

SELECT
    p.name AS patient_name,
    b.total_amount,
    b.paid_amount,
    (b.total_amount - b.paid_amount) AS pending_amount,
    b.payment_status

FROM billing b

JOIN admissions a
ON b.admission_id = a.admission_id

JOIN patients p
ON a.patient_id = p.patient_id

WHERE b.total_amount > b.paid_amount

ORDER BY pending_amount DESC;