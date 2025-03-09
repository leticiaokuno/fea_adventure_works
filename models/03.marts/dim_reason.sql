with
    dim_reason as (
        select
            {{ dbt_utils.generate_surrogate_key(['orderid_headerreason', 'promotion_names_agg']) }} as sk_reason
            , *
        from {{ ref('int_reason') }}
    )

select *
from dim_reason