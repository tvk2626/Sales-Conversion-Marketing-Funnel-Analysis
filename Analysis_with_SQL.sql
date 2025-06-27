-- Create A Database for Sale Conversion Analysis
CREATE DATABASE SaleConversionDB;
USE SaleConversionDB;


-- Retrive the data from the customers table
SELECT * FROM customers;

-- 1. Most Responsive Customer Segments
SELECT 
    Age_bins,
    Income_groups,
    Marital_Status,
    ROUND(AVG(Average_Response_Rate), 2) AS avg_response_rate
FROM customers
GROUP BY Age_bins, Income_groups, Marital_Status
ORDER BY avg_response_rate DESC;

-- 2. Aggregate campaign response by marital status or education level

-- 1. Campaign Response by Marital Status
SELECT 
    Marital_Status,
    COUNT(*) AS total_customers,
    SUM(Accepted_1st_Campaign + Accepted_2nd_Campaign + Accepted_3rd_Campaign + 
        Accepted_4th_Campaign + Accepted_5th_Campaign) AS total_accepted,
    ROUND(AVG(Average_Response_Rate), 2) AS avg_response_rate
FROM customers
GROUP BY Marital_Status
ORDER BY total_accepted DESC;

-- 2. Campaign Response by Education Level
SELECT 
    Education,
    COUNT(*) AS total_customers,
    ROUND(AVG(Average_Response_Rate), 2) AS avg_response_rate
FROM customers
GROUP BY Education
ORDER BY avg_response_rate DESC;

-- 4. Average Spending & Conversion by Income Group
SELECT 
    Income_groups,
    ROUND(AVG(Spending), 2) AS avg_spending,
    ROUND(AVG(Average_Response_Rate), 2) AS avg_response
FROM customers
GROUP BY Income_groups
ORDER BY avg_spending DESC;