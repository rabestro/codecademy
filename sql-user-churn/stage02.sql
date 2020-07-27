-- Single Month I

-- Now that we’ve gone over what churn is, let’s see how we can calculate it using SQL. 
-- In this example, we’ll calculate churn for the month of December 2016.

-- Typically, there will be data in a subscriptions table available in the following format:
-- id - the customer id
-- subscription_start - the subscribe date
-- subscription_end - the cancel date

-- When customers have a NULL value for their subscription_end, that’s a good thing. 
-- It means they haven’t canceled!

-- For the numerator, we only want the portion of the customers who cancelled during December:

SELECT COUNT(*)
FROM subscriptions
WHERE subscription_start < '2016-12-01'
  AND (
    subscription_end
    BETWEEN '2016-12-01' AND '2016-12-31'
  );
  
 -- For the denominator, we only want to be considering customers who were active at the beginning of December:
 
SELECT COUNT(*)
FROM subscriptions
WHERE subscription_start < '2016-12-01'
  AND (
    (subscription_end >= '2016-12-01')
    OR (subscription_end IS NULL)
  );
  
 -- Anyways, now that we have the users who canceled during December, 
 -- and total subscribers, let’s divide the two to get the churn rate.
-- When dividing, we need to be sure to multiply by 1.0 to cast the result as a float:

SELECT 1.0 * 
(
  SELECT COUNT(*)
  FROM subscriptions
  WHERE subscription_start < '2016-12-01'
  AND (
    subscription_end
    BETWEEN '2016-12-01'
    AND '2016-12-31'
  )
) / (
  SELECT COUNT(*) 
  FROM subscriptions 
  WHERE subscription_start < '2016-12-01'
  AND (
    (subscription_end >= '2016-12-01')
    OR (subscription_end IS NULL)
  )
) 
AS result;

-- Use the methodology provided in the narrative to calculate the churn for January 2017.

SELECT 1.0 * 
(
  SELECT COUNT(*)
  FROM subscriptions
  WHERE subscription_start < '2017-01-01'
  AND (
    subscription_end
    BETWEEN '2017-01-01'
    AND '2017-01-31'
  )
) / (
  SELECT COUNT(*) 
  FROM subscriptions 
  WHERE subscription_start < '2017-01-01'
  AND (
    (subscription_end >= '2017-01-01')
    OR (subscription_end IS NULL)
  )
) 
AS result;
