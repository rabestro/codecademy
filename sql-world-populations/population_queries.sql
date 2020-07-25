-- How many entries in the database are from Africa?

select count(*) from countries;

-- What was the total population of Oceania in 2005?

select sum(population) as "Total population of Oceania in 2005"
from population_years
where year = 2005
    and country_id in (select id from countries where continent = 'Oceania');

-- What is the average population of countries in South America in 2003?

select avg(population) as "Average population of countries in South America in 2003"
from population_years
where year = 2003
    and country_id in (select id from countries where continent = 'South America');

-- What country had the smallest population in 2007?

select name as "The country with the smallest population in 2007"
from countries
where id = (
    select country_id
    from population_years
    where year = 2007
    and population = (
        select min(population)
        from population_years
        where year = 2007
    )
);

-- What is the average population of Poland during the time period covered by this dataset?



-- How many countries have the word "The" in their name?



-- What was the total population of each continent in 2010?


