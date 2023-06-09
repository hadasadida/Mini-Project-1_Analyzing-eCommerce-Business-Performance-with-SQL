-----no 1 Rata-rata Monthly Active User (MAU) per tahun-----
select _Year, round(avg(jumlah_monthly_active_user), 2) as average_monthly_active_user
from		 
	(SELECT 
	  	 EXTRACT(YEAR FROM od.order_purchase_timestamp) as _Year,
	   	 EXTRACT(MONTH FROM od.order_purchase_timestamp) as _Month,
	     COUNT(distinct cd.customer_unique_id) AS jumlah_monthly_active_user
	from orders_dataset as od
	join customers_dataset as cd on od.customer_id = cd.customer_id
	GROUP BY 
		 1,2) as b
group by _Year
order by _Year;

-----no 2 Total customer baru per tahun-----
select count(1), EXTRACT(YEAR FROM first_purchase_time) as _Year
from		 
		(SELECT cd.customer_unique_id,
		        min(od.order_purchase_timestamp) as first_purchase_time
		from orders_dataset as od
		join customers_dataset as cd on od.customer_id = cd.customer_id
		GROUP BY
			 1) as b
group by _Year
order by _Year;

-----no 3 Jumlah customer yang melakukan repeat order per tahun-----

select count(distinct customer_unique_id) as jumlah_repeating_customer, _Year
from		 
		(SELECT cd.customer_unique_id, 
			 EXTRACT(YEAR FROM order_purchase_timestamp) as _Year,
			 COUNT(1) AS jumlah_customer
		from orders_dataset as od 
		JOIN customers_dataset as cd on od.customer_id = cd.customer_id
		GROUP BY 1,2
		having count(1) > 1
			 ) as b
group by _Year
order by _Year;

-----no 4 Rata-rata frekuensi order untuk setiap tahun-----
select _Year, round(avg(freq_purchases),3) as avg_orders_per_customer
	from		 
		(SELECT cd.customer_unique_id, 
			 EXTRACT(YEAR FROM order_purchase_timestamp) as _Year,
			 COUNT(1) AS freq_purchases
		from orders_dataset as od 
		JOIN customers_dataset as cd on od.customer_id = cd.customer_id
		GROUP BY
			 1,2) as b
group by _Year
order by _Year;

-----no 5 Master Table-----
with monthly_active_user_per_year as (
		select _Year, round(avg(jumlah_monthly_active_user), 2) as average_monthly_active_user
from		 
	(SELECT 
	  	 EXTRACT(YEAR FROM od.order_purchase_timestamp) as _Year,
	   	 EXTRACT(MONTH FROM od.order_purchase_timestamp) as _Month,
	     COUNT(distinct cd.customer_unique_id) AS jumlah_monthly_active_user
	from orders_dataset as od
	join customers_dataset as cd on od.customer_id = cd.customer_id
	GROUP BY 
		 1,2) as b
group by _Year
order by _Year
),
new_customer as (
		select count(1) as jumlah_new_customer, EXTRACT(YEAR FROM first_purchase_time) as _Year
from		 
		(SELECT cd.customer_unique_id,
		        min(od.order_purchase_timestamp) as first_purchase_time
		from orders_dataset as od
		join customers_dataset as cd on od.customer_id = cd.customer_id
		GROUP BY
			 1) as b
group by _Year
order by _Year

),
repeat_order as (
			select count(distinct customer_unique_id) as jumlah_repeating_customer, _Year
from		 
		(SELECT cd.customer_unique_id, 
			 EXTRACT(YEAR FROM order_purchase_timestamp) as _Year,
			 COUNT(1) AS jumlah_customer
		from orders_dataset as od 
		JOIN customers_dataset as cd on od.customer_id = cd.customer_id
		GROUP BY 1,2
		having count(1) > 1
			 ) as b
group by _Year
order by _Year
),
freq_order as (
		select _Year, round(avg(freq_purchases),3) as avg_orders_per_customer
	from		 
		(SELECT cd.customer_unique_id, 
			 EXTRACT(YEAR FROM order_purchase_timestamp) as _Year,
			 COUNT(1) AS freq_purchases
		from orders_dataset as od 
		JOIN customers_dataset as cd on od.customer_id = cd.customer_id
		GROUP BY
			 1,2) as b
group by _Year
order by _Year
)
select 
    mau._Year, 
	mau.average_monthly_active_user, 
	newcust.jumlah_new_customer,
	repord.jumlah_repeating_customer, 
	freqord.avg_orders_per_customer
from monthly_active_user_per_year mau 
join new_customer newcust on mau._Year = newcust._Year
join repeat_order repord on repord._Year = mau._Year
join freq_order freqord on freqord._Year = mau._Year







