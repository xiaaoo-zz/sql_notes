## Lesson 3: Sorting retrived data
```sql
SELECT prod_id, prod_price, prod_name
FROM Products
ORDER BY 2 DESC, 3; -- DESC ASC
```
If you want to sort descending on multiple columns, be sure each column  has its own DESC keywords

`ORDER BY` must be the last in the `SELECT` statement

---

## Lesson 4: Filtering Data
```sql
SELECT prod_name, prod_price
FROM Products
WHERE prod_price = 4.39;
```
<br/>
Not all these operators are supported by all DBMSs. Microsoft Access do not suppoer `!=`

```sql
<> -- Non-equality
!= -- Non-equality
!< -- Not less than
!> -- Not greater than
BETWEEN -- Between two specified values
IS NULL -- Is a NULL value
```

```sql
SELECT prod_name, prod_price
FROM Products
WHERE prod_price BETWEEN 5 AND 10;
```

<br/>

`NULL`: No *Value* , as opposed to a filed containing 0, or an empty string, or just spaces.

```sql
SELECT prod_name, prod_price
FROM Products
WHERE prod_price IS NULL; -- cannot use = NULL
```

---

## Lesson 5. Advanced Data Filtering
```sql
SELECT prod_name, prod_price
FROM Products
WHERE vend_id IN ('DLL01', 'BRS01')
ORDER BY prod_name;
```

---

## Lesson 6, using wildcard filtering

`%`: match any number of occurrences of any character. (e.g. `LIKE '%bean bags%'`) (`WHERE email LIKE b%@gmail.com`)

% will not match for NULL

<br />

`?` matches just a single character


`[]` is used to specify a set of characters, any one of which must match  a character in the specified position

```sql
SELECT cust_contact
FROM Customers
WHERE cust_contact LIKE '[JM]%' -- finds all contacts whose names begin with the letter J or the letter M
ORDER BY cust_contact;
```

SQL wildcards should be used caredfully  and never overused, because it takes far longer to process.

---

## lesson 7. creating calculated fields

use `+` or `||` for concatenation

```sql
SELECT vend_name + ' (' + vend_country + ') '
FROM Vendors
ORDER BY vend_name;
```

in MySQL or MariaDB
```sql
SELECT Concat(vend_name, ' (', vend_country, ') ') -- RTRIM to trim extra spaces
FROM Vendors
ORDER BY vend_name;
```

---

## lesson 8. using data manipulation functions

`RTRIM()` fiunction is used to trim white space from the end of a column value

`UPPER()`

because date and time are stored in tables using datatypes, it should be manipulated by using functions


in Access
```sql
SELECT order_num
FROM Orders
WHERE DATEPART('yyyy', order_date) = 2012;
```

## lesson 9. summarizing data

`AVG() COUNT() MAX() MIN() SUM()`

---

## lesson 10. grouping data

```sql
SELECT ved_id, COUNT(*) AS num_prods
FROM Products
GROUP BY vend_id;
-- this causes num_prods to be calculated once per vend_id rather than once for the enitre table
```
<br />

Filtering groups

`HAVING` is similar to `WHERE`, the only difference is taht WHERE filters rows and HAVING filters groups

```sql
SELECT  cust_id, COUNT(*) AS orders
FROM Orders
-- WHERE ...  
GROUP BY cust_id
HAVING COUNT(*) >= 2;
-- WHERE filters  before data is groups, and HAVING filters after dataisg grouped
```


