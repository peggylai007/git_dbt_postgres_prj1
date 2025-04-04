with source_payment as (

    select * from {{ source('dvdrental_source','payment') }}

),

final as (
	select * from source_payment
)

select * from final       