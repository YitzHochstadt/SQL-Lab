--1
SELECT * FROM customers;
--2
SELECT country FROM customers;
--3
SELECT * FROM customers WHERE customer_id LIKE 'BL%';
--4
SELECT * FROM orders WHERE order_id < 10348;
--5
SELECT * FROM orders WHERE ship_postal_code = '1010' 
OR ship_postal_code = '3012' 
OR ship_postal_code = '12209' 
OR  ship_postal_code ='05023';
--6
SELECT * FROM orders WHERE ship_region <> 'null';
--7
SELECT * FROM customers ORDER BY country, city;
--8
INSERT INTO customers (customer_id, company_name, contact_name, contact_title, address, city, region, postal_code, country, phone, fax)
VALUES('GREEK', 'Greek Stereotypes Anonymous.', 'Mykonos', 'Greek Man Extroadinare', '123 Yogurt Lane', 'Athens', 'Attica', '104-31', 'Greece', '(21)-3-211-8495', '(21)-3-211-8495')
--9
UPDATE orders SET ship_region ='EuroZone' WHERE ship_country = 'France';
--10
DELETE FROM order_details WHERE quantity=1;
--11
SELECT AVG(quantity) AS "Average", MAX(quantity) AS "Max", MIN(quantity) AS "Min" FROM order_details;
--12
SELECT AVG(quantity), MAX(quantity) , MIN(quantity) FROM order_details GROUP BY order_id;
--13
SELECT customer_id FROM orders
WHERE order_id = 10290;
--14
SELECT * FROM orders
INNER JOIN customers ON orders.customer_id = customers.customer_id;

SELECT * FROM orders
LEFT JOIN customers ON orders.customer_id = customers.customer_id;

SELECT * FROM orders
RIGHT JOIN customers ON orders.customer_id = customers.customer_id;
--15
SELECT ship_city, ship_country FROM orders
JOIN customers ON orders.customer_id = customers.customer_id
WHERE customers.city = 'London';
--16
SELECT ship_name FROM orders
JOIN order_details ON orders.order_id = order_details.order_id
JOIN products ON order_details.product_id = products.product_id
WHERE products.discontinued = 1;
--17
SELECT manager.first_name FROM employees AS "subordinate"
JOIN employees AS "manager" ON subordinate.reports_to = manager.employee_id
WHERE manager.first_name <> 'Steven';
--18
SELECT subordinate.first_name FROM employees AS "subordinate"
JOIN employees AS "manager" ON subordinate.reports_to = manager.employee_id;