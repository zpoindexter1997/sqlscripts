CREATE OR ALTER PROCEDURE UpdateUser
	@id int = 0,
	@username varchar(30) = '',
	@password varchar(30) = '',
	@firstname varchar(30) = '',
	@lastname varchar(30) = '',
	@phone varchar(10),
	@email varchar(30),
	@isreviewer bit,
	@isadmin bit
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
	IF not exists (SELECT 1 from Users where Id = @id)
		BEGIN
			PRINT 'That User does not exist, please try again.';
			RETURN -3;
		END;
	UPDATE Users set
		Username = @username,
		Password = @password,
		FirstName = @firstname,
		LastName = @lastname, 
		Phone = @phone,
		Email = @email,
		IsReviewer = @isreviewer,
		IsAdmin = @isadmin
			where Id = @id;
		PRINT 'Successfully Updated!'
	RETURN 0;
END
GO
exec UpdateUser 5, 'Greg', 'tothemax','Greg','Doud', null, null, 0, 0

select * from Users;