USE hospital_management;

SELECT

    p.name AS patient_name,

    adm.admitted_on,

    adm.discharged_on,

    DATEDIFF(
        COALESCE(adm.discharged_on, CURRENT_DATE),
        adm.admitted_on
    ) AS days_stayed,

    b.total_amount,

    b.paid_amount,

    (b.total_amount - b.paid_amount) AS pending_amount,

    b.payment_status

FROM billing b

JOIN admissions adm
ON b.admission_id = adm.admission_id

JOIN patients p
ON adm.patient_id = p.patient_id

WHERE b.payment_status != 'paid'

ORDER BY pending_amount DESC;