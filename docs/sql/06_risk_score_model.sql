-- ============================================================
-- 06_risk_score_model.sql
-- SQL-Based Predictive Risk Score Model
-- Author: Tarik Smith
-- ============================================================

WITH risk_factors AS (
  SELECT
    *,
    
    -- Age Risk: Age > 60 → 1 point
    CASE WHEN Age > 60 THEN 1 ELSE 0 END AS age_risk,

    -- Emergency Admission → 1 point
    CASE WHEN Admission_Type = 'Emergency' THEN 1 ELSE 0 END AS emergency_risk,

    -- Length of Stay > 5 days → 1 point
    CASE WHEN Length_of_Stay > 5 THEN 1 ELSE 0 END AS los_risk,

    -- High-Risk Chronic Conditions → 1 point
    CASE 
      WHEN Medical_Condition IN ('Hypertension', 'Diabetes', 'Obesity') 
      THEN 1 ELSE 0 
    END AS condition_risk,

    -- Abnormal Test Results → 2 points
    CASE 
      WHEN Test_Results = 'Abnormal' THEN 2 ELSE 0 
    END AS test_result_risk

  FROM `my-healthcare-project-487800.healthanalysis.clean_data`
)

SELECT
  *,
  
  -- Total Risk Score (0–6)
  age_risk
  + emergency_risk
  + los_risk
  + condition_risk
  + test_result_risk AS risk_score,

  -- Risk Tier Classification
  CASE
    WHEN (age_risk + emergency_risk + los_risk + condition_risk + test_result_risk) >= 4 
      THEN 'High'
    WHEN (age_risk + emergency_risk + los_risk + condition_risk + test_result_risk) BETWEEN 2 AND 3
      THEN 'Medium'
    ELSE 'Low'
  END AS risk_tier

FROM risk_factors
ORDER BY risk_score DESC;
