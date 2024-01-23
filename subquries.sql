select *
from sales
limit 5

select *
from customer
limit 5

---subquries
---subquries on where function

select customer_id, sales
from sales
where customer_id in (select customer_id from customer where age > 60)

---subquries on select function

select customer_id,
       ship_mode,
	   (select customer_name from customer where sales.customer_id = customer.customer_id),
	   sales
from sales
where quantity > 3

---subquries on from

select a.product_id,
       a.product_name,
	   a.category,
	   b.quantity
	   
from product as a left join ( select product_id, 
						   sum(quantity) as quantity 
						   from sales 
						   group by product_id) as b on a.product_id = b.product_id
order by b.quantity desc
