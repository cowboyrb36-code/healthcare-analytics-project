-- ============================================================
-- 03_clinical_insights.sql
-- Clinical Insights for healthcare_cleaned dataset
-- Author: Tarik Smith
-- ============================================================

-- ------------------------------------------------------------
-- 1. Abnormal Test Results by Medical Condition
-- ------------------------------------------------------------
SELECT
  Medical_Condition,
  COUNT(*) AS total_tests,
  SUM(CASE WHEN Test_Results = 'Abnormal' THEN 1 ELSE 0 END) AS abnormal_count,
  ROUND(SUM(CASE WHEN Test_Results = 'Abnormal' THEN 1 ELSE 0 END) 
        / COUNT(*) * 100, 2) AS abnormal_rate_pct
FROM `my-healthcare-project-487800.healthanalysis.clean_data` AS c
GROUP BY Medical_Condition
ORDER BY abnormal_rate_pct DESC;

-- ------------------------------------------------------------
-- 2. Abnormal Test Results by Medication
-- ------------------------------------------------------------
SELECT
  Medication,
  COUNT(*) AS total_tests,
  SUM(CASE WHEN Test_Results = 'Abnormal' THEN 1 ELSE 0 END) AS abnormal_count,
  ROUND(SUM(CASE WHEN Test_Results = 'Abnormal' THEN 1 ELSE 0 END) 
        / COUNT(*) * 100, 2) AS abnormal_rate_pct
FROM `my-healthcare-project-487800.healthanalysis.clean_data` AS c
GROUP BY Medication
ORDER BY abnormal_rate_pct DESC;

-- ------------------------------------------------------------
-- 3. Abnormal Test Results by Hospital
-- ------------------------------------------------------------
SELECT
  Hospital,
  COUNT(*) AS total_tests,
  SUM(CASE WHEN Test_Results = 'Abnormal' THEN 1 ELSE 0 END) AS abnormal_count,
  ROUND(SUM(CASE WHEN Test_Results = 'Abnormal' THEN 1 ELSE 0 END) 
        / COUNT(*) * 100, 2) AS abnormal_rate_pct
FROM `my-healthcare-project-487800.healthanalysis.clean_data` AS c
GROUP BY Hospital
ORDER BY abnormal_rate_pct DESC;

-- ------------------------------------------------------------
-- 4. Abnormal Test Results by Gender
-- ------------------------------------------------------------
SELECT
  Gender,
  COUNT(*) AS total_tests,
  SUM(CASE WHEN Test_Results = 'Abnormal' THEN 1 ELSE 0 END) AS abnormal_count,
  ROUND(SUM(CASE WHEN Test_Results = 'Abnormal' THEN 1 ELSE 0 END) 
        / COUNT(*) * 100, 2) AS abnormal_rate_pct
FROM `my-healthcare-project-487800.healthanalysis.clean_data` AS c
GROUP BY Gender
ORDER BY abnormal_rate_pct DESC;

-- ------------------------------------------------------------
-- 5. Length of Stay (LOS) by Medical Condition
-- ------------------------------------------------------------
SELECT
  Medical_Condition,
  ROUND(AVG(Length_of_Stay), 2) AS avg_los,
  MIN(Length_of_Stay) AS min_los,
  MAX(Length_of_Stay) AS max_los
FROM `my-healthcare-project-487800.healthanalysis.clean_data` AS c
GROUP BY Medical_Condition
ORDER BY avg_los DESC;

-- ------------------------------------------------------------
-- 6. Length of Stay by Hospital
-- ------------------------------------------------------------
SELECT
  Hospital,
  ROUND(AVG(Length_of_Stay), 2) AS avg_los,
  MIN(Length_of_Stay) AS min_los,
  MAX(Length_of_Stay) AS max_los
FROM `my-healthcare-project-487800.healthanalysis.clean_data` AS c
GROUP BY Hospital
ORDER BY avg_los DESC;

-- ------------------------------------------------------------
-- 7. Length of Stay by Admission Type
-- ------------------------------------------------------------
SELECT
  Admission_Type,
  ROUND(AVG(Length_of_Stay), 2) AS avg_los,
  MIN(Length_of_Stay) AS min_los,
  MAX(Length_of_Stay) AS max_los
FROM `my-healthcare-project-487800.healthanalysis.clean_data` AS c
GROUP BY Admission_Type
ORDER BY avg_los DESC;

-- ------------------------------------------------------------
-- 8. High-Risk Conditions (Based on Abnormal Test Rate + LOS)
-- ------------------------------------------------------------
SELECT
  Medical_Condition,
  ROUND(AVG(Length_of_Stay), 2) AS avg_los,
  ROUND(SUM(CASE WHEN Test_Results = 'Abnormal' THEN 1 ELSE 0 END) 
        / COUNT(*) * 100, 2) AS abnormal_rate_pct
FROM `my-healthcare-project-487800.healthanalysis.clean_data` AS c
GROUP BY Medical_Condition
ORDER BY abnormal_rate_pct DESC, avg_los DESC;

-- ------------------------------------------------------------
-- 9. Condition Severity Matrix (LOS + Billing)
-- ------------------------------------------------------------
SELECT
  Medical_Condition,
  ROUND(AVG(Length_of_Stay), 2) AS avg_los,
  ROUND(AVG(Billing_Amount), 2) AS avg_cost,
  SUM(Billing_Amount) AS total_cost
FROM `my-healthcare-project-487800.healthanalysis.clean_data` AS c
GROUP BY Medical_Condition
ORDER BY avg_los DESC, avg_cost DESC;

-- End of Clinical Insights Script
-- ============================================================
