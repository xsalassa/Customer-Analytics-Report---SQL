---What product categories did customers order the most in Quarter-2?
select * 
from (select categoryID, count(distinct ordernumber) as total_order,
	  sum(quantity) as total_penjualan
	  from (select productCode, orderNumber, quantity, status,
			left(productCode, 3) as categoryID
			from orders_2
			where status = 'Shipped'
			) tabel_c
	  group by categoryID) sub
order by total_order desc;

---Output
+------------+-------------+-----------------+
| categoryID | total_order | total_penjualan |
+------------+-------------+-----------------+
| S18        |          25 |            2264 |
| S24        |          21 |            1826 |
| S32        |          11 |             616 |
| S12        |          10 |             491 |
| S10        |           8 |             492 |
| S50        |           8 |             292 |
| S70        |           7 |             675 |
| S72        |           2 |              61 |
+------------+-------------+-----------------+