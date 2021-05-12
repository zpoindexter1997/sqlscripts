-- List of orders, customer, and what they ordered

select o.Id 'Order Id', o.date, o.Description, 
	c.Name, concat(c.city, ', ', c.state) 'Location' , c.Sales,
	ol.Product, ol.Description, ol.Price, ol.Quantity, ol.Quantity * ol.Price 'Line Total'
		from Orders o
			join Customers c
				on o.CustomerId = c.Id
			join OrderLines ol
				on o.Id = ol.OrdersId
			where c.City != 'Cleveland'
			order by o.Date, ol.Price