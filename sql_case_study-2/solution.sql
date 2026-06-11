-- part A. Customer Nodes Exploration
--1. How many unique nodes are there?
  SELECT COUNT(DISTINCT node_id) AS unique_nodes
   FROM customer_nodes;




--2. What is the number of nodes per region?
SELECT
    r.region_name,
    COUNT(DISTINCT cn.node_id) AS node_count
FROM customer_nodes cn
JOIN regions r
    ON cn.region_id = r.region_id
GROUP BY r.region_name
ORDER BY r.region_name;

--3 How many customers are allocated to each region?
SELECT
    r.region_name,
    COUNT(DISTINCT cn.customer_id) AS customer_count
FROM customer_nodes cn
JOIN regions r
    ON cn.region_id = r.region_id
GROUP BY r.region_name
ORDER BY r.region_name;

--4. How many days on average are customers reallocated to a different node?
SELECT
    ROUND(AVG(DATEDIFF(end_date,start_date)),2) AS avg_reallocation_days
FROM customer_nodes
WHERE end_date <> '9999-12-31';



--5. Median, 80th and 95th percentile reallocation days by region














--  part B. Customer Transactions

 --1. What is the unique count and total amount for each transaction type?


 SELECT
    txn_type,
    COUNT(*) AS transaction_count,
    SUM(txn_amount) AS total_amount
FROM customer_transactions
GROUP BY txn_type
ORDER BY txn_type;

--2. What is the average total historical deposit counts and amounts for all customers?
WITH customer_deposits AS
(
    SELECT
        customer_id,
        COUNT(*) AS deposit_count,
        SUM(txn_amount) AS deposit_amount
    FROM customer_transactions
    WHERE txn_type = 'deposit'
    GROUP BY customer_id
)
SELECT
    ROUND(AVG(deposit_count),2) AS avg_deposit_count,
    ROUND(AVG(deposit_amount),2) AS avg_deposit_amount
FROM customer_deposits;


--3. For each month, how many customers make more than 1 deposit and either 1 purchase or 1 withdrawal?