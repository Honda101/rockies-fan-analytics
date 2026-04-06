{{ config(materialized='table') }}

-- CTE 1: Ticket Data
with ticket_summary as (
    select
        fan_id,
        count(*) as total_games_attended,
        sum(price_paid) as ticket_spend,
        max(game_date) as last_game_date,
        datediff('day', max(game_date), current_date()) as days_since_last_visit
    from {{ ref('rockies_ticket_sales') }}
    group by 1
),

-- CTE 2: Concessions (Beer/Food)
concessions_summary as (
    select 
        fan_id, 
        sum(amount) as total_f_and_b_spend 
    from {{ ref('stadium_concessions') }}
    group by 1
),

-- CTE 3: Merchandise (Jerseys/Hats)
merch_summary as (
    select 
        fan_id, 
        sum(amount) as total_merch_spend 
    from {{ ref('stadium_merchandise') }}
    group by 1
)

-- FINAL SELECTION: Joining it all together
select
    t.fan_id,
    t.total_games_attended,
    t.ticket_spend,
    coalesce(c.total_f_and_b_spend, 0) as total_concessions_spend,
    coalesce(m.total_merch_spend, 0) as total_merchandise_spend,
    
    -- THE WHALE METRIC: Cross-departmental LTV
    (t.ticket_spend + coalesce(c.total_f_and_b_spend, 0) + coalesce(m.total_merch_spend, 0)) as lifetime_spend,
    
    t.days_since_last_visit,

    -- 1. BEHAVIORAL PERSONA (More advanced than just game count)
    case 
        when m.total_merch_spend >= 120 then 'Gear Head'
        when c.total_f_and_b_spend / t.total_games_attended >= 20 then 'Heavy Consumer'
        when t.total_games_attended >= 3 then 'Super Fan'
        else 'Occasional'
    end as fan_persona,

    -- 2. RETENTION STATUS
    case 
        when t.days_since_last_visit > 365 then 'Churned'
        when t.days_since_last_visit > 180 then 'At Risk'
        else 'Active'
    end as retention_status

from ticket_summary t
left join concessions_summary c on t.fan_id = c.fan_id
left join merch_summary m on t.fan_id = m.fan_id