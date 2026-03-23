CREATE TABLE transactions (
    Time FLOAT,
    V1 FLOAT,
    V2 FLOAT,
    V3 FLOAT,
    V4 FLOAT,
    V5 FLOAT,
    V6 FLOAT,
    V7 FLOAT,
    V8 FLOAT,
    V9 FLOAT,
    V10 FLOAT,
    V11 FLOAT,
    V12 FLOAT,
    V13 FLOAT,
    V14 FLOAT,
    V15 FLOAT,
    V16 FLOAT,
    V17 FLOAT,
    V18 FLOAT,
    V19 FLOAT,
    V20 FLOAT,
    V21 FLOAT,
    V22 FLOAT,
    V23 FLOAT,
    V24 FLOAT,
    V25 FLOAT,
    V26 FLOAT,
    V27 FLOAT,
    V28 FLOAT,
    Amount FLOAT,
    Class INT
);

SELECT * FROM transactions
LIMIT 10;

SELECT COUNT(*) FROM transactions;

--Q1)What is the overall fraud rate?

SELECT COUNT(*) AS Total_transactions,
       SUM(CASE WHEN class =1 THEN 1 ELSE 0 END ) AS fraud_txns,
	   ROUND(SUM(CASE WHEN class =1 THEN 1 ELSE 0 END )*100.0/COUNT(*),2) AS Overall_fraud_rate
FROM transactions

--Q2)Fraud vs Normal Transaction Distribution

SELECT COUNT(*) AS Total_transactions,
       SUM(CASE WHEN class =1 THEN 1 ELSE 0 END ) AS fraud_txns,
       SUM(CASE WHEN class =0 THEN 1 ELSE 0 END ) AS legit_txns
FROM transactions;

--Q3)Average Transaction Value (Fraud vs Normal)

SELECT  Class, Avg(Amount) AS Avg_transaction_value
FROM transactions
Group By Class;

--Q4)Fraud Rate by Amount Bucket

Select MAX(Amount) AS Max_amount,
MIN(Amount) AS Min_amount
FROM transactions

SELECT CASE
WHEN AMOUNT< 100 THEN 'Very Low'
WHEN AMOUNT BETWEEN 100 AND 500 THEN 'Low'
WHEN AMOUNT BETWEEN 500 AND 1000 THEN 'Medium'
ELSE  'High'
END AS bucket,
COUNT(*) AS total ,
SUM(Class) AS fraud_count,
Round(SUM(Class)*100.0/COUNT(*) ,2) AS fraud_rate
FROM transactions
GROUP BY bucket;

--Q5)Fraud Trend Over Time

SELECT FLOOR((time :: bigint/3600)% 24) AS hour,
COUNT(*) AS Total_txns,
SUM(CASE WHEN Class=1 THEN 1 ELSE 0 END) AS fraud_txns
FROM transactions
GROUP BY hour
ORDER BY hour;

--Q6)Which transactions look most suspicious based on unusually high transaction amounts?

SELECT Amount,Class
FROM transactions
ORDER BY Amount DESC
LIMIT 20;

--Q7)Do sudden jumps in transaction amount indicate suspicious behavior?

WITH temp AS(
SELECT time, Amount,Class,
Amount-LAG(Amount)OVER(ORDER BY time) AS amount_diff
FROM transactions
)
SELECT * FROM temp
WHERE ABS(amount_diff) >500;

--Q8)Time Gap Between Fraud Transactions

SELECT avg(time_diff) AS time_gap 
FROM
(SELECT time - LAG(time) OVER(ORDER BY time) AS time_diff
FROM transactions 
WHERE Class =1
)t;

--Q9)How does fraud accumulate over time?

SELECT time, Class,
SUM(Class)OVER (ORDER BY time) AS cumulative_fraud
FROM transactions;

--Q10) Ranking Fraud Transactions

SELECT Amount,
Rank() OVER (ORDER BY Amount DESC) AS fraud_ranking
FROM transactions
WHERE Class =1;

--Q11) Are fraud transactions concentrated among top-value transactions?

SELECT COUNT(*) AS fraud_in_top1_percent
FROM(SELECT * FROM transactions
ORDER BY Amount DESC
LIMIT (SELECT Count(*)/100 FROM transactions))
t
WHERE Class =1;

