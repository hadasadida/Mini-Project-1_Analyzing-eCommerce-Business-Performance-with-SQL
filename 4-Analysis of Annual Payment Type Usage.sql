-----no 1 (Jumlah penggunaan masing-masing jenis pembayaran all time)--------
select
	opd.payment_type,
	count(1) as jumlah_payment_type
	from order_payments_dataset as opd
	join order_items_dataset as oid on opd.order_id = oid.order_id
	group by 1
	order by 2;

-----no 2 (jumlah penggunaan masing-masing jenis pembayaran untuk setiap tahun)--------
with 
tmp as (
select 
	date_part('year', o.order_purchase_timestamp) as tahun,
	op.payment_type,
	count(1) as jumlah_payment_type_tiap_tahun
from order_payments_dataset op 
join orders_dataset o on o.order_id = op.order_id
group by 1, 2
) 

select *,
	case when tahun_2017 = 0 then NULL
		else round((tahun_2018 - tahun_2017) / tahun_2017, 2)
	end as pct_change_2017_2018
from (
select 
  payment_type,
  sum(case when tahun = '2016' then jumlah_payment_type_tiap_tahun else 0 end) as tahun_2016,
  sum(case when tahun = '2017' then jumlah_payment_type_tiap_tahun else 0 end) as tahun_2017,
  sum(case when tahun = '2018' then jumlah_payment_type_tiap_tahun else 0 end) as tahun_2018
from tmp 
group by 1) subq
order by 5 desc
