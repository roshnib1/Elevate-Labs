# E-commerce Sales Trend Analysis

## Project Overview
This project performs a **Sales Trend Analysis** on an **E-commerce dataset** to analyze monthly revenue and order volume. Using **PostgreSQL**, the data is aggregated and analyzed by month and year.

### Dataset:
The dataset used for this project is available from Kaggle:  
**[E-commerce Dataset – Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)**

The dataset contains the following relevant CSV files:
- `orders.csv`: Contains details about orders (e.g., `order_id`, `order_purchase_timestamp`, etc.)
- `order_payments.csv`: Contains payment information for each order (e.g., `order_id`, `payment_value`, etc.)

## Tools & Technologies
- **PostgreSQL**: For database management and SQL query execution.
- **SQL**: For querying and aggregating data.
- **VS Code**: For writing and running SQL scripts.

## Setup

### 1. Install PostgreSQL:
- Download and install PostgreSQL from [here](https://www.postgresql.org/download/).
- Install **pgAdmin** or use **DBeaver** for database management.

### 2. Create Database:
- Open **pgAdmin** or **DBeaver** and create a new database named `ecommerce_analysis`.

### 3. Create Tables:
- In PostgreSQL, create the following tables by running the SQL script below:

```sql
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
