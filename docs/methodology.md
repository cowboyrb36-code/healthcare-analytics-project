📘 Methodology
Overview
This methodology outlines the structured, end‑to‑end workflow used to complete the Healthcare Analytics Project. It follows the same analytical lifecycle used by healthcare data analysts, BI developers, and population health teams inside hospitals and payer organizations.

The process includes:

Data ingestion

Data cleaning and standardization

Exploratory analysis

Insight development

Predictive risk scoring

Dashboard design

Documentation and communication

Each step is intentional and aligned with real‑world healthcare analytics practices.

1. Data Ingestion
The dataset was imported into BigQuery for scalable SQL analysis.
Initial steps included:

Reviewing column names and data types

Checking for missing values

Identifying inconsistent formats

Validating numeric and date fields

Confirming row counts and uniqueness

This ensured the dataset was ready for structured cleaning.

2. Data Cleaning & Standardization
A dedicated SQL script (01_data_cleaning.sql) was used to clean and prepare the dataset.

Key cleaning steps:

Field Standardization
Renamed columns to consistent, readable formats

Standardized categorical values (e.g., “Male” vs “M”)

Converted billing amounts to numeric

Data Quality Fixes
Removed duplicate rows

Validated date fields

Ensured Length_of_Stay was numeric

Checked for nulls in critical fields

Creation of Clean View
A reusable clean view was created: healthanalysis.clean_data

This view serves as the foundation for all downstream analysis.

3. Exploratory Data Analysis (EDA)
EDA was performed using SQL (02_exploratory_analysis.sql) to understand baseline patterns.

Key EDA tasks:

Frequency of medical conditions

Most common medications

Test result distribution

Patient volume by hospital and doctor

Insurance provider distribution

Admission type breakdown

This step guided the direction of deeper analysis.

4. Clinical, Operational & Financial Insights
Three dedicated SQL modules were created:

Clinical Insights (03_clinical_insights.sql)
Abnormal test rate by condition

Abnormal test rate by medication

Abnormal test rate by hospital

Gender‑based outcome comparison

Length of stay analysis

Operational Insights (04_operational_insights.sql)
Doctor patient volume

Hospital patient volume

Admission type patterns

Medication utilization

Financial Insights (05_financial_insights.sql)
Billing by condition

Billing by hospital

Billing by insurance provider

Cost variation across patient groups

These insights reflect real healthcare KPIs used by clinical and operational leaders.

5. Predictive Risk Score Model
A SQL‑based risk model (06_risk_score_model.sql) was developed to classify patients into risk tiers.

Risk Factors Used
Age > 60

Emergency admission

Length of stay > 5 days

High‑risk conditions (Hypertension, Diabetes, Obesity)

Abnormal test results

Outputs
risk_score (0–6)

risk_tier (Low, Medium, High)

This demonstrates predictive thinking without requiring machine learning.

6. Dashboard Design (Tableau)
A Tableau dashboard was created to visualize:

KPIs
Total patients

Average LOS

Average billing

Abnormal test rate

Top conditions

Top insurers

Visuals
Abnormal rate by condition

LOS by condition

Billing by hospital

Patient volume by doctor

Insurance provider distribution

Risk score distribution

Screenshots are stored in /dashboards/screenshots.

7. Documentation & Communication
Clear documentation was created to support the project:

README.md — project summary

/docs/project_overview.md — business context

/docs/methodology.md — this methodology

/docs/insights_summary.md — key findings

/docs/risk_model_explanation.md — predictive model logic
