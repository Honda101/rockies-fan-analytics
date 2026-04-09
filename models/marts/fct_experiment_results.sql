with experiment_summary as (
    select
        e.test_group,
        count(distinct e.fan_id) as total_fans,
        sum(f.total_merchandise_spend) as total_revenue,
        round(sum(f.total_merchandise_spend) / count(distinct e.fan_id), 2) as arpu
    from {{ ref('marketing_exposures') }} e
    left join {{ ref('fan_loyalty') }} f on e.fan_id = f.fan_id
    where e.test_name = 'merch_discount_v1'
    group by 1
),

lift_calculation as (
    select
        test_group,
        total_fans,
        arpu,
        -- Window function to get the control ARPU for comparison
        -- Sorts by test_group so 'control' usually comes first
        first_value(arpu) over (order by test_group asc) as control_arpu,
        arpu - first_value(arpu) over (order by test_group asc) as lift_amount
    from experiment_summary
)

select 
    *,
    round((lift_amount / nullif(control_arpu, 0)) * 100, 2) as lift_percentage
from lift_calculation