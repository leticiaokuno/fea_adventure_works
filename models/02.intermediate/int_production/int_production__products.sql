with

    /* Chamada dos modelos necessários */
    product_category as (
        select *
        from {{ ref('stg_production__productcategory') }}
    )

    , product as (
        select *
        from {{ ref('stg_production__product') }}
    )

    , product_subcategory as (
        select *
        from {{ ref('stg_production__productsubcategory') }}
    )


    , joined_product as (
        select
            PK_ID_PRODUCT
            , product.FK_SUBCATEGORYID_PRODUCT
            , product.NAME_PRODUCT
            , product.LISTPRICE_PRODUCT
            , product.MODIFIEDDATE_PRODUCT
            , product_category.PK_ID_CATEGORY
            , product_category.PRODUCTNAME_CATEGORY
            , product_subcategory.NAME_SUBCATEGORY
        from product
        left join product_subcategory on product.fk_subcategoryid_product = product_subcategory.pk_id_subcategory
        left join product_category on product_subcategory.fk_id_category = product_category.pk_id_category
    )


select *
from joined_product