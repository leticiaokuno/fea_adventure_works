with

    dim_region as (
        select *
        from {{ ref('dim_region') }}
    )

    , dim_creditcard as (
        select *
        from {{ ref('dim_creditcard') }}
    )

    , dim_customer as (
        select *
        from {{ ref('dim_customer') }}
    )

    , dim_reason as (
        select *
        from {{ ref('dim_reason') }} 
    )
    
    , dim_calendar as (
        select *
        from {{ ref('dim_calendar') }}
    )

    , fct_salesheader as (
        select 
            salesheader.id_orderheader as salesorderid
            , dim_region.sk_region as fk_region
            , dim_creditcard.sk_creditcard as fk_creditcard
            , dim_customer.sk_customer as fk_customer
            , dim_calendar.sk_calendar as fk_calendar
            , ifnull(dim_reason.promotion_names_agg, 'não informado') as reason_agg
            , dim_reason.promotion_types_agg as reason_types_agg
            , salesheader.orderdate_orderheader as orderdate
            , salesheader.duedate_orderheader as duedate
            , salesheader.shipdate_orderheader as shipdate
            , case
                when salesheader.status_orderheader = 1 then 'Em processo'
                when salesheader.status_orderheader = 2 then 'Aprovado'
                when salesheader.status_orderheader = 3 then 'Em falta'
                when salesheader.status_orderheader = 4 then 'Rejeitado'
                when salesheader.status_orderheader = 5 then 'Enviado'
                when salesheader.status_orderheader = 6 then 'Cancelado'
            end as orderstatus
            , case
                when salesheader.flag_orderheader = true then 'Online'
                when salesheader.flag_orderheader = false then 'Physical'
            end as saleschannel
            , salesheader.subtotal_orderheader as subtotal
            , salesheader.taxamt_orderheader as taxamt
            , salesheader.freight_orderheader as freight
            , salesheader.totaldue_orderheader as totaldue
        from {{ ref('stg_sales__salesorderheader') }} as salesheader
        left join dim_region on salesheader.billaddressid_orderheader = dim_region.id_address
        left join dim_creditcard on salesheader.creditcard_orderheader = dim_creditcard.id_creditcard
        left join dim_customer on salesheader.customerid_orderheader = dim_customer.id_customer
        left join dim_calendar on salesheader.orderdate_orderheader = dim_calendar.date_day
        left join dim_reason on salesheader.id_orderheader = dim_reason.orderid_headerreason
    )

select *
from fct_salesheader