# 🛍️ Retail Sales Analysis (PostgreSQL)

Time-series and categorical analysis of retail sales data, focusing on customer behavior, product category performance, and time-of-day sales trends.

---

## 📊 Project Overview

The primary goal of this project was to analyze transaction data from a retail business to gain insights into sales volume, customer demographics, and purchasing patterns over time. This analysis helps identify high-performing product categories, key customer segments, and sales distribution across different times of day.

The insights support business decisions around inventory management, marketing strategies, and customer targeting.

---

## 🔧 Main Challenges

- Aggregating and ranking monthly sales data to find peak sales periods.
- Segmenting sales into daily shifts (Morning, Afternoon, Evening), including those that span across midnight.
- Identifying unique customers purchasing across multiple product categories.
- Handling time-based data and customer demographics in a scalable way.

---

## 🧾 Key Terms and Definitions

- **Total Sale** – Revenue generated from a single transaction.
- **Shift** – Time-of-day segments for sales analysis:
  - **Morning**: 04:00–11:59  
  - **Afternoon**: 12:00–16:59  
  - **Evening**: 17:00–03:59
- **Unique Customers** – Customers who made at least one purchase in a given category.
- **Top Customers** – Customers ranked by total accumulated sales.

---

## 🚀 Main Stages

- Used PostgreSQL queries and Common Table Expressions (CTEs) to structure analysis.
- Calculated average monthly sales and identified top-performing months per year.
- Ranked customers by total sales using window functions.
- Counted unique customers per product category.
- Segmented daily sales activity into shifts using both CTEs and conditional logic.
- Analyzed demographic trends such as age and gender by category.

---

## 🛠️ Functions and Techniques Used

- `WITH` CTEs for modular SQL structure  
- Window functions: `RANK()`, `DENSE_RANK()`  
- Aggregations: `SUM()`, `AVG()`, `COUNT(DISTINCT ...)`  
- Date/time operations: `EXTRACT()`, `TO_CHAR()`, `DATE_TRUNC()`  
- Conditional logic with `CASE`  
- Joins using `TRUE` to combine single-row aggregates  

---

## 🔮 Next Steps

- 🔍 Expand analysis by geographic location or store branch  
- 📈 Segment customers based on purchase frequency and recency  
- 🎯 Evaluate the effect of promotions or discounts  
- 📅 Integrate external factors such as holidays or weather  
- 📊 Build dashboards or real-time visualizations for sales monitoring  

---

## 📬 Contact

If you have questions or want to collaborate, feel free to reach out!

---

> This project was developed using **PostgreSQL** to analyze and extract actionable insights from retail sales data.
