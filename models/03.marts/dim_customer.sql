with
    dim_customer as (
        select
            {{ dbt_utils.generate_surrogate_key(['id_customer', 'id_person', 'fullname_person']) }} as sk_customer
            , *
        from {{ ref('int_customer') }}
    )

select *
from dim_customer