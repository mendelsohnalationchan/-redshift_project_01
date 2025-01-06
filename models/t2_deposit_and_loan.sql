{{ 
  config(
    materialized = "table"
  ) 
}}

SELECT 
    t1.cust_unique_id,
    t1.loan_acc_no,
    t1.int_accrued,
    t1.loan_balance,
    t1.branch_number,
    t2.dep_acct_bal,
    t2.dep_acct_type,
    t2.store_date,
    t2.curr_sts
FROM 
    acme_bank_db.dbt_schema.t1_loan_products t1
LEFT JOIN 
    acme_bank_db.dbt_schema.t1_deposit_products t2
ON 
    t1.cust_unique_id = t2.cust_unique_id