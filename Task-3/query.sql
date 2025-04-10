CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50),
    country VARCHAR(50)
);
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price NUMERIC(10,2),
    stock_quantity INT
);
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_date DATE,
    total_amount NUMERIC(10,2)
);
CREATE TABLE order_items (
    item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    product_id INT REFERENCES products(product_id),
    quantity INT,
    price_per_unit NUMERIC(10,2)
);
INSERT INTO customers (customer_name, email, city, country) VALUES
('Ravi Kumar', 'ravi.kumar@example.com', 'Bangalore', 'India'),
('Anjali Sharma', 'anjali.sharma@example.com', 'Mumbai', 'India'),
('David Lee', 'david.lee@example.com', 'New York', 'USA'),
('Emily Davis', 'emily.davis@example.com', 'Los Angeles', 'USA'),
('Sara Khan', 'sara.khan@example.com', 'Delhi', 'India'),
('John Smith', 'john.smith@example.com', 'London', 'UK'),
('Aisha Ali', 'aisha.ali@example.com', 'Dubai', 'UAE'),
('Chen Wei', 'chen.wei@example.com', 'Beijing', 'China'),
('Luis García', 'luis.garcia@example.com', 'Madrid', 'Spain'),
('Fatima Noor', 'fatima.noor@example.com', 'Lahore', 'Pakistan');

INSERT INTO products (product_name, category, price, stock_quantity) VALUES
('Wireless Mouse', 'Electronics', 799.00, 100),
('Bluetooth Headphones', 'Electronics', 1299.99, 80),
('Gaming Keyboard', 'Electronics', 2199.50, 60),
('Yoga Mat', 'Fitness', 499.00, 150),
('Dumbbells Set', 'Fitness', 999.99, 90),
('Water Bottle', 'Fitness', 299.00, 200),
('Cookware Set', 'Home & Kitchen', 1599.99, 40),
('Bedsheet Set', 'Home & Kitchen', 899.00, 75),
('LED Table Lamp', 'Home & Kitchen', 499.99, 120),
('Notebook Pack', 'Stationery', 199.00, 300);

INSERT INTO orders (customer_id, order_date, total_amount)
VALUES
(2, '2024-12-12', 890.00),
(1, '2024-12-13', 2500.00),
(3, '2024-12-15', 320.50),
(4, '2024-12-17', 1745.30),
(2, '2024-12-18', 999.99),
(1, '2024-12-20', 1100.00),
(3, '2024-12-22', 1349.75),
(4, '2024-12-24', 765.25),
(2, '2024-12-25', 450.00),
(3, '2024-12-26', 2900.00);

INSERT INTO order_items (order_id, product_id, quantity, price_per_unit)
VALUES 
(2, 3, 4, 149.50),
(2, 5, 1, 599.00),
(4, 3, 2, 149.50),
(4, 6, 1, 799.00),
(5, 2, 3, 299.99),
(5, 7, 2, 99.99),
(6, 4, 1, 49.99),
(6, 8, 2, 199.00),
(7, 1, 4, 89.00),
(7, 2, 1, 299.99),
(8, 5, 2, 599.00),
(8, 9, 1, 1499.00),
(9, 6, 2, 799.00),
(9, 3, 3, 149.50),
(10, 8, 1, 199.00);


select * from customers;
select * from products;
select * from products;
SELECT * FROM order_items;
/*
--query
-- Get all order items with quantity greater than 2
*/

SELECT * 
FROM order_items
WHERE quantity 

/*
Get top 5 expensive items (by price per unit)
*/

SELECT * 
FROM order_items
ORDER BY price_per_unit DESC
LIMIT 5;

/*
Total quantity sold per product
*/
SELECT product_id, SUM(quantity) AS total_sold
FROM order_items
GROUP BY product_id
ORDER BY total_sold DESC;

--joins
SELECT oi.order_id, p.product_name, oi.quantity, oi.price_per_unit
FROM order_items oi
INNER JOIN products p ON oi.product_id = p.product_id;


-- Find products that have been ordered more than average quantity
SELECT product_id
FROM order_items
GROUP BY product_id
HAVING SUM(quantity) > (
    SELECT AVG(quantity) FROM order_items
);
--Total revenue generated

SELECT SUM(quantity * price_per_unit) AS total_revenue
FROM order_items;

--Average order value

SELECT AVG(quantity * price_per_unit) AS avg_order_value
FROM order_items;

-- View to show total amount per order

CREATE VIEW order_summary AS
SELECT order_id, SUM(quantity * price_per_unit) AS order_total
FROM order_items
GROUP BY order_id;

select * from order_summary;

--Create an index on product_id and order_id

CREATE INDEX idx_product_id ON order_items(product_id);
CREATE INDEX idx_order_id ON order_items(order_id);

SELECT indexname, indexdef 
FROM pg_indexes 
WHERE tablename = 'order_items';
