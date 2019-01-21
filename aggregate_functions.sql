-- COUNT(): count the number of rows
-- SUM(): the sum of the values in a column
-- MAX()/MIN(): the largest/smallest value
-- AVG(): the average of the values in a column
-- ROUND(): round the values in the column


-- * COUNT()
-- The fastest way to calculate how many rows are in a table is to use the COUNT() function.
-- ! COUNT() is a function that takes the name of a column as an argument and counts the number of non-empty values in that column.
SELECT COUNT(*)
FROM table_name
WHERE price = 0;
-- Here, we want to count every row, so we pass * as an argument inside the parenthesis.


-- * SUM()
-- SUM() is a function that takes the name of a column as an argument and returns the sum of all the values in that column.
SELECT SUM(downloads)
FROM fake_apps;


-- * Max / Min
SELECT MIN(downloads)
FROM fake_apps;

-- * AVERAGE
SELECT AVG(downloads)
FROM fake_apps;

-- * ROUND
SELECT name, ROUND(price, 0)
FROM fake_apps;

SELECT ROUND(AVG(price), 2)
FROM fake_apps;


-- ??? important
-- * Group By I
-- ! GROUP BY is a clause in SQL that is used with aggregate functions. It is used in collaboration with the SELECT statement to arrange identical data into groups.
-- ! The GROUP BY statement comes after any WHERE statements, but before ORDER BY or LIMIT.
SELECT price, COUNT(*) 
FROM fake_apps
WHERE downloads > 20000
GROUP BY price;

-- * Group By II
-- Sometimes, we want to GROUP BY a calculation done on a column.
-- SQL lets us use column reference(s) in our GROUP BY that will make our lives easier.
SELECT category,
	price,
  AVG(downloads)
FROM fake_apps
GROUP BY 1, 2;


-- * HAVING 
-- In addition to being able to group data using GROUP BY, SQL also allows you to filter which groups to include and which to exclude.
SELECT year,
   genre,
   COUNT(name)
FROM movies
GROUP BY 1, 2
HAVING COUNT(name) > 10;
-- ! HAVING statement always comes after GROUP BY, but before ORDER BY and LIMIT.