---How many customers are still actively transacting after the first transaction?
#Calculating the total unique customers who transacted in quarter_1
SELECT COUNT(DISTINCT customerID) as total_customers FROM orders_1;
#output = 25
SELECT '1' as quarter, count(distinct customerID)/25*100 as q2 from orders_1
where customerID in (select distinct customerID from orders_2);

---Output
+-----------------+
| total_customers |
+-----------------+
|              25 |
+-----------------+
+---------+---------+
| quarter | q2      |
+---------+---------+
| 1       | 24.0000 |
+---------+---------+