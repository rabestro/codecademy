-- This is the first query:

select distinct year from population_years;

-- Add your additional queries below:

-- What is the largest population size for Gabon in this dataset?

select max(population)
from population_years
where country = 'Gabon';

-- What were the 10 lowest population countries in 2005?

select country, population * 1000000 as "Population"
from population_years
where year = 2005
order by population
limit 10;

-- What are all the distinct countries with a population of over 100 million in the year 2010?

select country, population
from  population_years
where year = 2010 and population > 100
order by population desc;

-- How many countries in this dataset have the word “Islands” in their name?

select distinct country
from population_years
where country like '%Islands%';

-- What is the difference in population between 2000 and 2010 in Indonesia?
-- Note: it’s okay to figure out the difference by hand after pulling the correct data.

select year, round(population, 1) as "Population in Indonesia"
from population_years
where year between 2000 and 2010 and country = 'Indonesia'
order by year;