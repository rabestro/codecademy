-- Multiple Month: Determine Active Status

-- Add a status temporary table. This table should have the following columns:
-- id - selected from the cross_join table
-- month - this is an alias of first_day from the cross_join table. We’re using 
-- the first day of the month to represent which month this data is for.
-- is_active - 0 or 1, derive this column using a CASE WHEN statement
-- The is_active column should be 1 if the subscription_start is before the month’s 
-- first_day and if the subscription_end is either after the month’s first_day or is NULL.

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
-- Add status temporary table here
status AS (
  SELECT id, first_day AS month,
  CASE 
  WHEN subscription_start < first_day
    AND (subscription_end >= first_day 
          OR (subscription_end IS NULL)) THEN 1
  ELSE 0
  END as is_active 
  FROM cross_join
)
SELECT *
FROM status
LIMIT 100;

