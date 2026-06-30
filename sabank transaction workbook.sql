-- Databricks notebook source
SELECT *
FROM bank_transaction.sabank_transaction.sabank_transactions_dataset;

--Checking each column for null/ blanks
SELECT
    COUNT(*) AS total,
    SUM(CASE WHEN Transaction_ID   = '' OR Transaction_ID   IS NULL THEN 1 ELSE 0 END) AS missing_id,
    SUM(CASE WHEN Transaction_Date = '' OR Transaction_Date IS NULL THEN 1 ELSE 0 END) AS missing_date,
    SUM(CASE WHEN Amount_ZAR       = '' OR Amount_ZAR       IS NULL THEN 1 ELSE 0 END) AS missing_amount,
    SUM(CASE WHEN Status           = '' OR Status           IS NULL THEN 1 ELSE 0 END) AS missing_status,
    SUM(CASE WHEN City             = '' OR City             IS NULL THEN 1 ELSE 0 END) AS missing_city
FROM bank_transaction.sabank_transaction.sabank_transactions_dataset;

-- Checking for inconsistent casing in Status column
SELECT Status,
    COUNT(*) AS Frequency
FROM bank_transaction.sabank_transaction.sabank_transactions_dataset
GROUP BY Status
ORDER BY Frequency DESC;

--Checking for incosistent casing in Account_type
SELECT Account_type,
    COUNT(*) AS Frequency
FROM bank_transaction.sabank_transaction.sabank_transactions_dataset
GROUP BY Account_type
ORDER BY Frequency DESC;

--Spot duplicates Transaction_IDs
SELECT Transaction_ID,
    COUNT(*) AS Occurrences
FROM bank_transaction.sabank_transaction.sabank_transactions_dataset
GROUP BY Transaction_ID
HAVING COUNT(*) > 1
ORDER BY Occurrences DESC;
