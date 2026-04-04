# 💳 Credit Card Fraud Detection & Analysis
End-to-end fraud detection using SQL,Python, and Machine Learning with behavioral insights

## 📊 Overview
This project analyzes 284,000+ credit card transactions to identify fraud patterns using SQL and Python.

## 🛠️ Tools & Technologies
- Python (Pandas, Scikit-learn)
- SQL (PostgreSQL)
- Machine Learning (Logistic Regression, Decision Tree)

## 🎯 Objectives
- Detect fraudulent transactions
- Understand fraud behavior patterns
- Compare ML models for fraud detection performance

## ⚙️ Methodology

- Performed data preprocessing and feature analysis on transaction dataset  
- Handled class imbalance using `class_weight='balanced'`  
- Built classification models: Logistic Regression and Decision Tree  
- Evaluated models using precision, recall, and confusion matrix  
- Conducted SQL-based behavioral analysis to identify fraud patterns  

## 📊 Model Comparison

- **Decision Tree:** Higher recall → detects more fraud but increases false positives  
- **Logistic Regression:** Better balance of precision and recall → more reliable  

👉 **Final Choice:** Logistic Regression due to better generalization and lower false alarm rate  

## 📈 Key Insights
- Fraud is NOT concentrated in high-value transactions
- Most fraud occurs in mid-range transaction amounts
- Fraud events occur every ~5–6 minutes (continuous activity)
- Sudden transaction spikes are NOT strong fraud indicators
- High-value transactions are mostly legitimate

## 🧠 Techniques Used

- Logistic Regression & Decision Tree for classification
- Model evaluation using precision, recall, and confusion matrix
- Window functions (LAG, RANK, cumulative SUM) for behavioral analysis
- Time-based fraud pattern analysis
- SQL-based anomaly detection

## 📊 Model Performance & Comparison

- Logistic Regression achieved balanced precision and recall, making it more reliable for fraud detection
- Decision Tree showed higher recall but introduced more false positives
- Evaluated models using classification report and confusion matrix
- Addressed class imbalance using class_weight='balanced'

## 📂 Project Structure
- `credit_card_fraud_detection.ipynb` → Python model
- `fraud_analysis.sql` → SQL queries and insights

## 📌 Dataset
https://www.kaggle.com/datasets/mlg-ulb/creditcardfraud

## 🚀 Conclusion
Fraud detection requires behavioral and pattern-based analysis rather than relying solely on transaction amount.
