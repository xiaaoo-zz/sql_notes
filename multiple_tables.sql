-- In order to efficiently store data, we often spread related information across multiple tables.
-- For instance, imagine that we're running a magazine company where users can have different types of subscriptions to different products. Different subscriptions might have many different properties. Each customer would also have lots of associated information.

-- orders would contain just the information necessary to describe what was ordered:
--    order_id
--    customer_id
--    subscription_id
--    purchase_date

-- subscriptions would contain the information to describe each type of subscription:
--    subscription_id
--    description
--    price_per_month
--    subscription_length

-- customers would contain the information for each customer:
--    customer_id
--    customer_name
--    address


-- * Combining Tables with SQL
SELECT *
FROM orders
JOIN customers
  ON orders.customer_id = customers.customer_id;

-- instead of selecting all the files
SELECT orders.order_id,
   customers.customer_name
FROM orders
JOIN customers
  ON orders.customer_id = customers.customer_id;

-- exercise
SELECT *
FROM orders
JOIN subscriptions
	ON orders.subscription_id = subscriptions.subscription_id
WHERE subscriptions.description = 'Fashion Magazine';



-- * Inner Joins