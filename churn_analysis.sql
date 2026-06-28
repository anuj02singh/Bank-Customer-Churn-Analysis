CREATE TABLE bank_churn (
    RowNumber       INT,
    CustomerId      BIGINT,
    Surname         VARCHAR(50),
    CreditScore     INT,
    Geography       VARCHAR(20),
    Gender          VARCHAR(10),
    Age             INT,
    Tenure          INT,
    Balance         FLOAT,
    NumOfProducts   INT,
    HasCrCard       INT,
    IsActiveMember  INT,
    EstimatedSalary FLOAT,
    Exited          INT
);


SELECT * FROM bank_churn LIMIT 10;



-- Queary 1. Total customers % Churn Rates
SELECT 
     COUNT(*) AS total_customers,
	 SUM(Exited) AS total_churned,
	 ROUND(SUM(Exited) * 100.0 / COUNT(*), 2)
	 AS churn_rate_percent
FROM bank_churn;



-- Queary2. churn by country
SELECT
    Geography,
	COUNT(*) AS total_customers,
	SUM(Exited) AS churned,
	ROUND(SUM(Exited) * 100.0 / COUNT(*), 2)
    AS churn_rate_percent
FROM Bank_churn
GROUP BY Geography
ORDER BY churn_rate_percent DESC;




--Q.3 CHURN BY GENDER
SELECT 
    Gender,
	COUNT(*) AS total_customers,
	SUM(Exited) AS Churned,
	ROUND(SUM(Exited) * 100.0 / COUNT(*), 2)
	AS churn_rate_percent 
FROM bank_churn
GROUP BY Gender
ORDER BY churn_rate_percent DESC;




-- Query 4: Active vs Inactive Churn
SELECT 
    IsActiveMember,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned,
    ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) 
    AS churn_rate_percent
FROM bank_churn
GROUP BY IsActiveMember
ORDER BY churn_rate_percent DESC;





-- Query 5: High Balance Churned Customers
SELECT 
    Geography,
    Gender,
    Age,
    Balance,
    NumOfProducts,
    IsActiveMember
FROM bank_churn
WHERE Exited = 1 
AND Balance > 100000
ORDER BY Balance DESC
LIMIT 10;