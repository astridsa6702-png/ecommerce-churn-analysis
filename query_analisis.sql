SELECT
CASE
WHEN r.review_score >= 4 THEN "Puas"
WHEN r.review_score = 3 THEN "Biasa"
WHEN r.review_score <= 2 THEN "Kecewa"
ELSE "No reviews"
END AS review_status,
SUM(CASE WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date THEN 1
ELSE 0
END) AS late_deliveries,
COUNT(o.order_id) AS total_orders
FROM olist_orders_dataset AS o
LEFT JOIN olist_order_reviews_dataset AS r ON o.order_id = r.order_id
GROUP BY review_status