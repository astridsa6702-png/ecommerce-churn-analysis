SELECT
p.payment_type as payment_method,
count(DISTINCT p.order_id) as total_transactions,
round(sum(p.payment_value), 2) as total_omset,
round(avg(p.payment_value), 2) as avg_nilai_belanja,
round(sum(p.payment_installments), 1) as avg_bulan_cicilan
from olist_order_payments_dataset as p
INNER JOIN olist_orders_dataset as o on p.order_id = o.order_id
WHERE o.order_status <> 'canceled'
group by payment_method
order by total_omset DESC