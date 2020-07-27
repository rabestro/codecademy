-- Multiple Month: Cross Join Months and UsersMultiple Month: Cross Join Months and Users

-- Now that we have a table of months, we will join it to the subscriptions table. 
-- This will result in a table containing every combination of month and subscription.

-- Ultimately, this table will be used to determine the status of each subscription in each month.

-- The workspace contains the months temporary table from the previous exercise.
-- Create a cross_join temporary table that is a CROSS JOIN of subscriptions and months.

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
-- Add temporary cross_join definition here
cross_join AS (
  SELECT * FROM subscriptions 
  CROSS JOIN months
)
SELECT *
FROM cross_join
LIMIT 100;
