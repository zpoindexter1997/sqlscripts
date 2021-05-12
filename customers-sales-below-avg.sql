-- all of our customers that have sales less than the avg of all customers

select *
	from Customers
		where Sales < (select avg(sales) 
							from Customers)
		order by Sales desc;

select avg(sales) 'Average Sales'
	from Customers