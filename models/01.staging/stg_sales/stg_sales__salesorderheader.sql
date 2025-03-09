with
    sales_orderheader as (
        select
            cast (SALESORDERID as int) as id_orderheader        
            , cast (STATUS as int) as status_orderheader
            , cast (ONLINEORDERFLAG as string) as flag_orderheader
            , cast (PURCHASEORDERNUMBER as varchar) as number_orderheader
            , cast (SALESPERSONID as int) as personid_orderheader
            , cast (CUSTOMERID as int) as customerid_orderheader
            , cast (TERRITORYID as int) as territoryid_orderheader
            , cast (BILLTOADDRESSID as int) as billaddressid_orderheader
            , cast (CREDITCARDID as int) as creditcard_orderheader
            , cast (SUBTOTAL as numeric(18,2)) as subtotal_orderheader
            , cast (TAXAMT as numeric(18,2)) as taxamt_orderheader
            , cast (FREIGHT as numeric(18,2)) as freight_orderheader
            , cast (TOTALDUE as numeric(18,2)) as totaldue_orderheader
            , cast (ORDERDATE as date) as orderdate_orderheader
            , cast (DUEDATE as date) as duedate_orderheader
            , cast (SHIPDATE as date) as shipdate_orderheader
            , cast (MODIFIEDDATE as date) as modifieddate_orderheader
        from {{ source('source_sales', 'salesorderheader') }}
    )

select *
from sales_orderheader