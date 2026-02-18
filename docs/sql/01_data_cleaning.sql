-- ============================================================
-- 01_data_cleaning.sql
-- Purpose: Clean and standardize the healthcare dataset
-- Author: Tarik Smith
-- ============================================================

-- STEP 1: Inspect raw table structure
SELECT *
FROM `my-healthcare-project-487800.healthanalysis.data_analysis_raw`
LIMIT 100;


-- STEP 2: Standardize column names and formats
-- Create a cleaned version of the dataset with consistent naming

CREATE OR REPLACE TABLE `my-healthcare-project-487800.healthanalysis.healthcare_cleaned` AS
SELECT
  -- Demographics
  TRIM(Name) AS Name,
  SAFE_CAST(Age AS INT64) AS Age,
  TRIM(Gender) AS Gender,

  -- Clinical
  TRIM(Medical_Condition) AS Medical_Condition,
  TRIM(Medication) AS Medication,
  TRIM(Test_Results) AS Test_Results,

  -- Operational
  TRIM(Doctor) AS Doctor,
  TRIM(Hospital) AS Hospital,
  TRIM(Admission_Type) AS Admission_Type,

  -- Dates
  PARSE_DATE('%Y-%m-%d', Date_of_Admission) AS Date_of_Admission,
  PARSE_DATE('%Y-%m-%d', Discharge_Date) AS Discharge_Date,

  -- Derived: Length of Stay
  DATE_DIFF(
    PARSE_DATE('%Y-%m-%d', Discharge_Date),
    PARSE_DATE('%Y-%m-%d', Date_of_Admission),
    DAY
  ) AS Length_of_Stay,

  -- Financial
  SAFE_CAST(REPLACE(Billing_Amount, ',', '') AS FLOAT64) AS Billing_Amount,

  -- Insurance
  TRIM(Insurance_Provider) AS Insurance_Provider

FROM `my-healthcare-project-487800.healthanalysis.data_analysis_raw`;


-- STEP 3: Create a clean view for analysis
CREATE OR REPLACE VIEW `healthanalysis.clean_data` AS
SELECT *
FROM `my-healthcare-project-487800.healthanalysis.healthcare_cleaned`;


-- STEP 4: Validate cleaned data
SELECT
  COUNT(*) AS total_rows,
  COUNTIF(Age IS NULL) AS missing_age,
  COUNTIF(Billing_Amount IS NULL) AS missing_billing,
  COUNTIF(Date_of_Admission IS NULL OR Discharge_Date IS NULL) AS missing_dates
FROM `healthanalysis.clean_data`;


-- STEP 5: Check for duplicates
SELECT
  Name, Date_of_Admission, Medical_Condition,
  COUNT(*) AS duplicate_count
FROM `healthanalysis.clean_data`
GROUP BY Name, Date_of_Admission, Medical_Condition
HAVING COUNT(*) > 1;


-- STEP 6: Preview final cleaned dataset
SELECT *
FROM `healthanalysis.clean_data`
LIMIT 100;
