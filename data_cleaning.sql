--> Preview the data
Select *
From retail_sales
Limit 100

--!> 1. Count how many rows did we import in the table. It suppose to be 2k records
Select count(*)
From retail_sales

--!> 2. Check the rows for NULLs
Select *
From retail_sales
Where 
    transaction_id is Null
    or sale_time is Null
    or sale_date is Null
    or customer_id is Null
    or gender is Null
    or age is Null
    or category is Null
    or quantity is Null
    or price_per_unit is Null
    or cogs is Null
    or total_sale is Null

--!> 3. We found 3 rows without any 'quantity', 'price_per_unit', 'cogs', 'total_sale' values.
--!> These values are crucial, so we can't let NULLs sit there. Delete these values.
Delete From retail_sales
Where 
    quantity is NULL
    and price_per_unit is NULL
    and cogs is Null
    and total_sale is Null              --?> 3 rows were affected

--!> Check the data. We suppose to have 1997 records
Select count(*)
From retail_sales