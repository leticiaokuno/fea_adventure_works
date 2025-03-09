with
    dim_calendar as (
        select
            {{ dbt_utils.generate_surrogate_key(['date_day', 'day_of_week_name']) }} as sk_calendar
            , *
        from {{ ref('stg_calendar') }}
    )

select *
from dim_calendar