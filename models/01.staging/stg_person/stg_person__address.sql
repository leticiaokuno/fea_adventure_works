with
    address as (
        select
            cast (ADDRESSID as int) as id_address
            , cast (ADDRESSLINE1 as varchar) as line_address
            , cast (CITY as string) as city_address
            , cast (STATEPROVINCEID as int) as stateid_address
            , cast (POSTALCODE as varchar) as postalcode_address
            , cast (MODIFIEDDATE as date) as modifieddate_address
        from {{ source('source_person', 'address') }}
    )

select *
from address