
  create view "dvdrental"."public"."stg_dvdrental_rentals__dbt_tmp"
    
    
  as (
    with source_rental as (

    select * from "dvdrental"."public"."rental"

),

final as (
	select * from source_rental
)

select * from final
  );