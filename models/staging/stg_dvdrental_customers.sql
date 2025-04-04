with source_customer as (

    select * from {{ source('dvdrental_source','customer') }}

),

final as (
	select * from source_customer
)

select * from final       