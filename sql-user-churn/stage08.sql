-- Multiple Month: Sum Active and Canceled Users

-- Now that we have an active and canceled status for each subscription for each month, we can aggregate them.
-- We will GROUP BY month and create a SUM() of the two columns from the status table, is_active and is_canceled.
-- This provides a list of months, with their corresponding number of active users at 
-- the beginning of the month and the number of those users who cancel during the month.

WITH months AS
(SELECT
  '2017-01-01' as first_day,
  '2017-01-31' as last_day
UNION
SELECT
  '2017-02-01' as first_day,
  '2017-02-28' as last_day
UNION
SELECT
  '2017-03-01' as first_day,
  '2017-03-31' as last_day
),
cross_join AS
(SELECT *
FROM subscriptions
CROSS JOIN months),
status AS
(SELECT id, first_day as month,
CASE
  WHEN (subscription_start < first_day)
    AND (
      subscription_end > first_day
      OR subscription_end IS NULL
    ) THEN 1
  ELSE 0
END as is_active,
CASE 
  WHEN subscription_end BETWEEN first_day AND last_day THEN 1
  ELSE 0
END as is_canceled
FROM cross_join),
-- add status_aggregate here
status_aggregate AS (
  SELECT month, 
    SUM(is_active) AS active,
    SUM(is_canceled) AS canceled 
  FROM status
  GROUP BY month
)
SELECT *
FROM status_aggregate;
