-- ============================================================
-- 02_exploratory_analysis.sql
-- Exploratory Data Analysis (EDA) for healthcare_cleaned dataset
-- Author: Tarik Smith
-- ============================================================

-- 1. Basic Row Count
SELECT COUNT(*) AS total_rows
FROM `my-healthcare-project-487800.healthanalysis.clean_data` AS c;

-- 2. Missingness Check
SELECT
  SUM(CASE WHEN Name IS NULL THEN 1 END) AS missing_name,
  SUM(CASE WHEN Age IS NULL THEN 1 END) AS missing_age,
  SUM(CASE WHEN Gender IS NULL THEN 1 END) AS missing_gender,
  SUM(CASE WHEN Medical_Condition IS NULL THEN 1 END) AS missing_condition,
  SUM(CASE WHEN Billing_Amount IS NULL THEN 1 END) AS missing_billing,
  SUM(CASE WHEN Length_of_Stay IS NULL THEN 1 END) AS missing_los
FROM `my-healthcare-project-487800.healthanalysis.clean_data` AS c;

-- 3. Age Distribution
SELECT
  MIN(Age) AS min_age,
  MAX(Age) AS max_age,
  AVG(Age) AS avg_age
FROM `my-healthcare-project-487800.healthanalysis.clean_data` AS c;

-- 4. Gender Distribution
SELECT Gender, COUNT(*) AS count
FROM `my-healthcare-project-487800.healthanalysis.clean_data` AS c
GROUP BY Gender
ORDER BY count DESC;

-- 5. Most Common Medical Conditions
SELECT Medical_Condition, COUNT(*) AS patient_count
FROM `my-healthcare-project-487800.healthanalysis.clean_data` AS c
GROUP BY Medical_Condition
ORDER BY patient_count DESC;

-- 6. Medication Frequency
SELECT Medication, COUNT(*) AS usage_count
FROM `my-healthcare-project-487800.healthanalysis.clean_data` AS c
GROUP BY Medication
ORDER BY usage_count DESC;

-- 7. Hospital Volume
SELECT Hospital, COUNT(*) AS admissions
FROM `my-healthcare-project-487800.healthanalysis.clean_data` AS c
GROUP BY Hospital
ORDER BY admissions DESC;

-- 8. Doctor Volume
SELECT Doctor, COUNT(*) AS patient_count
FROM `my-healthcare-project-487800.healthanalysis.clean_data` AS c
GROUP BY Doctor
ORDER BY patient_count DESC;

-- 9. Insurance Provider Distribution
SELECT Insurance_Provider, COUNT(*) AS member_count
FROM `my-healthcare-project-487800.healthanalysis.clean_data` AS c
GROUP BY Insurance_Provider
ORDER BY member_count DESC;

-- 10. Billing Distribution
SELECT
  MIN(Billing_Amount) AS min_bill,
  MAX(Billing_Amount) AS max_bill,
  AVG(Billing_Amount) AS avg_bill,
  APPROX_QUANTILES(Billing_Amount, 10) AS deciles
FROM `my-healthcare-project-487800.healthanalysis.clean_data` AS c;

-- 11. Length of Stay Distribution
SELECT
  MIN(Length_of_Stay) AS min_los,
  MAX(Length_of_Stay) AS max_los,
  AVG(Length_of_Stay) AS avg_los
FROM `my-healthcare-project-487800.healthanalysis.clean_data` AS c;

-- 12. Admissions by Type
SELECT Admission_Type, COUNT(*) AS count
FROM `my-healthcare-project-487800.healthanalysis.clean_data` AS c
GROUP BY Admission_Type
ORDER BY count DESC;

-- 13. Condition by Gender
SELECT
  Gender,
  Medical_Condition,
  COUNT(*) AS count
FROM `my-healthcare-project-487800.healthanalysis.clean_data` AS c
GROUP BY Gender, Medical_Condition
ORDER BY count DESC;

-- 14. Billing by Condition
SELECT
  Medical_Condition,
  ROUND(AVG(Billing_Amount), 2) AS avg_cost,
  SUM(Billing_Amount) AS total_cost
FROM `my-healthcare-project-487800.healthanalysis.clean_data` AS c
GROUP BY Medical_Condition
ORDER BY total_cost DESC;
