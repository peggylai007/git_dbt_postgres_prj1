
  create view "dvdrental"."public"."stg_dvdrental_films__dbt_tmp"
    
    
  as (
    with source_film as (

    select * from "dvdrental"."public"."film"

),

final as (
	select * from source_film
)

select * from final
  );