USE HealthcareAnalyticsDB;
GO

-------------------------------------------------------
-- 1. TOTAL PATIENTS
-------------------------------------------------------

SELECT 
COUNT(DISTINCT patient_id) AS total_patients
FROM patients;



-------------------------------------------------------
-- 2. TOTAL VISITS
-------------------------------------------------------

SELECT 
COUNT(*) AS total_visits
FROM visits;



-------------------------------------------------------
-- 3. PATIENT DISTRIBUTION BY GENDER
-------------------------------------------------------

SELECT 
gender,
COUNT(*) AS patient_count
FROM patients
GROUP BY gender
ORDER BY patient_count DESC;



-------------------------------------------------------
-- 4. PATIENT DISTRIBUTION BY CITY
-------------------------------------------------------

SELECT 
city,
COUNT(*) AS total_patients
FROM patients
GROUP BY city
ORDER BY total_patients DESC;



-------------------------------------------------------
-- 5. AGE GROUP ANALYSIS
-------------------------------------------------------

SELECT 
CASE 
WHEN age < 18 THEN 'Children'
WHEN age BETWEEN 18 AND 35 THEN 'Young Adults'
WHEN age BETWEEN 36 AND 55 THEN 'Middle Age'
ELSE 'Senior'
END AS age_group,
COUNT(*) AS patient_count
FROM patients
GROUP BY 
CASE 
WHEN age < 18 THEN 'Children'
WHEN age BETWEEN 18 AND 35 THEN 'Young Adults'
WHEN age BETWEEN 36 AND 55 THEN 'Middle Age'
ELSE 'Senior'
END
ORDER BY patient_count DESC;



-------------------------------------------------------
-- 6. VISITS TREND BY YEAR
-------------------------------------------------------

SELECT 
YEAR(visit_date) AS visit_year,
COUNT(*) AS total_visits
FROM visits
GROUP BY YEAR(visit_date)
ORDER BY visit_year;



-------------------------------------------------------
-- 7. VISITS TREND BY MONTH
-------------------------------------------------------

SELECT 
YEAR(visit_date) AS year,
MONTH(visit_date) AS month,
COUNT(*) AS visits
FROM visits
GROUP BY YEAR(visit_date), MONTH(visit_date)
ORDER BY year, month;



-------------------------------------------------------
-- 8. MOST COMMON TREATMENTS
-------------------------------------------------------

SELECT 
treatment_type,
COUNT(*) AS treatment_count
FROM visits
GROUP BY treatment_type
ORDER BY treatment_count DESC;



-------------------------------------------------------
-- 9. TREATMENT OUTCOME DISTRIBUTION
-------------------------------------------------------

SELECT 
outcome,
COUNT(*) AS outcome_count
FROM visits
GROUP BY outcome
ORDER BY outcome_count DESC;



-------------------------------------------------------
-- 10. RECOVERY RATE
-------------------------------------------------------

SELECT 
CAST(
SUM(CASE WHEN outcome = 'Recovered' THEN 1 ELSE 0 END) * 100.0 
/ COUNT(*) 
AS DECIMAL(5,2)) AS recovery_rate_percentage
FROM visits;



-------------------------------------------------------
-- 11. AVERAGE TREATMENT COST
-------------------------------------------------------

SELECT 
AVG(treatment_cost) AS avg_treatment_cost
FROM visits;



-------------------------------------------------------
-- 12. TREATMENT COST BY TYPE
-------------------------------------------------------

SELECT 
treatment_type,
AVG(treatment_cost) AS avg_cost
FROM visits
GROUP BY treatment_type
ORDER BY avg_cost DESC;



-------------------------------------------------------
-- 13. AVERAGE LENGTH OF STAY
-------------------------------------------------------

SELECT 
AVG(length_of_stay_days) AS avg_length_of_stay
FROM visits;



-------------------------------------------------------
-- 14. AVERAGE SATISFACTION SCORE
-------------------------------------------------------

