with
    sales_orderdetail as (
        select
            SALESORDERID
            , cast (SALESORDERDETAILID as int) as id_orderdetail
            , cast (ORDERQTY as int) as qty_orderdetail
            , cast (PRODUCTID as int) productid_orderdetail
            , cast (UNITPRICE as numeric(18,2)) as unitprice_orderdetail
            , cast (UNITPRICEDISCOUNT as numeric(18,2)) as discount_orderdetail
            , coalesce(unitprice * (1.0 - coalesce(unitpricediscount, 0.0)) * orderqty, 0.0) as totalprice_orderdetail
            , cast (MODIFIEDDATE as date) as modifieddate_orderdetail
        from {{ source('source_sales', 'salesorderdetail') }}
    )

select *
from sales_orderdetail