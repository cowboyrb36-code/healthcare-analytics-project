-- ============================================================
-- 07_all_queries_with_alias.sql
-- Consolidated SQL Queries Using Alias "c"
-- Author: Tarik Smith
-- ============================================================

-- ============================================================
-- SECTION 1 — EXPLORATORY ANALYSIS (EDA)
-- ============================================================

-- 1. Row Count
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

-- 3. Gender Distribution
SELECT Gender, COUNT(*) AS count
FROM `my-healthcare-project-487800.healthanalysis.clean_data` AS c
GROUP BY Gender
ORDER BY count DESC;

-- 4. Most Common Conditions
SELECT Medical_Condition, COUNT(*) AS patient_count
FROM `my-healthcare-project-487800.healthanalysis.clean_data` AS c
GROUP BY Medical_Condition
ORDER BY patient_count DESC;

-- 5. Billing Distribution
SELECT
  MIN(Billing_Amount) AS min_bill,
  MAX(Billing_Amount) AS max_bill,
  AVG(Billing_Amount) AS avg_bill,
  APPROX_QUANTILES(Billing_Amount, 10) AS deciles
FROM `my-healthcare-project-487800.healthanalysis.clean_data` AS c;

-- ============================================================
-- SECTION 2 — CLINICAL INSIGHTS
-- ============================================================

-- 6. Abnormal Test Rate by Condition
SELECT
  Medical_Condition,
  COUNT(*) AS total_tests,
  SUM(CASE WHEN Test_Results = 'Abnormal' THEN 1 END) AS abnormal_count,
  ROUND(SUM(CASE WHEN Test_Results = 'Abnormal' THEN 1 END) / COUNT(*) * 100, 2) AS abnormal_rate_pct
FROM `my-healthcare-project-487800.healthanalysis.clean_data` AS c
GROUP BY Medical_Condition
ORDER BY abnormal_rate_pct DESC;

-- 7. LOS by Condition
SELECT
  Medical_Condition,
  ROUND(AVG(Length_of_Stay), 2) AS avg_los,
  MIN(Length_of_Stay) AS min_los,
  MAX(Length_of_Stay) AS max_los
FROM `my-healthcare-project-487800.healthanalysis.clean_data` AS c
GROUP BY Medical_Condition
ORDER BY avg_los DESC;

-- ============================================================
-- SECTION 3 — OPERATIONAL INSIGHTS
-- ============================================================

-- 8. Patient Volume by Hospital
SELECT Hospital, COUNT(*) AS total_patients
FROM `my-healthcare-project-487800.healthanalysis.clean_data` AS c
GROUP BY Hospital
ORDER BY total_patients DESC;

-- 9. Patient Volume by Doctor
SELECT Doctor, COUNT(*) AS total_patients
FROM `my-healthcare-project-487800.healthanalysis.clean_data` AS c
GROUP BY Doctor
ORDER BY total_patients DESC;

-- 10. Admission Type Distribution
SELECT Admission_Type, COUNT(*) AS total_admissions
FROM `my-healthcare-project-487800.healthanalysis.clean_data` AS c
GROUP BY Admission_Type
ORDER BY total_admissions DESC;

-- ============================================================
-- SECTION 4 — FINANCIAL INSIGHTS
-- ============================================================

-- 11. Billing by Condition
SELECT
  Medical_Condition,
  ROUND(AVG(Billing_Amount), 2) AS avg_cost,
  SUM(Billing_Amount) AS total_cost
FROM `my-healthcare-project-487800.healthanalysis.clean_data` AS c
GROUP BY Medical_Condition
ORDER BY total_cost DESC;

-- 12. Billing by Hospital
SELECT
  Hospital,
  ROUND(AVG(Billing_Amount), 2) AS avg_cost,
  SUM(Billing_Amount) AS total_cost
FROM `my-healthcare-project-487800.healthanalysis.clean_data` AS c
GROUP BY Hospital
ORDER BY total_cost DESC;

-- 13. Billing by Insurance Provider
SELECT
  Insurance_Provider,
  ROUND(AVG(Billing_Amount), 2) AS avg_cost,
  SUM(Billing_Amount) AS total_cost
FROM `my-healthcare-project-487800.healthanalysis.clean_data` AS c
GROUP BY Insurance_Provider
ORDER BY total_cost DESC;

-- ============================================================
-- SECTION 5 — RISK SCORE MODEL
-- ============================================================

-- 14. Risk Score + Tier
WITH risk_factors AS (
  SELECT
    *,
    CASE WHEN Age > 60 THEN 1 ELSE 0 END AS age_risk,
    CASE WHEN Admission_Type = 'Emergency' THEN 1 ELSE 0 END AS emergency_risk,
    CASE WHEN Length_of_Stay > 5 THEN 1 ELSE 0 END AS los_risk,
    CASE WHEN Medical_Condition IN ('Hypertension', 'Diabetes', 'Obesity') THEN 1 ELSE 0 END AS condition_risk,
    CASE WHEN Test_Results = 'Abnormal' THEN 2 ELSE 0 END AS test_result_risk
  FROM `my-healthcare-project-487800.healthanalysis.clean_data`
)
SELECT
  *,
  age_risk + emergency_risk + los_risk + condition_risk + test_result_risk AS risk_score,
  CASE
    WHEN (age_risk + emergency_risk + los_risk + condition_risk + test_result_risk) >= 4 THEN 'High'
    WHEN (age_risk + emergency_risk + los_risk + condition_risk + test_result_risk) BETWEEN 2 AND 3 THEN 'Medium'
    ELSE 'Low'
  END AS risk_tier
FROM risk_factors
ORDER BY risk_score DESC;

-- ============================================================
-- END OF CONSOLIDATED QUERY FILE
-- ============================================================
