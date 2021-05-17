CREATE OR ALTER PROCEDURE AddVendor
@code varchar(30) = '',
@name varchar(30) = '',
@address varchar(30) = '',
@city varchar(30) = '',
@state varchar(2) = '',
@zip varchar(5) = '',
@phone varchar(12) = '',
@email varchar(255) = ''

as
begin
	IF @code = '' or @name = '' or @address = '' or @city = '' or @state = '' or @zip = '' or @phone = '' or @email = ''
		BEGIN
			PRINT 'Missing Required Information'
			RETURN -1;
		END
	IF exists (select 1 from Vendors where Code = @code) 
		BEGIN
			PRINT 'Code already exists, please try another Code'
			RETURN -2;
		END
	INSERT Vendors (Code, Name, Address, City, State, Zip, Phone, Email)
		VALUES(@code, @name, @address, @city, @state, @zip, @phone, @email)
		RETURN 0;
END
GO

exec AddVendor 'NTD','Naughty Dog','444 Naughty Drive','San Francisco','CA','98555','5150502020', 'naughtydog@ntd.com'

select * from Vendors



