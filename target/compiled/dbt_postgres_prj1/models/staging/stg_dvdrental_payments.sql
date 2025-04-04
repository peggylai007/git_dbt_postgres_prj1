with source_payment as (

    select * from "dvdrental"."public"."payment"

),

final as (
	select * from source_payment
)

select * from final