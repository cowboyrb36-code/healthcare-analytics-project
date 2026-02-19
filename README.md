📊 Healthcare Analytics Project
A full SQL + Tableau analysis of patient outcomes, utilization, and risk.

🧭 Project Overview
This project analyzes a synthetic healthcare dataset to uncover insights across clinical quality, hospital operations, financial performance, and patient risk. It demonstrates end‑to‑end analytics skills using SQL, data cleaning, exploratory analysis, KPI development, and dashboard‑ready insights.

The work reflects real healthcare analytics workflows, including:

Cleaning and standardizing raw patient data

Running exploratory SQL to understand patterns

Producing clinical, operational, and financial insights

Building a SQL‑based patient risk score

Designing a Tableau dashboard for executive‑level reporting

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
