with
    product_subcategory as (
        select
            cast (productsubcategoryid as int) as pk_id_subcategory
            , cast (productcategoryid as int) as fk_id_category
            , cast (name as string) as name_subcategory
            , cast (modifieddate as date) as modifieddate_subcategory
        from {{ source('source_production', 'productsubcategory') }}
    )

select *
from product_subcategory