select * 
	from Customers
		where City in (select distinct city
							from Customers
								where city like 'Cin%' or city like 'Col%')