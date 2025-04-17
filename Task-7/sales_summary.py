import sqlite3
import pandas as pd
import matplotlib.pyplot as plt

# Step 1: Load CSV into SQLite
df_large = pd.read_csv("sales_transactions_large.csv")  # Load the large dataset

# Connect to SQLite database
conn = sqlite3.connect("sales_data_large.db")
cursor = conn.cursor()

# Step 2: Create a table for sales transactions
cursor.execute('''
CREATE TABLE IF NOT EXISTS sales (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    product TEXT,
    quantity INTEGER,
    price REAL,
    date TEXT,
    region TEXT
)
''')

cursor.execute("DELETE FROM sales")


for _, row in df_large.iterrows():
    cursor.execute("INSERT INTO sales (product, quantity, price, date, region) VALUES (?, ?, ?, ?, ?)",
                   (row['product'], row['quantity'], row['price'], row['date'], row['region']))

conn.commit()

query = """
SELECT 
    product, 
    SUM(quantity) AS total_qty, 
    SUM(quantity * price) AS revenue 
FROM sales 
GROUP BY product
"""

# Step 4: Load the query result into a pandas DataFrame
df_summary = pd.read_sql_query(query, conn)
conn.close()

# Step 5: Display the summary
print("Sales Summary:\n")
print(df_summary)

# Step 6: Plot a bar chart for total revenue by product
df_summary.plot(kind='bar', x='product', y='revenue', color='royalblue', legend=False)
plt.title("Revenue by Product")
plt.xlabel("Product")
plt.ylabel("Revenue")
plt.tight_layout()

# Save the chart as an image
plt.savefig("sales_revenue_chart.png")
plt.show()
