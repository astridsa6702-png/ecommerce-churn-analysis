WITH first_order_experience as (
SELECT
c.customer_unique_id,
count(o.order_id) as total_orders,
max(
case when o.order_delivered_customer_date > o.order_estimated_delivery_date
then 1 else 0
END
) as delivered_late
FROM olist_orders_dataset as o
JOIN olist_customers_dataset as c on o.customer_id = c.customer_id
WHERE o.order_status = 'delivered'
GROUP by c.customer_unique_id
)
SELECT
case when total_orders = 1
then 'Churned' else 'Loyal'
END as customer_category,
sum(delivered_late) as total_late_deliveries,
count(*) as total_customers,
round(sum(delivered_late) * 100.0 / count(*), 2) as percentage_late_experience
FROM first_order_experience
GROUP by customer_category