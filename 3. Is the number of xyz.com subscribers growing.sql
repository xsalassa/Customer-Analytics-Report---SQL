---Is the number of xyz.com subscribers growing?
select quarter, count(customerID) as total_customers
FROM (select customerID, createDate, quarter(createdate) as quarter
	  from customer
	  where createdate between '2004-01-01' and '2004-06-30'
	  )tabel_b
group by quarter;

---Output
+---------+-----------------+
| quarter | total_customers |
+---------+-----------------+
|       1 |              43 |
|       2 |              35 |
+---------+-----------------+