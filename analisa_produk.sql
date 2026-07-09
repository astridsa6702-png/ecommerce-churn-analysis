SELECT
p.product_category_name as category,
count(DISTINCT oi.order_id) as total_orders,
round(sum(oi.price), 2) as total_revenue,
round(avg(r.review_score), 2) as avg_rating
FROM olist_order_items_dataset as oi
LEFT JOIN olist_products_dataset as p
on oi.product_id = p.product_id
LEFT JOIN olist_order_reviews_dataset as r
on oi.order_id = r.order_id
GROUP by category
ORDER by total_revenue DESC
LIMIT 10