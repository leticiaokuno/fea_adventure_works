with
    credit_card as (
        select
            cast (CREDITCARDID as int) as id_creditcard
            , cast (CARDTYPE as string) as type_creditcard
            , cast (MODIFIEDDATE as date) as modifieddate_creditcard
        from {{ source('source_sales', 'creditcard') }}
    )

select *
from credit_card