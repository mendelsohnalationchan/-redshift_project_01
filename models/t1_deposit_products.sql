{{ 
  config(
    materialized = "table"
  ) 
}}

select 
  * 
from acme_bank_db.public.t1_deposit_products