
  create view "dvdrental"."public"."stg_dvdrental_customers__dbt_tmp"
    
    
  as (
    with source_customer as (

    select * from "dvdrental"."public"."customer"

),

final as (
	select * from source_customer
)

select * from final
  );