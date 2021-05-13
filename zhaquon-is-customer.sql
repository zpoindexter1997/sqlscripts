-- Show orders for Zha'Quon
select Name, CONCAT(City, ', ', State) 'Location', Sales, Active, Date, o.Description,OrdersId, ol.Product, ol.Description, ol.Quantity, Price, ol.Quantity * ol.Price 'Total Price'  
	from Customers c
		left join Orders o
			on c.Id = o.CustomerId
		left join OrderLines ol
			on o.Id = ol.OrdersId
		where Name like 'Zha%';

-- Create Zha'Quon as a customer
INSERT Customers
	(Name, City, State, Sales, Active)
		VALUES('Zha''Quon', 'Charleston', 'WV', 0, 1);

-- Create an order for Zha'Quon
INSERT Orders
	(CustomerId, Date, Description)
		VALUES((SELECT id from customers where city like 'Charl%'),'2021-05-13','My 1st Order');

-- Create orderlines for Zha'Quon's orders
INSERT OrderLines
	(OrdersId, Product, Description, Quantity, Price)
		VALUES ((select id from orders where date = '2021-05-13'), 'Echo', 'Amazon Echo', 1, 99.99),
		((select id from orders where date = '2021-05-13'), 'Watch', 'Timex', 2, 199.99),
		((select id from orders where date = '2021-05-13'), 'Tablet', 'Apple iPad', 3, 499.99);

