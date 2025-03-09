with
    address as (
        select *
        from {{ ref('stg_person__address') }}
    ),

    countryregion as (
        select *
        from {{ ref('stg_person__countryregion') }}         
    ),
    
    stateprovince as (
        select *
        from {{ ref('stg_person__stateprovince') }}
    ),

    sales_territory as (
        select *
        from {{ ref('stg_sales__salesterritory') }}
    ),

    joined_region as (
        select
            address.id_address
            , address.line_address
            , address.city_address
            , address.stateid_address
            , countryregion.code_country
            , countryregion.name_country
            , stateprovince.name_state
            , stateprovince.code_state
            , sales_territory.id_territory
            , sales_territory.name_territory
            , sales_territory.group_territory
            , sales_territory.salesytd_territory 
            , sales_territory.salesly_territory
        from address
        left join stateprovince on address.stateid_address = stateprovince.id_state
        left join countryregion on countryregion.code_country = stateprovince.countrycode_state
        left join sales_territory on sales_territory.id_territory = stateprovince.territorryid_state
    )

select *
from joined_region