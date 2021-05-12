-- calculate the line total (price * quantity)

select c.Name 'Customer', o.Description 'Order', ol.Description 'Product', o.Date, ol.Quantity, ol.Price, ol.Quantity * ol.Price as 'Line Total'
	from Orders o
	join orderlines ol
		on o.Id = ol.OrdersId
	join customers c
		on o.CustomerId = c.Id
	order by c.Name;

 