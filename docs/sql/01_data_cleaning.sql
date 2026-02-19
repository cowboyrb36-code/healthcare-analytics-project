-- ============================================================
-- 01_data_cleaning.sql
-- Full Cleaning Script for Healthcare Dataset
-- Author: Tarik Smith
-- NOTE: This script documents the cleaning logic used to
--       create healthcare_cleaned. The original raw table
--       has been removed from the dataset.
-- ============================================================

CREATE OR REPLACE TABLE `my-healthcare-project-487800.healthanalysis.healthcare_cleaned` AS
SELECT
  SAFE_CAST(Age AS INT64) AS Age,
  TRIM(Gender) AS Gender,
  TRIM(`Blood Type`) AS Blood_Type,
  TRIM(`Medical Condition`) AS Medical_Condition,
  `Date of Admission` AS Date_of_Admission,
  `Discharge Date` AS Discharge_Date,
  TRIM(Doctor) AS Doctor,
  TRIM(Hospital) AS Hospital,
  TRIM(`Insurance Provider`) AS Insurance_Provider,

  SAFE_CAST(
    REGEXP_REPLACE(
      REGEXP_REPLACE(
        REGEXP_REPLACE(TRIM(`Billing Amount`), r'[\$,]', ''),
        r'\((.*)\)', '-\\1'
      ),
      r' ', ''
    ) AS FLOAT64
  ) AS Billing_Amount,

  SAFE_CAST(`Room Number` AS INT64) AS Room_Number,
  TRIM(`Admission Type`) AS Admission_Type,
  TRIM(Medication) AS Medication,
  TRIM(`Test Results`) AS Test_Results,

  DATE_DIFF(`Discharge Date`, `Date of Admission`, DAY) AS Length_of_Stay

FROM `my-healthcare-project-487800.healthanalysis.RAW_TABLE_PLACEHOLDER`;
