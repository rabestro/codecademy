# World Populations SQL Practice II

## Overview

This project is slightly different than others you have encountered thus far on Codecademy. Instead of a step-by-step tutorial, this project contains a series of open-ended requirements which describe the project you’ll be building. There are many possible ways to correctly fulfill all of these requirements, and you should expect to use the internet, Codecademy, and other resources when you encounter a problem that you cannot easily solve.

## Project Goals

You’ll work with a dataset of world population by country data from recent years. You’ll write queries to retrieve interesting data and answer a set of specific questions.

## Project Requirements

In this project, you’ll answer questions using a database of world population by country.

There are two tables:

### countries

| Column |	Type |	Notes |
|---|---|---|
| id |	INTEGER |	Primary Key |
| name | 	TEXT | 	
| continent | 	TEXT | 	

### population_years 

| Column | 	Type | 	Notes
|---|---|---|
| id | 	INTEGER | 	Primary Key
| population | 	NUMBER | 	(in millions)
| year | 	NUMBER | 	
| country_id | 	INTEGER | 	Foreign Key

Refer to this schema as you write queries to the database.

When you finish this project, you should be able to answer each the questions that follow using a single SQL query.
