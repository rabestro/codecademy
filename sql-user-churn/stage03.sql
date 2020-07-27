-- Single Month II

WITH enrollments AS
(
  SELECT *
  FROM subscriptions
  WHERE subscription_start < '2016-12-01'
  AND (
    (subscription_end >= '2016-12-01')
    OR (subscription_end IS NULL)
  )
),
status AS 
(SELECT
CASE
  WHEN (subscription_end > '2016-12-31')
    OR (subscription_end IS NULL) THEN 0
    ELSE 1
  END as is_canceled,
    CASE
    WHEN subscription_start < '2016-12-01'
      AND (
        (subscription_end >= '2016-12-01')
        OR (subscription_end IS NULL)
      ) THEN 1
    ELSE 0
  END as is_active
  FROM enrollments
)
  
SELECT 1.0 * SUM(is_canceled) / SUM(is_active)
FROM status;

-- Use the methodology provided in the narrative to calculate the churn for January 2017.

WITH enrollments AS
(
  SELECT *
  FROM subscriptions
  WHERE subscription_start < '2017-01-01'
  AND (
    (subscription_end >= '2017-01-01')
    OR (subscription_end IS NULL)
  )
),
status AS 
(SELECT
CASE
  WHEN (subscription_end > '2017-01-31')
    OR (subscription_end IS NULL) THEN 0
    ELSE 1
  END as is_canceled,
    CASE
    WHEN subscription_start < '2017-01-01'
      AND (
        (subscription_end >= '2017-01-01')
        OR (subscription_end IS NULL)
      ) THEN 1
    ELSE 0
  END as is_active
  FROM enrollments
)
  
SELECT 1.0 * SUM(is_canceled) / SUM(is_active)
FROM status;
