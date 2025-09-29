--!> Create a new table 'Sales'
Drop Table if Exists retail_sales

Create Table retail_sales(
    transactions_id int4 Primary key,
	sale_date Date,
	sale_time Time,
	customer_id int4,
	gender varchar(15),
	age int4,
	category varchar(50),
	quantity int4,
	price_per_unit float,
	cogs float4,
	total_sale float
)

--> Check the table
Select *
From retail_sales