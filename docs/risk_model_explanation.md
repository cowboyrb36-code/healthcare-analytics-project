📄 Risk Model Explanation
Overview
This document explains the logic, structure, and purpose of the SQL‑based patient risk score model used in the Healthcare Analytics Project. The model classifies patients into Low, Medium, and High risk tiers based on clinical, operational, and demographic factors commonly associated with higher acuity and resource utilization in healthcare settings.

The goal of the model is not to replace machine learning, but to demonstrate how rule‑based predictive logic can be implemented directly in SQL to support population health, care management, and operational planning.

🎯 Purpose of the Risk Model
Healthcare organizations use risk scoring to:

Identify high‑acuity patients

Prioritize care management resources

Predict length of stay and readmission risk

Support financial forecasting

Improve quality and patient outcomes

This SQL model simulates a simplified version of those real‑world tools.

🧠 Risk Factors Used in the Model
The model assigns points based on five clinically meaningful factors:

1. Age > 60
Older patients typically have higher acuity, more comorbidities, and longer recovery times.
Points: 1

2. Emergency Admission
Emergency encounters often indicate acute or unstable conditions.
Points: 1

3. Length of Stay > 5 Days
Extended LOS is strongly correlated with complications, severity, and cost.
Points: 1

4. High‑Risk Chronic Conditions
Conditions such as Hypertension, Diabetes, and Obesity are associated with higher clinical risk.
Points: 1

5. Abnormal Test Results
Abnormal results are the strongest indicator of clinical instability.
Points: 2 (weighted higher)

risk_score = age_risk
           + emergency_risk
           + los_risk
           + condition_risk
           + test_result_risk

Possible scores range from 0 to 6.

📊 Risk Tier Classification
The model assigns each patient to a tier:

High Risk (score ≥ 4)
Patients likely experiencing acute or complex conditions.
Often associated with:

Longer LOS

Higher billing

More abnormal test results

Higher resource utilization

Medium Risk (score 2–3)
Patients with moderate clinical concerns or early signs of instability.

Low Risk (score 0–1)
Patients with stable conditions and minimal risk indicators.

🧩 Why SQL Works for Risk Modeling
While machine learning models can be more sophisticated, SQL‑based risk scoring is:

Transparent

Explainable

Easy to audit

Fast to compute

Simple to deploy in dashboards

Common in real healthcare analytics teams

Many hospitals and payers use rule‑based scoring for triage, care management, and quality reporting.

📈 Insights from the Risk Model
The risk model revealed several patterns:

High‑risk patients had significantly higher abnormal test rates.

Emergency admissions were heavily represented in the High‑risk tier.

High‑risk patients had longer LOS and higher billing.

Chronic conditions were strong predictors of elevated risk.

These findings align with real‑world clinical and operational behavior.
