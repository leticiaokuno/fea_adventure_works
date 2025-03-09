with
    stateprovince as (
        select
            cast (STATEPROVINCEID as int) as id_state
            , cast (TERRITORYID as int) as territorryid_state
            , cast (NAME as string) as name_state
            , cast (STATEPROVINCECODE as varchar) as code_state
            , cast (COUNTRYREGIONCODE as varchar) as countrycode_state
            , cast (MODIFIEDDATE as date) as modifieddate_state
        from {{ source('source_person', 'stateprovince') }}
    )

select *
from stateprovince