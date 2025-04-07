with films as (

    select * from {{ ref('stg_dvdrental_films') }}

),

inventories as (

    select * from {{ ref('stg_dvdrental_inventories') }}

),

inventories_filmid as (

    select
        film_id as film_id,
        count(*) as filmid_count

    from inventories

    group by film_id

),

inventories_filmid_categories as (

   select 
      inventories_filmid.film_id.
      inventories_filmid.filmid_count,
      films.catetory

    from inventories_filmid


    left join films
        on inventories_filmid.film_id = films.film_id

),

final as (

  select films.category
         sum(film_id_count)
  from inventories_filmid_categories 
  group by films.category
)

select * from final