
  create view "dvdrental"."public"."stg_dvdrental_payments__dbt_tmp"
    
    
  as (
    with source_payment as (

    select * from "dvdrental"."public"."payment"

),

final as (
	select * from source_payment
)

select * from final
  );