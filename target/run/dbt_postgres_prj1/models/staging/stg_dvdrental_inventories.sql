
  create view "dvdrental"."public"."stg_dvdrental_inventories__dbt_tmp"
    
    
  as (
    with source_inventory as (

    select * from "dvdrental"."public"."inventory"

),

final as (
	select * from source_inventory
)

select * from final
  );