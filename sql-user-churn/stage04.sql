-- Multiple Month: Create Months Temporary Table

-- Our single month calculation is now in a form that we can extend to a multiple month result. 
-- But first, we need months! Some SQL table schemes will contain a prebuilt table of months. 
-- Ours doesn’t, so we’ll need to build it using UNION. We’ll need the first and last day of each month.
-- Our churn calculation uses the first day as a cutoff for subscribers and the last day as a cutoff 
-- for cancellations. This table can be created like:

SELECT
  '2016-12-01' AS first_day,
  '2016-12-31' AS last_day
UNION
SELECT
  '2017-01-01' AS first_day,
  '2017-01-31' AS last_day;
  
-- Create the months temporary table using WITH and SELECT everything from it so that you can see the structure. 
-- We need a table for January, February, and March of 2017.

WITH months AS (
  SELECT
    '2017-01-01' AS first_day,
    '2017-01-31' AS last_day
  UNION
  SELECT
    '2017-02-01' AS first_day,
    '2017-02-28' AS last_day
  UNION
  SELECT
    '2017-03-01' AS first_day,
    '2017-03-31' AS last_day  
)
SELECT * FROM months;

