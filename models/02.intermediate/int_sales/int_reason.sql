with
    header_reason as (
        select *
        from {{ ref('stg_sales__salesorderheadersalesreason') }}
    )

    , sales_reason as (
        select *
        from {{ ref('stg_sales__salesreason') }}
    )

    , joined_reason as (
        select
            header_reason.orderid_headerreason
            , listagg (sales_reason.name_salesreason, ', ') as promotion_names_agg
            , listagg (sales_reason.type_salesreason, ', ') as promotion_types_agg
        from header_reason
        left join sales_reason on header_reason.reasonid_headerreason = sales_reason.id_salesreason
        group by header_reason.orderid_headerreason
    )

select *
from joined_reason