-- ============================================================
-- 05_financial_insights.sql
-- Financial Insights for healthcare_cleaned dataset
-- Author: Tarik Smith
-- ============================================================

-- ------------------------------------------------------------
-- 1. Total Billing Amount (Overall Financial Summary)
-- ------------------------------------------------------------
SELECT
  ROUND(SUM(Billing_Amount), 2) AS total_billed,
  ROUND(AVG(Billing_Amount), 2) AS avg_bill,
  MIN(Billing_Amount) AS min_bill,
  MAX(Billing_Amount) AS max_bill
FROM `my-healthcare-project-487800.healthanalysis.clean_data` AS c;

-- ------------------------------------------------------------
-- 2. Average Billing by Medical Condition
-- ------------------------------------------------------------
SELECT
  Medical_Condition,
  ROUND(AVG(Billing_Amount), 2) AS avg_cost,
  SUM(Billing_Amount) AS total_cost,
  COUNT(*) AS patient_count
FROM `my-healthcare-project-487800.healthanalysis.clean_data` AS c
GROUP BY Medical_Condition
ORDER BY total_cost DESC;

-- ------------------------------------------------------------
-- 3. Billing by Hospital (Financial Performance)
-- ------------------------------------------------------------
SELECT
  Hospital,
  ROUND(AVG(Billing_Amount), 2) AS avg_cost,
  SUM(Billing_Amount) AS total_cost,
  COUNT(*) AS total_patients
FROM `my-healthcare-project-487800.healthanalysis.clean_data` AS c
GROUP BY Hospital
ORDER BY total_cost DESC;

-- ------------------------------------------------------------
-- 4. Billing by Insurance Provider (Payer Mix Revenue)
-- ------------------------------------------------------------
SELECT
  Insurance_Provider,
  ROUND(AVG(Billing_Amount), 2) AS avg_cost,
  SUM(Billing_Amount) AS total_cost,
  COUNT(*) AS member_count
FROM `my-healthcare-project-487800.healthanalysis.clean_data` AS c
GROUP BY Insurance_Provider
ORDER BY total_cost DESC;

-- ------------------------------------------------------------
-- 5. Cost per Day (Billing Efficiency)
-- ------------------------------------------------------------
SELECT
  Medical_Condition,
  ROUND(AVG(Billing_Amount / NULLIF(Length_of_Stay, 0)), 2) AS avg_cost_per_day,
  ROUND(AVG(Length_of_Stay
