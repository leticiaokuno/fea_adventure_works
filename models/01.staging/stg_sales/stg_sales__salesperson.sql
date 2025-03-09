with
    sales_person as (
        select
            cast (BUSINESSENTITYID as int) as businessid_salesperson
            , cast (TERRITORYID as int) as territoryid_salesperson
            , cast (SALESQUOTA as numeric(18,2)) as quota_salesperson
            , cast (BONUS as numeric(18,2)) as bonus_salesperson
            , cast (COMMISSIONPCT as numeric(10,10)) as commissionpct_salesperson
            , cast (SALESYTD as numeric(18,2)) as YTD_salesperson
            , cast (SALESLASTYEAR as numeric(18,2)) as LY_salesperson
            , cast (MODIFIEDDATE as date) as modifieddate_salesperson
        from {{ source('source_sales', 'salesperson') }}
    )

select *
from sales_person