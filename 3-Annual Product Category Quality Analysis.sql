-----tabel 1 revenue perusahaan masing masing tahun------
create table revenue_perusahaan_per_tahun1 as
select 
tahun, sum(revenue) as total_revenue_per_tahun
from
(select 
	total_harga + total_ongkir as revenue,
	tahun
from 
	(select
	    order_id,
		sum(price) as total_harga,
		sum(freight_value) as total_ongkir,
		tahun
	 from
		(select 
			oid.order_id,
			od.customer_id,
			od.order_status,
			oid.price,
			oid.freight_value,
			EXTRACT(YEAR FROM order_purchase_timestamp) as tahun
		from orders_dataset as od
		join order_items_dataset as oid on od.order_id = oid.order_id
		where order_status = 'delivered') as t1 
	group by order_id, tahun
	order by tahun asc)as t2) as t3
group by 1;
	
-----tabel 2 jumlah cancel order total masing masing tahun------
create table jumlah_cancel_order_per_tahun as
select 
EXTRACT(YEAR FROM order_purchase_timestamp) as tahun,
count(1) as jumlah_cancel_order_per_tahun
from orders_dataset 
where order_status = 'canceled'
group by tahun
order by tahun;

-----tabel 3 produk dengan pendapatan total tertinggi masing masing tahun------
create table produk_dengan_pendapatan_total_tertinggi_tahun as
select
tahun,
product_category_name,
category_product_revenue
from
	(select 
	EXTRACT(YEAR FROM order_purchase_timestamp) as tahun,	
	pd.product_category_name,
	sum(oid.price+oid.freight_value) as category_product_revenue,
	rank() over (PARTITION BY EXTRACT(YEAR FROM order_purchase_timestamp) ORDER BY sum(oid.price+oid.freight_value) DESC) as rk
		from orders_dataset as od
		join order_items_dataset as oid on od.order_id = oid.order_id
		join product_dataset as pd on oid.product_id = pd.product_id
		where order_status = 'delivered'
		group by 1,2)as t3
where rk = 1;


-----tabel 4 produk dengan cancel order terbanyak masing masing tahun------
create table produk_dengan_cancel_order_terbanyak_tahun as
select
tahun,
product_category_name,
jumlah_cancelled
	from
	(select 
	EXTRACT(YEAR FROM order_purchase_timestamp) as tahun,
	pd.product_category_name,
	count(1) as jumlah_cancelled,
	rank() over (PARTITION BY EXTRACT(YEAR FROM order_purchase_timestamp) ORDER BY count(1) DESC) as rk	
	from orders_dataset as od
	join order_items_dataset as oid on od.order_id = oid.order_id
	join product_dataset as pd on oid.product_id = pd.product_id
	where od.order_status = 'canceled'
	group by 1,2) as t3 
where rk = 1;

-----Menggabungkan seluruh tabel------
select 
	a.tahun,
    a.total_revenue_per_tahun,
	b.jumlah_cancel_order_per_tahun,
	c.product_category_name,
	c.category_product_revenue,
	d.product_category_name,
	d.jumlah_cancelled
from revenue_perusahaan_per_tahun1 a
join jumlah_cancel_order_per_tahun b on a.tahun = b.tahun 
join produk_dengan_pendapatan_total_tertinggi_tahun c on a.tahun = c.tahun 
join produk_dengan_cancel_order_terbanyak_tahun d on d.tahun = a.tahun

