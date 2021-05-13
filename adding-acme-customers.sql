Insert Customers (Name, City, State, Sales, Active)
	Values 
	('ACME MFG CO 1', 'Cincinnati', 'OH', 1000, 1),
	('ACME MFG CO 2', 'Cincinnati', 'OH', 2000, 0),
	('ACME MFG CO 3', 'Cincinnati', 'OH', 3000, 1);

UPDATE Customers set
	Name = 'Acme Mfg Co 0',
	Sales = 0
		where name = 'ACME MFG CO';

Select * from Customers
	where name like 'ACME%';

Delete Customers
	where name like '%3';

