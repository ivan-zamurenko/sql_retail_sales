--> Preview the data
Select *
From retail_sales
Limit 10

--!> 1. How many sales do we have?
Select count(*) From retail_sales                   --?> 1997 sales

--!> 2. How many unique customers do we have?
Select count (DISTINCT customer_id)
From retail_sales                                   --?> 155 unique customers in total

--!> 3. How many unique categories do we have?
Select DISTINCT category
From retail_sales                                   --?> 3 unique category (Electronics, Clothing, Beauty)