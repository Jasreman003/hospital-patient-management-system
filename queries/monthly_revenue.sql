USE hospital_management;

SELECT
    YEAR(billed_on) AS year,
    MONTH(billed_on) AS month,
    SUM(total_amount) AS total_revenue,
    SUM(paid_amount) AS collected_revenue,
    SUM(total_amount - paid_amount) AS outstanding_amount
FROM billing
GROUP BY
    YEAR(billed_on),
    MONTH(billed_on)
ORDER BY
    year,
    month;