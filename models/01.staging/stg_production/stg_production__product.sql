with
    product as (
        select *            
        from {{ source('source_production','product') }}
    )

    , renamed as (
        select
            cast (productid as int) as pk_id_product
            , cast (productsubcategoryid as int) as fk_subcategoryid_product
            , cast (name as string) as name_product
            , cast (listprice as numeric(18,2)) as listprice_product 
            , cast (modifieddate as date) as modifieddate_product
        from product
    )

select *
from  renamed