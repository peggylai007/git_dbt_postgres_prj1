with customers as (

    select * from "dvdrental"."public"."stg_dvdrental_customers"

),

rentals as (

    select * from "dvdrental"."public"."stg_dvdrental_rentals"

),

payments as (

    select * from "dvdrental"."public"."stg_dvdrental_payments"

),

customer_rentals as (

        select
        customer_id,

        min(rental_date) as first_rental,
        max(rental_date) as most_recent_rental,
        count(rental_id) as number_of_rentals
    from rentals

    group by customer_id

),

customer_payments as (

    select
        rentals.customer_id,
        sum(amount) as total_amount

    from payments

    left join rentals on
         payments.rental_id = rentals.rental_id

    group by rentals.customer_id

),

final as (

    select
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        customer_rentals.first_rental,
        customer_rentals.most_recent_rental,
        customer_rentals.number_of_rentals,
        customer_payments.total_amount as customer_lifetime_value

    from customers

    left join customer_rentals
        on customers.customer_id = customer_rentals.customer_id

    left join customer_payments
        on  customers.customer_id = customer_payments.customer_id

)

select * from final