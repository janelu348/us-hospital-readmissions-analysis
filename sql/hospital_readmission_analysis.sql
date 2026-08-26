
-- Query 1: Readmissions by medical condition


SELECT
    condition,
    COUNT(*) AS hospital_condition_rows,
    COUNT(DISTINCT facility_id) AS hospitals,
    ROUND(
        100.0 * AVG(high_readmission),
        1
    ) AS high_readmission_pct,
    ROUND(
        AVG(excess_readmission_ratio),
        3
    ) AS average_ratio
FROM readmissions
GROUP BY condition
ORDER BY high_readmission_pct DESC;



-- Query 2: Readmissions by hospital ownership


SELECT
    h.ownership_group,
    COUNT(*) AS hospital_condition_rows,
    COUNT(
        DISTINCT h.facility_id
    ) AS hospitals,
    ROUND(
        100.0 * AVG(r.high_readmission),
        1
    ) AS high_readmission_pct
FROM readmissions AS r
INNER JOIN hospitals AS h
    ON r.facility_id = h.facility_id
GROUP BY h.ownership_group
ORDER BY high_readmission_pct DESC;



-- Query 3: Patient experience by readmission group


SELECT
    CASE
        WHEN r.high_readmission = 1
            THEN 'Above expected'
        ELSE 'At or below expected'
    END AS readmission_group,

    COUNT(*) AS hospital_condition_rows,

    ROUND(
        AVG(p.nurse_communication_pct),
        1
    ) AS nurse_communication_pct,

    ROUND(
        AVG(p.doctor_communication_pct),
        1
    ) AS doctor_communication_pct,

    ROUND(
        AVG(p.staff_responsiveness_pct),
        1
    ) AS staff_responsiveness_pct,

    ROUND(
        AVG(p.discharge_information_pct),
        1
    ) AS discharge_information_pct,

    ROUND(
        AVG(p.definitely_recommend_pct),
        1
    ) AS definitely_recommend_pct,

    ROUND(
        AVG(p.care_transition_score),
        1
    ) AS care_transition_score

FROM readmissions AS r

INNER JOIN patient_experience AS p
    ON r.facility_id = p.facility_id

GROUP BY r.high_readmission
ORDER BY r.high_readmission;

