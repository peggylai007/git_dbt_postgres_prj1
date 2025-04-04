with source_rental as (

    select * from {{ source('dvdrental_source','rental') }}

),

final as (
	select * from source_rental
)

select * from final       