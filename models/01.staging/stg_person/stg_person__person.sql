with
    person as (
        select
            cast (BUSINESSENTITYID as int) as id_person
            , cast (PERSONTYPE as string) as type_person
            , cast (FIRSTNAME as string) as firstname_person
            , cast (MIDDLENAME as string) as middlename_person
            , cast (LASTNAME as string) as lastname_person
            , trim (concat(FIRSTNAME, ' ', coalesce(MIDDLENAME, ''), ' ', LASTNAME)) as fullname_person
            , cast (MODIFIEDDATE as date) as modifieddate_person
        from {{ source('source_person', 'person') }}
    )

select *
from person