-- ============================================================
-- 01_data_cleaning.sql
-- Full Cleaning Script for Healthcare Dataset
-- Author: Tarik Smith
-- ============================================================

CREATE OR REPLACE TABLE `my-healthcare-project-487800.healthanalysis.healthcare_cleaned` AS
SELECT
  -- Patient name
  TRIM(Name) AS Name,

  -- Demographics
  SAFE_CAST(Age AS INT64) AS Age,
  TRIM(Gender) AS Gender,
  TRIM(`Blood Type`) AS Blood_Type,
  TRIM(`Medical Condition`) AS Medical_Condition,

  -- Dates
  `Date of Admission` AS Date_of_Admission,
  `Discharge Date` AS Discharge_Date,

  -- Provider / facility / insurance
  TRIM(Doctor) AS Doctor,
  TRIM(Hospital) AS Hospital,
  TRIM(`Insurance Provider`) AS Insurance_Provider,

  -- Billing Amount (FULL CLEANING)
  SAFE_CAST(
    REGEXP_REPLACE(
      REGEXP_REPLACE(
        REGEXP_REPLACE(
          TRIM(`Billing Amount`),
          r'[\$,]', ''          -- remove $ and commas
        ),
        r'\((.*)\)', '-\\1'     -- convert (123.45) → -123.45
      ),
      r' ', ''                  -- remove stray spaces
    ) AS FLOAT64
  ) AS Billing_Amount,

  -- Room number
  SAFE_CAST(`Room Number` AS INT64) AS Room_Number,

  -- Admission type
  TRIM(`Admission Type`) AS Admission_Type,

  -- Medication / test results
  TRIM(Medication) AS Medication,
  TRIM(`Test Results`) AS Test_Results,

  -- Length of stay (recomputed)
  DATE_DIFF(
    `Discharge Date`,
    `Date of Admission`,
    DAY
  ) AS Length_of_Stay

FROM `my-healthcare-project-487800.Healthcare_rawdata.healthcare_rawdata`;
