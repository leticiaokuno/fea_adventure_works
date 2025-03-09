with 
    header_reason as (
        select
            cast (SALESORDERID as int) as orderid_headerreason
            , cast (SALESREASONID as int) as reasonid_headerreason
            , cast (MODIFIEDDATE as date) as modifieddate_headerreason
        from {{ source('source_sales', 'salesorderheadersalesreason') }}
    )

select *
from header_reason