-- ! QUERY
-- * AS
-- AS is a keyword in SQL that allows you to rename a column or table using an alias. The new name can be anything you want as long as you put it inside of single quotes. Here we renamed the name column as Titles.
SELECT name AS 'Titles'
FROM movies;


-- * DISTINCT
-- DISTINCT is used to return unique values in the output. It filters out all duplicate values in the specified column(s).
SELECT DISTINCT tools 
FROM inventory;


-- * WHERE
-- We can restrict our query results using the WHERE clause in order to obtain only the information we want.
SELECT *
FROM movies
WHERE imdb_rating > 8;

-- * Like I
--LIKE is a special operator used with the WHERE clause to search for a specific pattern in a column.
-- ! name LIKE 'Se_en' is a condition evaluating the name column for a specific pattern.
-- Se_en represents a pattern with a wildcard character.
-- ! The _ means you can substitute any individual character here without breaking the pattern. The names Seven and Se7en both match this pattern.


-- * LIKE II
-- % is a wildcard character that matches zero or more missing letters in the pattern. For example:
SELECT * 
FROM movies 
WHERE name LIKE '%man%';

-- * is NULL
-- Unknown values are indicated by NULL.
-- It is not possible to test for NULL values with comparison operators, such as = and !=.
-- Instead, we will have to use these operators:
-- IS NULL
-- IS NOT NULL
SELECT name
FROM movies 
WHERE imdb_rating IS NOT NULL;



-- * BETWEEN
-- The BETWEEN operator can be used in a WHERE clause to filter the result set within a certain range. The values can be numbers, text or dates.
-- This statement filters the result set to only include movies with names that begin with letters 'A' up to, but not including 'J'.
SELECT *
FROM movies
WHERE name BETWEEN 'A' AND 'J';

-- In this statement, the BETWEEN operator is being used to filter the result set to only include movies with years between 1990 up to, and including 1999.
SELECT *
FROM movies
WHERE year BETWEEN 1990 AND 1999;

-- ! Really interesting point to emphasize again:
-- BETWEEN two letters is not inclusive of the 2nd letter.
-- BETWEEN two numbers is inclusive of the 2nd number.

-- * AND
SELECT *
FROM movies
WHERE year BETWEEN 1970 AND 1979
  AND imdb_rating > 8;


-- * OR
SELECT *
FROM movies
WHERE year > 2014
   OR genre = 'action';


-- * ORDER BY
-- We can sort the results using ORDER BY, either alphabetically or numerically. Sorting the results often makes the data more useful and easier to analyze.
SELECT *
FROM movies
ORDER BY name;

-- DESC is a keyword used in ORDER BY to sort the results in descending order (high to low or Z-A).
-- * ASC is a keyword used in ORDER BY to sort the results in ascending order (low to high or A-Z).
SELECT *
FROM movies
WHERE imdb_rating > 8
ORDER BY year DESC;


-- * LIMIT
SELECT *
FROM movies
ORDER BY imdb_rating DESC
LIMIT 3;


-- * CASE
-- 'END AS' used to rename the added column
SELECT name,
 CASE
  WHEN imdb_rating > 8 THEN 'Fantastic'
  WHEN imdb_rating > 6 THEN 'Poorly Received'
  ELSE 'Avoid at All Costs'
 END AS 'Review'
FROM movies;
