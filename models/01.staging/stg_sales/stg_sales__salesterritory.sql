with
    sales_territory as (
        select
            cast (TERRITORYID as int) as id_territory 
            , cast (NAME as string) as name_territory 
            , cast (COUNTRYREGIONCODE as varchar) as code_territory 
            , cast ("group" as string) as group_territory
            , cast (SALESYTD as numeric(18,2)) as salesytd_territory 
            , cast (SALESLASTYEAR as numeric(18,2)) as salesly_territory 
            , cast (MODIFIEDDATE as date) as modifieddate_territory 
        from {{ source('source_sales', 'salesterritory') }}
    )

select *
from sales_territory