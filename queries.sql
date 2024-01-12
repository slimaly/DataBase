-- customers base analysis
-- count nb of cities and states
SELECT COUNT(*) AS customer_location
FROM (
    SELECT DISTINCT customer_city
    FROM Customers) AS unique_locations;
    -- 4119

SELECT COUNT(*) AS customer_state_count
FROM (
    SELECT DISTINCT customer_state
    FROM Customers) AS unique_states;

    --27
-- calculate nb of different cities in SP

SELECT COUNT(*) AS nb_of_cities_in_SP
FROM (
    SELECT DISTINCT customer_city
    FROM Customers
    WHERE customer_state LIKE 'SP'
) AS unique_cities;
--629

-- null values in customer?
SELECT * FROM Customers WHERE customer_city IS NULL;
 SELECT * FROM Customers WHERE customer_state IS NULL;
 SELECT* FROM Customers WHERE customer_id IS NULL;
 SELECT * FROM Customers WHERE customer_unique_id IS NULL;
 SELECT * FROM Customers WHERE customer_zip_code_prefix IS NULL;
 --none


--check for doubled id
SELECT COUNT(*) AS check_for_double FROM ( SELECT DISTINCT customer_id FROM Customers) AS unique_id;
-- 99441
SELECT COUNT(*) AS another_check FROM Customers;
-- 99441
--no doubled value for id no checking for unique_id
SELECT COUNT(*) AS checks_double FROM ( SELECT DISTINCT customer_unique_id FROM Customers) AS customers_uniques_id;
-- 96096: doubled values

-- calculate nb of cx per state

SELECT COUNT(customer_id) AS nb_of_customer FROM Customers GROUP BY customer_state;
-- 81
-- 413
-- 148
-- 68
-- 3380
-- 1336
-- 2140
-- 2033
-- 2020
-- 747
-- 11635
-- 715
-- 907
-- 975
-- 536
-- 1652
-- 495
-- 5045
-- 12852
-- 485
-- 253
-- 46
-- 5466
-- 3637
-- 350
-- 41746
-- 280

--relation one to many pour customers -- orders 

-- orders base analysis
-- Calculate nb of products sold:
SELECT COUNT(product_id) AS nb_of_products_sold FROM OrdersItems;
-- 112650

--nb of orders
SELECT COUNT(order_id)  AS nb_orders FROM OrdersItems;  
-- 112650

SELECT SUM(price) AS sales_benefit FROM OrdersItems;
--13591643.7
