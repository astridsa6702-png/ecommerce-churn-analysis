SELECT
c.customer_state as customer_origin,
s.seller_state as seller_origin,
count(o.order_id) as total_orders,
sum(case when o.order_delivered_customer_date > o.order_estimated_delivery_date then 1
ELSE 0
end) as late_deliveries,
round(sum(case when o.order_delivered_customer_date > o.order_estimated_delivery_date then 1.0
ELSE 0.0
end) / count(o.order_id) * 100, 2) || '%' as late_percentage
FROM olist_orders_dataset as o
left join(
SELECT DISTINCT customer_id, customer_state
FROM olist_customers_dataset
) as c on o.customer_id = c.customer_id
left join olist_order_items_dataset as oi
on o.order_id = oi.order_id
left join olist_sellers_dataset as s
on oi.seller_id = s.seller_id
GROUP by customer_origin, seller_origin
ORDER by late_deliveries DESC
LIMIT 10