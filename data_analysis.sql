--> Preview the data
Select *
From retail_sales
Limit 100


--!> 1. All columns for sales on '2022-02-24'
Select * From retail_sales
Where sale_date = '2022-02-24'                                  --?> 2 sales were made


--!> 2. What quantity of 'Clothing' was sold in November 2022
With cloth_sell_volume as (
    --!> 2.1 Retrieve all transactions where category is 'Clothing' and the quantity is more than 4, in November 2022
    Select * From retail_sales
    Where
        category = 'Clothing'
        and quantity >= 4
        and sale_date BETWEEN DATE '2022-11-01' and  DATE '2022-11-30'
)                                                               --?> 17 sales were made
Select sum(quantity) From cloth_sell_volume                     --?> 68 pieces were sold


--!> 3. Calculate the 'total_sale' for each category and show how many sales by category
Select 
    category
    , sum(total_sale) as total_sum                              --?> Beauty - 286840 | Clothing - 311070 | Electronics - 313810
    , count(*) as orders                                        --?> Beauty - 612 orders | Clothing - 701 orders | Electronics - 684 orders
From retail_sales
Group By category
Order by total_sum ASC                                           


--!> 4. Find the average 'age' of customers, who purchased items from the 'Beauty'-category
Select 
    round(avg(age), 2) as average_age                           --?> 40.42 is the average age of the customers who purchased 'Beauty' products
From retail_sales
Where category = 'Beauty'


--!> 5. Find all transactions where the 'total_sale' is greater than 1000
Select * From retail_sales
Where total_sale > 1000                                         --?> 306 records


--!> 6. Find the amount of transactions made by each 'gender' in each 'category'
Select
    category
    , gender
    , count(transaction_id) as orders
From retail_sales
Group By category, gender
Order By category ASC, orders ASC


--!> 7. Calculate the average sale for each month. Find out the best performing month in each year.
With monthly_avg as (
        --?> 7.1 Calculate the sum for each month.
    Select 
        to_char(sale_date, 'YYYY') as year 
        , to_char(sale_date, 'YYYY-MM') as month
        , round(avg(total_sale)) as average_income_per_month
    From retail_sales
    Group By year, month
    Order by month ASC
)
        --?> 7.2 Rank each month within its year by average income
, ranked_months as (
    Select *
        , rank() Over (Partition By year Order By average_income_per_month DESC) as rank_in_year
    From monthly_avg
)
        --?> 7.3 Preview data with the best performing month per year
Select
    year
    , month 
    , average_income_per_month
From ranked_months
Where rank_in_year = 1
Order By year 


--!> 8. Find TOP-5 customers, based on the highest total sales
Select 
    customer_id
    , sum(total_sale) as total_sum
    , dense_rank() over (Order By sum(total_sale) DESC) as leaderboard
From retail_sales
Group By customer_id
Limit 5


--!> 9. Find the number of unique customers who purchased items from each category
Select 
    category
    , count(DISTINCT customer_id) as unique_customers
    From retail_sales
Group By category


--!> 10. Create each shift (Morning ~ 04 - 12 | Afternoon ~ 12 - 17 | Evening ~ 17 - 04) and numbers of orders
With morning_shift as (
    --?> Searching for orders during the morning shifts
    Select count(*) as morning_orders
    From retail_sales
    Where EXTRACT(HOUR From sale_time) BETWEEN 4 and 11
)
    --?> Searching for orders during the afternoon shifts
, afternoon_shift as (
    Select count(*) as afternoon_orders
    From retail_sales
    Where EXTRACT(HOUR From sale_time) BETWEEN 12 and 16
)
    --?> Searching for orders during the evening shifts
, evening_shift as (
    Select count(*) as evening_orders
    From retail_sales
    Where EXTRACT(HOUR From sale_time) >= 17 or EXTRACT(HOUR From sale_time) < 4
)
--?> Join everything into one table
Select
    m.morning_orders
    , a.afternoon_orders
    , e.evening_orders
From morning_shift m
Join afternoon_shift a On TRUE
Join evening_shift e On TRUE

--> The second option how we can find the answer
Select 
    CASE 
        WHEN EXTRACT(HOUR From sale_time) BETWEEN 4 and 11 THEN 'Morning'
        WHEN EXTRACT(HOUR From sale_time) BETWEEN 12 and 16 THEN 'Afternoon'
        ELSE 'Evening'
    END as shift
    , count(*) as orders
From retail_sales
Group By shift
ORDER BY shift