
  create view "dvdrental"."public"."stg_dverental_inventory__dbt_tmp"
    
    
  as (
    with source_inventory as (

    select * from "dvdrental"."public"."inventory"

),

final as (
	select * from source_inventory
)

select * from final
  );