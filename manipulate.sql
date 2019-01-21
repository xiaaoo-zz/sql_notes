
-- * CREATE
-- CREATE statements allow us to create a new table in the database. You can use the CREATE statement anytime you want to create a new table from scratch. The statement below creates a new table named celebs.
CREATE TABLE celebs (
   id INTEGER, 
   name TEXT, 
   age INTEGER
);



-- * INSERT
-- The INSERT statement inserts a new row into a table. You can use the INSERT statement when you want to add new records. The statement below enters a record for Justin Bieber into the celebs table.
INSERT INTO celebs (id, name, age) 
VALUES (1, 'Justin Bieber', 22);


-- * SELECT
-- SELECT statements are used to fetch data from a database. In the statement below, SELECT returns all data in the name column of the celebs table.
SELECT name FROM celebs;


-- * ALTER
ALTER TABLE celebs 
ADD COLUMN twitter_handle TEXT;

SELECT * FROM celebs;


-- * UPDATE
-- 1. UPDATE is a clause that edits a row in the table. 
-- 2. celebs is the name of the table. 
-- 3. SET is a clause that indicates the column to edit.

-- twitter_handle is the name of the column that is going to be updated
-- @taylorswift13 is the new value that is going to be inserted into the twitter_handle column.
-- 4. WHERE is a clause that indicates which row(s) to update with the new column value. Here the row with a 4 in the id column is the row that will have the twitter_handle updated to @taylorswift13.
UPDATE celebs 
SET twitter_handle = '@taylorswift13' 
WHERE id = 4; 

SELECT * FROM celebs;


-- * DELETE
-- DELETE FROM is a clause that lets you delete rows from a table.
-- celebs is the name of the table we want to delete rows from.
-- WHERE is a clause that lets you select which rows you want to delete. Here we want to delete all of the rows where the twitter_handle column IS NULL.
-- IS NULL is a condition in SQL that returns true when the value is NULL and false otherwise.
DELETE FROM celebs 
WHERE twitter_handle IS NULL;

SELECT * FROM celebs;



-- * Constraints
-- 1. PRIMARY KEY columns can be used to uniquely identify the row. Attempts to insert a row with an identical value to a row already in the table will result in a constraint violation which will not allow you to insert the new row.

-- 2. UNIQUE columns have a different value for every row. This is similar to PRIMARY KEY except a table can have many different UNIQUE columns.

-- 3. NOT NULL columns must have a value. Attempts to insert a row without a value for a NOT NULL column will result in a constraint violation and the new row will not be inserted.

-- 4. DEFAULT columns take an additional argument that will be the assumed value for an inserted row if the new row does not specify a value for that column.
CREATE TABLE celebs (
   id INTEGER PRIMARY KEY, 
   name TEXT UNIQUE,
   date_of_birth TEXT NOT NULL,
   date_of_death TEXT DEFAULT 'Not Applicable'
);


-- CREATE TABLE creates a new table.
-- INSERT INTO adds a new row to a table.
-- SELECT queries data from a table.
-- ALTER TABLE changes an existing table.
-- UPDATE edits a row in a table.
-- DELETE FROM deletes rows from a table.