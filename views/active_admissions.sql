USE hospital_management;

CREATE VIEW active_admissions AS

SELECT

    a.admission_id,

    p.name AS patient_name,

    p.phone,

    b.ward,

    b.bed_number,

    a.admitted_on,

    DATEDIFF(
        CURRENT_DATE,
        a.admitted_on
    ) AS days_admitted

FROM admissions a

JOIN patients p
ON a.patient_id = p.patient_id

JOIN beds b
ON a.bed_id = b.bed_id

WHERE a.discharged_on IS NULL;