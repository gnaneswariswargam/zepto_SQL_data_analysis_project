# zepto_SQL_data_analysis_project
**** Project Description****
This project is a comprehensive SQL-based data analysis of a fictional Zepto e-commerce grocery dataset, done using PostgreSQL and pgAdmin. It focuses on exploring customer behavior, product sales trends, pricing strategies, and inventory management. The goal is to derive actionable business insights through real-world SQL queries such as aggregations, joins, filters, and window functions.
**This project is ideal for:**
Practicing SQL for interviews or portfolio building
Understanding how data analytics helps in e-commerce decisions
Showcasing real-life business problem-solving using SQL

---

## 📊 Dataset Overview

The dataset contains fictional product-level transactional data from Zepto grocery e-commerce platform.

| Column Name            | Description                          |
|------------------------|--------------------------------------|
| transaction_id         | Unique ID for each transaction       |
| customer_id            | Customer identifier                  |
| customer_name          | Name of the customer                 |
| customer_age           | Age of customer                      |
| gender                 | Gender (M/F)                         |
| product_id             | Product identifier                   |
| product_name           | Product name                         |
| product_category       | Category like fruits, snacks, etc.   |
| quantity               | Quantity purchased                   |
| price                  | Price per unit                       |
| discountPercent        | Discount offered                     |
| discountedSellingPrice | Final price after discount           |
| availableQuantity      | Units in stock                       |
| purchase_date          | Date of transaction                  |
| time_of_purchase       | Time of purchase                     |
| status                 | Order completed (True/False)         |

---

## 🧠 Key Objectives

- Identify high-demand product categories
- Analyze price vs discount strategy
- Find products that frequently go out of stock
- Calculate total revenue and average order values
- Segment customers based on purchase behavior

---

## 🛠️ Tools Used

- **PostgreSQL** (v17)
- **pgAdmin**
- **SQL** (Joins, Aggregations, Window Functions, Subqueries)
- *(Optional)* Excel for basic visualization

---

## 🔍 Sample SQL Queries

```sql
-- Total sales by category
SELECT product_category, 
 SUM(quantity * discountedSellingPrice) AS total_revenue
FROM zepto
GROUP BY product_category
ORDER BY total_revenue DESC;

-- Out of stock products
SELECT product_name, availableQuantity
FROM zepto
WHERE outOfStock = true;

📈 Key Insights
Beverages and Snacks are the top revenue-generating categories.
A few products had stockouts repeatedly — impacting sales.
Average discount offered was around 12.5%, with some outliers.
High-value customers tend to shop during weekends.

🧾 Conclusion
This project helped practice SQL skills on a real-world-like dataset by generating business insights from raw transactional data. It’s a good fit for those learning data analytics or preparing for SQL interviews.
