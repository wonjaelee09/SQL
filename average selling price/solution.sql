
select
	u.product_id, ROUND(sum(u.units*p.price)/sum(u.units),2) as average_price
from unitssold u
join Prices p on u.product_id = p.product_id and (u.purchase_date between p.start_date AND p.end_date)
group by product_id