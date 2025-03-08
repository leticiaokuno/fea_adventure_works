with
    product_category as (
        select 
            cast (productcategoryid as int) as pk_id_category
            , cast (name as string) as productname_category
            , cast (modifieddate as date) as modifieddate_category
        from {{ source('source_production','productcategory') }}
    )

select *
from product_category