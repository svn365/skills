
SELECT 
to_char(date_trunc('month', order_date), 'YYYY-MM-month') as year_month, 
category, 
round(sum(sales),2) as total_sales
FROM orders 
group by 1, 2
order by 1, 3 desc

SELECT 
category, 
round(sum(sales),2) as total_sales
FROM orders 
group by 1
order by 2 desc
 
SELECT 
customer_name, 
round(sum(sales),2) as total_sales,
count(distinct order_id) as total_orders,
region
FROM orders 
group by 1, 4
order by 2 desc

SELECT 
customer_name, 
round(sum(profit),2) as total_profit,
count(distinct order_id) as total_orders,
region
FROM orders 
group by 1, 4
order by 2 desc

SELECT 
round(sum(sales),2) as total_sales,
round(sum(profit),2) as total_profit,
count(distinct order_id) as total_orders,
region
FROM orders 
group by 4
order by 2 desc