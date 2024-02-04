SELECT 
round(sum(sales),2) as total_sales,
round(sum(profit),2) as total_profit,
count(distinct order_id) as total_orders,
orders.region,
people.person
FROM orders join people on orders.region=people.region 
group by 4,5
order by 2 desc

SELECT 
(select count(distinct orders.order_id) as total_orders from orders),
count(distinct returns.order_id) as return_orders,
orders.region,
people.person
FROM orders join returns on orders.order_id=returns.order_id 
join people on orders.region=people.region 
group by 3,4

SELECT 
round(sum(sales),2) as total_sales,
round(sum(profit),2) as total_profit,
count(distinct order_id) as total_orders
FROM orders join people on orders.region=people.region 
order by 2 desc

SELECT 
round((count(distinct returns.order_id)*1.00 / (select count(distinct orders.order_id)*1.00 from orders)*100),2) as total_returns
FROM orders left join returns on orders.order_id=returns.order_id 

WITH orders_full (return_all, return_on) as 
    (SELECT 
    count(distinct orders.order_id),
    count(distinct returns.order_id)
        FROM orders left join returns on orders.order_id=returns.order_id)
SELECT round((return_on*1.00/return_all*1.00)*100,2) as return_procent
FROM orders_full 

WITH orders_on (return_on) as 
    (SELECT 
    count(distinct returns.order_id)
        FROM returns),
    orders_full (return_all) as 
    (SELECT 
    count(distinct orders.order_id)
        FROM orders)    
SELECT round((return_on*1.00/return_all*1.00)*100,2) as return_procent,
100.00-round((return_on*1.00/return_all*1.00)*100,2) as not_return
FROM orders_full, orders_on

SELECT
    customer_name,
    sum(profit),
    row_number() OVER (ORDER BY sum(profit) DESC)  AS rating
FROM orders
group by 1
ORDER BY 2 desc
limit 10
