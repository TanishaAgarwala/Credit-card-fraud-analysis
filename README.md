# 💳 Credit Card Fraud Detection & Analysis
End-to-end fraud detection using SQL,Python, and Machine Learning with behavioral insights

## 📊 Overview
This project analyzes 284,000+ credit card transactions to identify fraud patterns using SQL and Python.

## 🛠️ Tools & Technologies
- Python (Pandas, Scikit-learn)
- SQL (PostgreSQL)
- Machine Learning (Logistic Regression)

## 🎯 Objectives
- Detect fraudulent transactions
- Understand fraud behavior patterns
- Generate business insights for fraud prevention

## 📈 Key Insights
- Fraud is NOT concentrated in high-value transactions
- Most fraud occurs in mid-range transaction amounts
- Fraud events occur every ~5–6 minutes (continuous activity)
- Sudden transaction spikes are NOT strong fraud indicators
- High-value transactions are mostly legitimate

## 🧠 Techniques Used
- Logistic Regression model for classification
- Window functions (LAG, RANK, cumulative SUM)
- Time-based analysis
- Anomaly detection using SQL

## 📊 Model Performance

- Accuracy: ~94–95%
- Evaluated using confusion matrix and classification report
- Balanced performance on both fraud and non-fraud classes
- Addressed class imbalance using appropriate techniques

## 📂 Project Structure
- `credit_card_fraud_detection.ipynb` → Python model
- `fraud_analysis.sql` → SQL queries and insights

## 📌 Dataset
https://www.kaggle.com/datasets/mlg-ulb/creditcardfraud

## 🚀 Conclusion
Fraud detection requires behavioral and pattern-based analysis rather than relying solely on transaction amount.
