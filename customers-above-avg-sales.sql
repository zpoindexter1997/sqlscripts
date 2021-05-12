select *
	from Customers
	where Sales > (select avg(sales) as 'Average' from Customers) or sales < 20000
	order by Sales desc
	