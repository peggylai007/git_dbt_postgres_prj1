
  create view "dvdrental"."public"."categories_inventories__dbt_tmp"
    
    
  as (
    with films as (

    select * from "dvdrental"."public"."stg_dvdrental_films"

),

inventories as (

    select * from "dvdrental"."public"."stg_dvdrental_inventories"

),

inventories_filmid as (

    select
        film_id,
        count(*) as filmid_count

    from inventories

    group by film_id

),

inventories_filmid_ratings as (

   select 
      inventories_filmid.film_id.
      inventories_filmid.filmid_count,
      films.rating

    from inventories_filmid


    left join films
        on inventories_filmid.film_id = films.film_id

),

final as (

  select rating,
         sum(filmid_count) as total_filmid_count
  from inventories_filmid_ratings 
  group by rating
)

select * from final
  );