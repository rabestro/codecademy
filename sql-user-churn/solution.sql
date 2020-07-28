-- Calculating Churn Review

with months as (
  select
    '2017-01-01' as first_day,
    '2017-01-31' as last_day
  union
  select
    '2017-02-01' as first_day,
    '2017-02-28' as last_day
  union
  select
    '2017-03-01' as first_day,
    '2017-03-31' as last_day
),

cross_join as (
  select *
  from subscriptions
  cross join months
),

status as (
  select
    id, 
    first_day as month,
    case
      when  (subscription_start < first_day)
            and
            (subscription_end > first_day or subscription_end is null) then 1
      else 0
    end as is_active,
    case
      when subscription_end between first_day and last_day then 1
      else 0
    end as is_canceled
  from cross_join
),

status_aggregate as (
  select
    month, 
    sum(is_active) as active,
    sum(is_canceled) as canceled
  from status
  group by month
)

select
  month, 
  1.0 * canceled / active as churn_rate
from status_aggregate;
