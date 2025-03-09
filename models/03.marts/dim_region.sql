with
    dim_region as (
        select
            {{ dbt_utils.generate_surrogate_key(['id_address', 'line_address', 'city_address']) }} as sk_region
            , *
        from {{ ref('int_region') }}
    )

select *
from dim_region