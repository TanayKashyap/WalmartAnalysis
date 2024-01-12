# Generic Questions

# How Many Unique cities does the data have?
select distinct city from sales;

# In which city is each branch
select distinct city, branch from sales;

## Product
# How many unique product lines does this data have
select count(distinct product_line) from sales;

# What is the most common payment method
select payment, count(*) as theCount
from sales
group by payment
order by theCount desc
limit 1;

# What is the most selling product line
select product_line, count(*) as theCount
from sales
group by product_line
order by theCount desc
limit 1;

# What is the total revenue by month
select sum(total) as 'total revenue', month_name
from sales
group by month_name;

# What month had the largest COGS
select sum(cogs) as 'total cogs', month_name
from sales
group by month_name
order by 'total cogs' desc
limit 1;

# What product line had the largest revenue
select sum(total) as 'total revenue per product', product_line
from sales
group by product_line
order by 'total revenue per product' desc
limit 1;

# What is the city with the largest revenue
select sum(total) as 'total revenue per product', city
from sales
group by city
order by 'total revenue per product' desc
limit 1;

# What product line has the largest VAT
select avg(tax_pct) as 'avg vat per product', product_line
from sales
group by product_line
order by 'total vat per product' desc
limit 1;

# which brand sold more products than average products sold
select sum(quantity) as qnty, branch
from sales
group by branch
having qnty > (select avg(quantity) from sales);

# Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
select product_line,round(avg(total),2) as avg_sales,
(case
	when avg(total) > (select avg(total) from sales) then "good"
    else "bad"
end) as remarks
from sales
group by product_line;

# What is the most common product line by gender?
select gender, product_line, count(gender) as total_cnt
from sales
group by gender, product_line
order by total_cnt desc;

# What is the average rating of each product line?
select product_line, avg(rating) as "avg rating"
from sales
group by product_line;

## Sales
# Number of sales made in each time of the day per weekday
SELECT
  CASE
    WHEN day_name IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday') THEN 'Weekday'
    ELSE 'Weekend'
  END AS day_category,
  time_of_day,
  COUNT(*) AS total_sales
FROM sales
GROUP BY day_category, time_of_day
ORDER BY day_category, total_sales DESC;

# Which of the customer types brings the most revenue?
select sum(total) as "total revenue by customer type" , customer_type
from sales
group by customer_type
order by sum(total) desc;

# Which city has the largest tax percent/ VAT (Value Added Tax)?
select avg(tax_pct),city
from sales
group by city
order by avg(tax_pct) desc;

# Which customer type pays the most in VAT?
select customer_type, avg(tax_pct) as total_tax
from sales
group by customer_type
order by total_tax;

# Customer
# How many unique customer types does the data have?
select distinct customer_type from sales;

# How many unique payment methods does the data have?
select distinct payment from sales;

# What is the most common customer type
select customer_type, count(customer_type) as total_cnt
from sales
group by customer_type
order by total_cnt desc;

# Which customer type buys the most
select customer_type, avg(total) as avg_total
from sales
group by customer_type
order by avg_total;

# What is the gender of most the customers
select gender, count(gender) as gnd_cnt
from sales
group by gender
order by gnd_cnt desc;

# What is the gender distribution per branch?
select count(gender),gender,branch
from sales
group by gender,branch;

# Which time of the day do customers give most ratings?
select count(rating), time_of_day
from sales
group by time_of_day;

# Which time of the day do customers give most ratings per branch?
select count(rating), time_of_day, branch
from sales
group by time_of_day,branch
order by count(rating) desc;

# Which day of the week has the best avg ratings?
select day_name, avg(rating) as avg_rating
from sales
group by day_name
order by avg_rating desc;

# Which day of the week has the best average ratings per branch?
select day_name, avg(rating) as avg_rating, branch
from sales
group by day_name, branch
order by avg_rating desc;


