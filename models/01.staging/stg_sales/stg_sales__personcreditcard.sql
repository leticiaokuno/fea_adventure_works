with
    person_creditcard as (
        select 
            cast (BUSINESSENTITYID as int) as id_personcard
            , cast (CREDITCARDID as int) as cardid_personcard
            , cast (MODIFIEDDATE as date) as modifieddate_personcard
        from {{ source('source_sales', 'personcreditcard') }}
    )

select *
from person_creditcard