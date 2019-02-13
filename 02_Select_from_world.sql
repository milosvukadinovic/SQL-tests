-- 1. Read the notes about this table. Observe the result of running this SQL command to show the name, continent and population of all countries.

SELECT name, continent, population FROM world

-- 2. How to use WHERE to filter records. Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros.

SELECT name FROM world
WHERE population > 200000000

-- 3. Give the name and the per capita GDP for those countries with a population of at least 200 million.

SELECT name, gdp/population FROM world
WHERE population > 200000000

-- 4. Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions.

select name, population/1000000 from world
Where continent = 'South America'

-- 5. Show the name and population for France, Germany, Italy

select name, population from world
WHERE name IN ('France', 'Germany', 'Italy')

-- 6. Show the countries which have a name that includes the word 'United'

select name from world
WHERE name like '%United%'

-- 7. Two ways to be big: A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million. Show the countries that are big by area or big by population. Show name, population and area.

select name, population, area from world
where area > 3000000 or population > 250000000

-- 8. Exclusive OR (XOR). Show the countries that are big by area or big by population but not both. Show name, population and area.

select name, population, area from world
where area > 3000000 xor population > 250000000

-- 9. For South America show population in millions and GDP in billions both to 2 decimal places.

select name ,round(population/1000000, 2), round(gdp/1000000000, 2) from world
where continent = 'south america'

-- 10. Show per-capita GDP for the trillion dollar countries to the nearest $1000.

select name, round(gdp/population,-3) from world
where gdp > 1000000000000

-- 11. Show the name and capital where the name and the capital have the same number of characters.

SELECT name, capital
  FROM world
 WHERE LENGTH(name)=LENGTH(capital)

-- 12. Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.

SELECT name,capital
FROM world
where LEFT(name,1) = LEFT(capital,1) and capital<>name

-- 13. Find the country that has all the vowels and no spaces in its name.

SELECT name
   FROM world
WHERE name  LIKE '%a%' and
 name  LIKE '%e%' and
 name  LIKE '%i%' and
 name  LIKE '%o%' and
 name  LIKE '%u%'
AND name NOT LIKE '% %'


--***********************Quizz questions.

-- 1.Select the code which gives the name of countries beginning with U
SELECT name
  FROM world
 WHERE name LIKE 'U%'

-- 2. Select the code which shows just the population of United Kingdom?
SELECT population
  FROM world
 WHERE name = 'United Kingdom'

-- 3. Select the answer which shows the problem with this SQL code - the intended result should be the continent of France:

'name' should be name

-- 4. Select the result that would be obtained from the following code:

Nauru	990

-- 5. Select the code which would reveal the name and population of countries in Europe and Asia
SELECT name, population
  FROM world
 WHERE continent IN ('Europe', 'Asia')

-- 6. Select the code which would give two rows
SELECT name FROM world
 WHERE name IN ('Cuba', 'Togo')

-- 7. Select the result that would be obtained from this code:

Brazil
Colombia

