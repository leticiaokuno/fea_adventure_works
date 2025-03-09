with
    
    dim_products as (
        select *
        from {{ ref('dim_products')}}   
    )

    , fct_salesorder as (
        select
            sales_orderdetail.id_orderdetail as salesorderid
            , dim_products.sk_product as fk_product
            , dim_products.pk_id_product as productid
            , dim_products.name_product as productname
            , sales_orderdetail.qty_orderdetail as orderqty
            , sales_orderdetail.unitprice_orderdetail as unitprice
            , sales_orderdetail.discount_orderdetail as unitpricediscount
            , sales_orderdetail.totalprice_orderdetail as finalprice
        from {{ ref('stg_sales__salesorderdetail')}} as sales_orderdetail
        left join dim_products on sales_orderdetail.productid_orderdetail = dim_products.pk_id_product
    ) 

select *
from fct_salesorder