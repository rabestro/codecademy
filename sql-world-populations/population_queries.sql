-- How many entries in the database are from Africa?

select count(*) from countries;

-- What was the total population of Oceania in 2005?

select sum(population) as "Total population of Oceania in 2005"
from population_years
where year = 2005
    and country_id in (select id from countries where continent = 'Oceania');

-- What is the average population of countries in South America in 2003?



-- What country had the smallest population in 2007?



-- What is the average population of Poland during the time period covered by this dataset?



-- How many countries have the word "The" in their name?



-- What was the total population of each continent in 2010?


