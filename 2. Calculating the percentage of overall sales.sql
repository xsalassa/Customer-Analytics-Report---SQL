--- Total Sales and Revenue in Quarter-1 (Jan, Feb, Mar) and Quarter-2 (Apr, May,Jun) Data Orders 1
select 
sum(quantity) as total_penjualan,
sum(quantity * priceeach) as revenue
from
orders_1
where 
status = 'Shipped';
--- Total Sales and Revenue in Quarter-1 (Jan, Feb, Mar) and Quarter-2 (Apr, May,Jun) Data Orders 2
select
sum(quantity) as total_penjualan,
sum(quantity * priceeach) as revenue
from
orders_2
where
status = 'Shipped';

--Ouput
+-----------------+-----------+
| total_penjualan | revenue   |
+-----------------+-----------+
|            8694 | 799579310 |
+-----------------+-----------+
+-----------------+-----------+
| total_penjualan | revenue   |
+-----------------+-----------+
|            6717 | 607548320 |
+-----------------+-----------+

---Calculating the percentage of overall sales
select quarter, sum(quantity) as total_penjualan, sum(quantity*priceeach) as revenue
from
(select orderNumber, status, quantity, priceeach, '1' as quarter
 from orders_1
 union
 select orderNumber, status, quantity, priceeach, '2' as quarter
 from orders_2
 ) tabel_a
where status = 'Shipped'
group by quarter;


--- Output
+---------+-----------------+-----------+
| quarter | total_penjualan | revenue   |
+---------+-----------------+-----------+
| 1       |            8694 | 799579310 |
| 2       |            6717 | 607548320 |
+---------+-----------------+-----------+