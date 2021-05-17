CREATE OR ALTER PROCEDURE DeleteVendor
@id int = 0

AS
BEGIN
	IF @id = 0
		BEGIN
			PRINT 'Must Provide Vendor Id'
			RETURN -1;
		END
	IF not exists (select 1 from Vendors where Id = @id)
		BEGIN
			PRINT 'Vendor does not exist'
			RETURN -2;
		END
	DELETE from Vendors
		where Id = @id;
END
GO

EXEC DeleteVendor 6

select * from Vendors