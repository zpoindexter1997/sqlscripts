CREATE OR ALTER PROCEDURE AddUser
	@username varchar(30) = '',
	@password varchar(30) = '',
	@firstname varchar(30) = '',
	@lastname varchar(30) = '',
	@phone varchar(10) = null,
	@email varchar(30) = null,
	@isreviewer bit = false,
	@isadmin bit = false
AS
BEGIN
	IF @username = '' or @password = '' or @firstname = '' or @lastname = ''
		BEGIN;
			PRINT 'Required Data Is Not Provided';
			RETURN -1;
		END;
		IF exists (SELECT 1 from Users where Username = @username)
		BEGIN
			PRINT 'That Username is already taken, please choose another.';
			RETURN -2;
		END;
			INSERT Users
				(Username, Password, FirstName, LastName, Phone, Email, IsReviewer, IsAdmin)
					VALUES (@username, @password, @firstname, @lastname, @phone, @email, @isreviewer, @isadmin)
			RETURN 0;
END
GO
exec AddUser 'Instructor', 'tothemax', 'Greg', 'Doud', null, null, 0, 0;

select * from Users;

