USE hospital_management;

SELECT
    p.patient_id,
    p.name,
    a.admitted_on,
    a.discharged_on,

    DATEDIFF(
        COALESCE(a.discharged_on, CURRENT_DATE),
        a.admitted_on
    ) AS stay_duration_days

FROM admissions a

JOIN patients p
ON a.patient_id = p.patient_id

ORDER BY stay_duration_days DESC;