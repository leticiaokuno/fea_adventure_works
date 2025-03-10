with 
    filtered_salesheader as (
        select 
            salesorderid
            , orderdate
        from {{ ref('fct_salesheader') }}
        where 
            extract(year from orderdate) = 2011
    )

    , sales_2011 as (
        select 
            salesorder.salesorderid
            , salesorder.orderqty * salesorder.unitprice as gross_sales
        from 
            {{ ref('fct_salesorder') }} as salesorder
        join filtered_salesheader on salesorder.salesorderid = filtered_salesheader.salesorderid
    )

    , gross_salescheck as (
        select 
            sum(gross_sales) as gross_sales_2011
        from sales_2011
    )

select *
from gross_salescheck
where gross_sales_2011 = 12646112.16