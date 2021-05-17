CREATE OR ALTER PROCEDURE AddProduct
@vendorname varchar(30) = '',
@partnbr varchar(30) = '',
@name varchar(30) = '',
@price decimal(11,2) = 0.00,
@unit varchar(30) = '',
@photopath varchar(30) = null


AS
BEGIN
	IF @vendorname  = ''
			BEGIN
				PRINT 'Missing Required Vendor Name'
			RETURN -1;
		END
		DECLARE @vendorid int = 0;
		SELECT top 1 @vendorid = Id from Vendors where name = @vendorname
	IF not exists (select 1 from Vendors where name = @vendorname)
		BEGIN 
			PRINT 'That Vendor does not exist'
			RETURN -2;
		END
	IF exists (select 1 from Products where PartNbr = @partnbr)
		BEGIN
			PRINT 'That PartNbr is already in use'
			RETURN -3;
		END
	INSERT Products
		(VendorsId, PartNbr, Name, Price, Unit, PhotoPath)
			VALUES(@vendorid, @partnbr, @name, @price, @unit, @photopath)
			if @@ROWCOUNT <> 1
				BEGIN
					PRINT 'ERROR: Insert Failed'
					RETURN -4;
				END;	
			RETURN 0;
END
GO

EXEC AddProduct 'Bethesda','125','Fallout 76', 19.99, '1', null

select * from Products
select * from Vendors