with
    dim_creditcard as (
        select
            {{ dbt_utils.generate_surrogate_key(['id_creditcard', 'type_credit_card']) }} as sk_creditcard
            , *
        from {{ ref('int_creditcard') }}
    )

select *
from dim_creditcard