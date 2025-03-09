with
    credit_card as (
        select *
        from {{ ref('stg_sales__creditcard') }}
    )

    , person_creditcard as (
        select *
        from {{ ref('stg_sales__personcreditcard') }}
    )

    , joined_credit_card as (
        select
            credit_card.id_creditcard
            , coalesce (credit_card.type_creditcard, 'Not informed') as type_credit_card
            , person_creditcard.id_personcard
        from credit_card
        left join person_creditcard on credit_card.id_creditcard = person_creditcard.cardid_personcard
        )

select *
from joined_credit_card