SELECT 
round(sum(sales),2) as total_sales, 
round(sum(profit),2) as total_profit, 
round((sum(profit) / sum(sales))*100,1) as profit_ratio,
round(avg(discount)*100,1) as total_avg_discount,
round(sum(profit)/count(distinct order_id),2) as profit_per_order,
round(sum(sales)/count(distinct customer_id),2) as sales_per_customer
FROM orders 


SELECT country, round(sum(sales),2) as total_sales, round(sum(profit),2) as total_profit, 
round((sum(profit) / sum(sales))*100,1) as profit_ratio,
round(avg(discount)*100,1) as total_avg_discount

FROM orders 
group by country

SELECT *
FROM orders 
limit 10


 
