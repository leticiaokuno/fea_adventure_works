with
    sales_reason as (
        select
            cast (SALESREASONID as int) as id_salesreason
            , cast (NAME as string) as name_salesreason
            , cast (REASONTYPE as string) as type_salesreason
            , cast (MODIFIEDDATE as date) as modifieddate_salesreason
        from {{ source('source_sales', 'salesreason') }}
    )

select *
from sales_reason