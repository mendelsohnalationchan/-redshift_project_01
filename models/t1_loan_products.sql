{{ 
  config(
    materialized = "table"
  ) 
}}

select 
  * 
from acme_bank_db.public.t1_loan_products