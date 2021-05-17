CREATE OR ALTER PROCEDURE UpdateVendor
@id int = 0,
@code varchar(30) = '',
@name varchar(30) = '',
@address varchar(30) = '',
@city varchar(30) = '',
@state varchar(2) = '',
@zip varchar(5) = '',
@phone varchar(12) = '',
@email varchar(255) = ''
AS
BEGIN
	IF @id = 0
		BEGIN
			PRINT 'Missing Required Vendor Id'
			RETURN -1;
		END
	IF not exists (select 1 from Vendors where Id = @id)
		BEGIN 
			PRINT 'That Vendor does not exist'
			RETURN -2;
		END
	UPDATE Vendors set
		Code = @code,
		Name = @name,
		Address = @address,
		City = @city,
		State = @state,
		Zip = @zip,
		Phone = @phone,
		Email = @email
			WHERE Id = @id
		RETURN 0;
END
GO

EXEC UpdateVendor 6, 'ND', 'Naughty Dog', '444 Naughty Drive', 'San Francisco','CA','95010','5919293042','naughtydog@nd.com'


select * from Vendors