with source_inventory as (

    select * from "dvdrental"."public"."inventory"

),

final as (
	select * from source_inventory
)

select * from final