with
    customer as (
        select *
        from {{ ref('stg_sales__customer') }}
    )

    , person as (
        select *
        from {{ ref('stg_person__person') }}
    )

    , joined_customer as (
        select
            customer.id_customer
            , person.id_person
            , customer.storeid_customer
            , person.type_person
            , person.firstname_person
            , person.middlename_person
            , person.lastname_person
            , person.fullname_person
        from customer
        left join person on customer.id_customer = person.id_person
    )

select *
from joined_customer 