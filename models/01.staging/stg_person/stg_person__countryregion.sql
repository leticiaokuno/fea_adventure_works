with
    countryregion as (
        select
            cast (COUNTRYREGIONCODE as varchar) as code_country
            , cast (NAME as string) as name_country
            , cast (MODIFIEDDATE as date) as modifieddate_country
        from {{ source('source_person', 'countryregion') }}
    )

select *
from countryregion