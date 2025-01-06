{{ 
  config(
    materialized = "table"
  ) 
}}

WITH t1 AS (
    SELECT 
        cust_unique_id,
        loan_acc_no,
        loan_balance,
        dep_acct_bal,
        (loan_balance + dep_acct_bal) AS normalized_balance,
        curr_sts
    FROM 
        {{ref('t2_deposit_and_loan')}}
)
SELECT 
    cust_unique_id,
    loan_acc_no,
    curr_sts,
    SUM(loan_balance) AS total_loan_balance,
    SUM(dep_acct_bal) AS total_acct_balance,
    SUM(normalized_balance) AS total_norm_balance
FROM 
    t1
WHERE 
    curr_sts IS NOT NULL
GROUP BY 
    cust_unique_id,
    loan_acc_no,
    curr_sts