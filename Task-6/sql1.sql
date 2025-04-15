CREATE TABLE orders (
    order_id VARCHAR,
    customer_id VARCHAR,
    order_status VARCHAR,
    order_purchase_timestamp TIMESTAMP,
    order_approved_at TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP
);

CREATE TABLE order_payments (
    order_id VARCHAR,
    payment_sequential INT,
    payment_type VARCHAR,
    payment_installments INT,
    payment_value NUMERIC
);

select * from orders;

select * from order_payments;


SELECT
    EXTRACT(YEAR FROM order_purchase_timestamp) AS order_year,
    EXTRACT(MONTH FROM order_purchase_timestamp) AS order_month
FROM
    orders
LIMIT 5;

SELECT
    EXTRACT(YEAR FROM o.order_purchase_timestamp) AS order_year,
    EXTRACT(MONTH FROM o.order_purchase_timestamp) AS order_month,
    SUM(p.payment_value) AS total_revenue
FROM
    orders o
JOIN
    order_payments p ON o.order_id = p.order_id
GROUP BY
    order_year, order_month
ORDER BY
    order_year, order_month;

SELECT
    EXTRACT(YEAR FROM o.order_purchase_timestamp) AS order_year,
    EXTRACT(MONTH FROM o.order_purchase_timestamp) AS order_month,
    SUM(p.payment_value) AS total_revenue,
    COUNT(DISTINCT o.order_id) AS order_volume
FROM
    orders o
JOIN
    order_payments p ON o.order_id = p.order_id
GROUP BY
    order_year, order_month
ORDER BY
    order_year, order_month;

