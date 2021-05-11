select city, sum(sales) 'sales'
	from Customers
	group by City
	having sum(sales) > 600000;