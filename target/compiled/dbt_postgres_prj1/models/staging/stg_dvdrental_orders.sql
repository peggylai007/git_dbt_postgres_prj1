with source_rental as (

    select * from "dvdrental"."public"."rental"

),

final as (
	select * from source_rental
)

select * from final