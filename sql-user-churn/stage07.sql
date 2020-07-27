-- Multiple Month: Determine Cancellation Status

-- For our calculation, we’ll need one more column on the status temporary table: is_canceled
-- This column will be 1 only during the month that the user cancels.
-- Add an is_canceled column to the status temporary table. Ensure that it 
-- is equal to 1 in months containing the subscription_end and 0 otherwise.
-- Derive this column using a CASE WHEN statement. You can use the BETWEEN 
-- function to check if a date falls between two others.

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
-- add is_canceled here
CASE
  WHEN 
    subscription_end BETWEEN first_day AND last_day
     THEN 1
   ELSE 0
  END as is_canceled
FROM cross_join)
SELECT *
FROM status
LIMIT 100;
