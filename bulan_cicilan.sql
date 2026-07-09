SELECT
payment_installments as total_bulan_cicilan,
count(order_id) as total_order,
round(sum(payment_value), 2) as total_nilai
FROM olist_order_payments_dataset
WHERE payment_type = 'credit_card'
group by total_bulan_cicilan
order by total_bulan_cicilan desc