{{ config(materialized='table') }}

with ticket_summary as (
    select
        fan_id,
        count(*) as total_games_attended,
        sum(price_paid) as lifetime_spend,
        max(game_date) as last_game_date,
        -- Calculate how many days since their last visit
        datediff('day', max(game_date), current_date()) as days_since_last_visit
    from {{ ref('rockies_ticket_sales') }}
    group by 1
)

select
    *,
    -- 1. Engagement Segment
    case 
        when total_games_attended >= 3 then 'Super Fan'
        when total_games_attended >= 2 then 'Frequent'
        else 'Occasional'
    end as loyalty_segment,

    -- 2. Churn Logic (If > 365 days, they are 'At Risk/Churned')
    case 
        when days_since_last_visit > 365 then 'Churned'
        when days_since_last_visit > 180 then 'At Risk'
        else 'Active'
    end as retention_status

from ticket_summary