with source_inventory as (

    select * from {{ source('dvdrental_source','inventory') }}

),

final as (
	select * from source_inventory
)

select * from final       