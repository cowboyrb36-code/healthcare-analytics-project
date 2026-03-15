📘 1. Overview & KPIs
A high‑level executive summary displaying:

Total Patients

Average Billing per Patient

Average Length of Stay

Cost Tier Distribution

Global filters (Medical Condition, Insurance Provider, Cost Tier)

Purpose: Provide leadership with a fast, 3‑second snapshot of operational and financial health.

💰 2. Cost & Billing
A financial performance dashboard featuring:

Billing by Medical Condition

Insurance Provider Billing (segmented by cost tier)

Global filters

Purpose: Identify which conditions and payers drive the highest billing and cost exposure.

🏥 3. Clinical Metrics
A clinical variation dashboard featuring:

Length of Stay by Condition

Optional LOS breakdowns by cost tier or insurance provider

Global filters

Purpose: Reveal inefficiencies, variation, and opportunities for clinical optimization.

📈 4. Admissions Over Time
A trend analysis dashboard featuring:

Admissions Over Time (2019–2024)

Global filters

Purpose: Visualize patient volume trends, seasonality, and year‑to‑year shifts to support capacity planning.

🔍 Key Insights
High‑cost patients represent a small portion of the population but a disproportionately large share of total billing.

Diabetes, Obesity, and Arthritis consistently drive higher billing amounts.

Length of stay varies significantly by condition, indicating potential areas for clinical improvement.

Admissions show clear year‑to‑year fluctuations, suggesting seasonal or operational patterns.

🧠 Technical Workflow
Data Cleaning & Preparation
Removed nulls, standardized categories, validated date formats

Engineered features (Cost Tier, LOS Category, Age Group, etc.)

Exported cleaned dataset to BigQuery for SQL analysis

SQL Analysis (BigQuery)
Aggregations for billing, LOS, admissions, and payer mix

Validation queries to ensure data integrity

Feature engineering and summary tables

Visualization (Tableau)
KPI tiles

Bar charts, stacked bars, bubble charts

Global filter synchronization

Multi‑dashboard narrative structure

🛠️ Tools Used
Tableau — dashboard design & storytelling

BigQuery SQL — data validation & analysis

Excel / Google Sheets — initial cleaning

GitHub — version control & documentation

🎯 Outcome
This project demonstrates my ability to:

Build a complete analytics product from raw data

Communicate insights clearly to technical and non‑technical audiences

Design dashboards aligned with real healthcare analytics standards

Deliver a polished, professional portfolio piece suitable for hiring managers

👤 Author
Tarik Smith  
Data Analyst | SQL | Tableau | BigQuery | Healthcare Analytics

📁 Repository Structure
healthcare-analytics-project/
│
├── README.md
│
├── data/
│   ├── raw/
│   ├── cleaned/
│   └── dictionary/
│
├── sql/
│   ├── 01_data_cleaning.sql
│   ├── 02_exploratory_analysis.sql
│   ├── 03_clinical_insights.sql
│   ├── 04_operational_insights.sql
│   ├── 05_financial_insights.sql
│   ├── 06_risk_score_model.sql
│   └── 07_all_queries_with_alias.sql
│
├── dashboards/
│   ├── tableau/
│   └── screenshots/
│
└── docs/
    ├── project_overview.md
    ├── methodology.md
    ├── insights_summary.md
    └── risk_model_explanation.md
    

🧹 Data Cleaning Summary
The dataset was cleaned using SQL in BigQuery. Key steps included:

Standardizing column names

Converting Billing_Amount to numeric (FLOAT)

Normalizing categorical fields

Validating and parsing date fields

Recomputing Length_of_Stay

Removing duplicates

Creating a reusable analysis view:
healthanalysis.clean_data

This view powers all downstream analysis.

🔍 Exploratory Analysis

Initial SQL exploration answered foundational questions such as:

Most common medical conditions

Most frequently prescribed medications

Distribution of test results

Patient volume by hospital and doctor

Insurance provider distribution

This step establishes the baseline understanding needed for deeper analysis.


🏥 Clinical Insights
Clinical analysis focuses on quality and outcomes:

Abnormal Test Rates
By medical condition

By medication

By hospital

By gender

Length of Stay (LOS)
Average LOS by condition

LOS distribution across patient groups

These insights help identify high‑risk conditions and potential quality issues.


⚙️ Operational Insights

Operational metrics include:

Doctors with the highest patient volume

Hospitals with the highest patient volume

Admission type distribution

Medication utilization patterns

These insights support staffing, resource allocation, and workflow optimization.


💰 Financial Insights

Financial analysis includes:

Average billing amount by condition

Billing by hospital

Billing by insurance provider

Cost patterns across patient groups

These insights support payer strategy and revenue optimization.


🔮 Predictive Risk Score Model

A SQL‑based risk model assigns points based on:

Age > 60

Emergency admission

Length of stay > 5 days

High‑risk conditions (Hypertension, Diabetes, Obesity)

Abnormal test results

Each patient receives:

risk_score (0–6)

risk_tier (Low, Medium, High)

This demonstrates predictive thinking without requiring machine learning.


📈 Tableau Dashboard

The dashboard includes:

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

This provides a complete, executive‑ready view of patient outcomes and utilization.


🔍 Project Objectives
This project answers key healthcare business questions:

Clinical
Which conditions have the highest abnormal test rates

Which medications correlate with abnormal results

Which hospitals show higher abnormal patterns

Which conditions lead to the longest LOS

Operational
Which doctors treat the most patients

Which hospitals handle the highest volume

What admission types are most common

Financial
Which conditions drive the highest billing

Billing patterns by hospital

Billing patterns by insurance provider

Payer Mix
Which insurance provider appears most frequently

Condition mix by insurer

Predictive
What factors predict patient risk

How to classify patients into Low, Medium, and High risk tiers



🛠️ Skills Demonstrated
SQL (BigQuery)

Data cleaning & transformation

Healthcare analytics

KPI development

Exploratory data analysis

Predictive modeling logic

Dashboard design (Tableau)

Documentation & storytelling


🚀 How to Use This Project

Review the SQL scripts in the /sql folder

Explore the documentation in /docs

View dashboard screenshots in /dashboards/screenshots

Clone the repo and run the queries using BigQuery

🙌 Author
Tarik Smith  
Healthcare Analytics | SQL | Tableau | Data Storytelling