SELECT 
AVG(satisfaction_score) AS avg_satisfaction_score
FROM visits;



-------------------------------------------------------
-- 15. SATISFACTION BY TREATMENT TYPE
-------------------------------------------------------

SELECT 
treatment_type,
AVG(satisfaction_score) AS avg_satisfaction
FROM visits
GROUP BY treatment_type
ORDER BY avg_satisfaction DESC;



-------------------------------------------------------
-- 16. DOCTOR PERFORMANCE (VISIT COUNT)
-------------------------------------------------------

SELECT 
d.doctor_name,
d.department,
COUNT(v.visit_id) AS total_visits
FROM doctors d
JOIN visits v
ON d.doctor_id = v.doctor_id
GROUP BY d.doctor_name, d.department
ORDER BY total_visits DESC;



-------------------------------------------------------
-- 17. DOCTOR SATISFACTION SCORE
-------------------------------------------------------

SELECT 
d.doctor_name,
AVG(v.satisfaction_score) AS avg_patient_satisfaction
FROM doctors d
JOIN visits v
ON d.doctor_id = v.doctor_id
GROUP BY d.doctor_name
ORDER BY avg_patient_satisfaction DESC;



-------------------------------------------------------
-- 18. DEPARTMENT PERFORMANCE
-------------------------------------------------------

SELECT 
d.department,
COUNT(v.visit_id) AS total_patients,
AVG(v.treatment_cost) AS avg_cost,
AVG(v.satisfaction_score) AS avg_satisfaction
FROM doctors d
JOIN visits v
ON d.doctor_id = v.doctor_id
GROUP BY d.department
ORDER BY total_patients DESC;



-------------------------------------------------------
-- 19. MOST EXPENSIVE DEPARTMENTS
-------------------------------------------------------

SELECT 
d.department,
AVG(v.treatment_cost) AS avg_cost
FROM doctors d
JOIN visits v
ON d.doctor_id = v.doctor_id
GROUP BY d.department
ORDER BY avg_cost DESC;



-------------------------------------------------------
-- 20. PATIENT VISITS BY CITY
-------------------------------------------------------

SELECT 
p.city,
COUNT(v.visit_id) AS visit_count
FROM patients p
JOIN visits v
ON p.patient_id = v.patient_id
GROUP BY p.city
ORDER BY visit_count DESC;



-------------------------------------------------------
-- 21. TOP 10 MOST ACTIVE PATIENTS
-------------------------------------------------------

SELECT TOP 10
p.patient_name,
COUNT(v.visit_id) AS visit_count
FROM patients p
JOIN visits v
ON p.patient_id = v.patient_id
GROUP BY p.patient_name
ORDER BY visit_count DESC;



-------------------------------------------------------
-- 22. OPERATIONAL PERFORMANCE
-------------------------------------------------------

SELECT 
department,
AVG(patients_handled) AS avg_patients_handled,
AVG(avg_wait_time_minutes) AS avg_wait_time,
AVG(bed_utilization_percent) AS avg_bed_utilization
FROM operations
GROUP BY department
ORDER BY avg_patients_handled DESC;



-------------------------------------------------------
-- 23. MONTHLY PATIENT LOAD
-------------------------------------------------------

SELECT 
department,
month,
patients_handled
FROM operations
ORDER BY department, month;



-------------------------------------------------------
-- 24. DEPARTMENTS WITH HIGH WAIT TIME
-------------------------------------------------------

SELECT 
department,
AVG(avg_wait_time_minutes) AS avg_wait_time
FROM operations
GROUP BY department
ORDER BY avg_wait_time DESC;



-------------------------------------------------------
-- 25. BED UTILIZATION ANALYSIS
-------------------------------------------------------

SELECT 
department,
AVG(bed_utilization_percent) AS avg_bed_utilization
FROM operations
GROUP BY department
ORDER BY avg_bed_utilization DESC;