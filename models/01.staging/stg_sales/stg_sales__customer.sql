with
    customer as (
        select
            cast (CUSTOMERID as int) as id_customer
            , cast (PERSONID as int) as personid_customer
            , cast (STOREID as int) storeid_customer
            , cast (TERRITORYID as int) as territoryid_customer
            , cast (MODIFIEDDATE as date) as modifieddate_customer
        from {{ source('source_sales', 'customer') }}
    )

select *
from customer