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


