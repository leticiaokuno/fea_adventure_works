{{ config(materialized='table') }}


with
    dim_products as (
        select
            {{ dbt_utils.generate_surrogate_key(['pk_id_product']) }} as sk_product
            , *
        from {{ ref('int_product__products') }}
    )

select *
from dim_products