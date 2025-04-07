with source_film as (

    select * from "dvdrental"."public"."film"

),

final as (
	select * from source_film
)

select * from final