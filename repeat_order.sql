WITH customer_orders as (
SELECT
c.customer_unique_id,
count(o.order_id) as total_orders
FROM olist_orders_dataset as o
JOIN olist_customers_dataset as c on o.customer_id = c.customer_id
WHERE o.order_status = 'delivered'
group by c.customer_unique_id
)
SELECT
total_orders,
count(customer_unique_id) as total_customers,
round(count(customer_unique_id) * 100.0 / (SELECT count(*) from customer_orders), 2)
as percentage
FROM customer_orders
group by total_orders