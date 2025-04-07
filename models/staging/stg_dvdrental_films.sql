with source_film as (

    select * from {{ source('dvdrental_source','film') }}

),

final as (
	select * from source_film
)

select * from final    