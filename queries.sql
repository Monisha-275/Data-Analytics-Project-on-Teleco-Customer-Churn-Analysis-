CREATE DATABASE churn_project;
USE churn_project;
drop database churn_project
CREATE TABLE customers (
    customerID VARCHAR(50),
    gender VARCHAR(20),
    SeniorCitizen INT,
    Partner VARCHAR(10),
    Dependents VARCHAR(10),
    tenure INT,
    PhoneService VARCHAR(10),
    MultipleLines VARCHAR(30),
    InternetService VARCHAR(30),
    OnlineSecurity VARCHAR(30),
    OnlineBackup VARCHAR(30),
    DeviceProtection VARCHAR(30),
    TechSupport VARCHAR(30),
    StreamingTV VARCHAR(30),
    StreamingMovies VARCHAR(30),
    Contract VARCHAR(30),
    PaperlessBilling VARCHAR(10),
    PaymentMethod VARCHAR(50),
    MonthlyCharges FLOAT,
    TotalCharges FLOAT,
    Churn VARCHAR(10)
);
SELECT COUNT(*) AS churned_customers
FROM cleaned_telco_churn;

SELECT COUNT(*) AS churned_customers
FROM cleaned_telco_churn
WHERE Churn='Yes';

SELECT
    (SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS churn_rate
FROM cleaned_telco_churn;

SELECT Contract,
       COUNT(*) AS total_customers
FROM cleaned_telco_churn
GROUP BY Contract;

SELECT Contract,
       Churn,
       COUNT(*) AS total
FROM cleaned_telco_churn
GROUP BY Contract, Churn;

SELECT Churn,
       AVG(MonthlyCharges) AS avg_monthly_charge
FROM cleaned_telco_churn
GROUP BY Churn;

SELECT PaymentMethod,
       COUNT(*) AS total_customers
FROM cleaned_telco_churn
GROUP BY PaymentMethod;

SELECT customerID,
       tenure,
       Contract,
       MonthlyCharges
FROM cleaned_telco_churn
WHERE tenure < 12
AND Contract='Month-to-month'
AND Churn='Yes';

SELECT TechSupport,
       Churn,
       COUNT(*) AS total
FROM cleaned_telco_churn
GROUP BY TechSupport, Churn;

SELECT InternetService,
       Churn,
       COUNT(*) AS total
FROM cleaned_telco_churn
GROUP BY InternetService, Churn;

SELECT SUM(MonthlyCharges) AS revenue_loss
FROM cleaned_telco_churn
WHERE Churn='Yes';

drop table cleaned_telco_churn

