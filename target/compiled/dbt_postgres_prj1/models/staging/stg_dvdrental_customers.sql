with source_customer as (

    select * from "dvdrental"."public"."customer"

),

final as (
	select * from source_customer
)

select * from final