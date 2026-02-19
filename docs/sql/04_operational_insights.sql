-- ============================================================
-- 04_operational_insights.sql
-- Operational Insights for healthcare_cleaned dataset
-- Author: Tarik Smith
-- ============================================================

-- ------------------------------------------------------------
-- 1. Patient Volume by Hospital
-- ------------------------------------------------------------
SELECT
  Hospital,
  COUNT(*) AS total_patients
FROM `my-healthcare-project-487800.healthanalysis.clean_data` AS c
GROUP BY Hospital
ORDER BY total_patients DESC;

-- ------------------------------------------------------------
-- 2. Patient Volume by Doctor
-- ------------------------------------------------------------
SELECT
  Doctor,
  COUNT(*) AS total_patients
FROM `my-healthcare-project-487800.healthanalysis.clean_data` AS c
GROUP BY Doctor
ORDER BY total_patients DESC;

-- ------------------------------------------------------------
-- 3. Admission Type Distribution
-- ------------------------------------------------------------
SELECT
  Admission_Type,
  COUNT(*) AS total_admissions,
  ROUND(COUNT(*) / SUM(COUNT(*)) OVER() * 100, 2) AS pct_of_total
FROM `my-healthcare-project-487800.healthanalysis.clean_data` AS c
GROUP BY Admission_Type
ORDER BY total_admissions DESC;

-- ------------------------------------------------------------
-- 4. Hospital Workload by Admission Type
-- ------------------------------------------------------------
SELECT
  Hospital,
  Admission_Type,
  COUNT(*) AS admissions
FROM `my-healthcare-project-487800.healthanalysis.clean_data` AS c
GROUP BY Hospital, Admission_Type
ORDER BY Hospital, admissions DESC;

-- ------------------------------------------------------------
-- 5. Doctor Workload by Medical Condition
-- ------------------------------------------------------------
SELECT
  Doctor,
  Medical_Condition,
  COUNT(*) AS patient_count
FROM `my-healthcare-project-487800.healthanalysis.clean_data` AS c
GROUP BY Doctor, Medical_Condition
ORDER BY Doctor, patient_count DESC;

-- ------------------------------------------------------------
-- 6. Medication Utilization by Hospital
-- ------------------------------------------------------------
SELECT
  Hospital,
  Medication,
  COUNT(*) AS usage_count
FROM `my-healthcare-project-487800.healthanalysis.clean_data` AS c
GROUP BY Hospital, Medication
ORDER BY Hospital, usage
