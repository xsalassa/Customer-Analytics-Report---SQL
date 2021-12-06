---How many of these customers have made transactions?
select quarter, count(customerID) as total_customers
from (select customerID, createDate, quarter(createDate) as quarter
	  from customer
	  where createDate between '2004-01-01' and '2004-06-30'
	  ) tabel_b
where customerID in (select distinct(customerID) as total_customers
					 from orders_1
					 union
					 select distinct(customerID) as
total_customers
					 from orders_2)
group by quarter;

---Output
+---------+-----------------+
| quarter | total_customers |
+---------+-----------------+
|       1 |              25 |
|       2 |              19 |
+---------+-----------------+