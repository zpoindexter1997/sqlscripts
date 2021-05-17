CREATE OR ALTER PROCEDURE DeleteUser
@id int = 0

AS
BEGIN
	IF not exists (SELECT 1 from Users where id = @id)
		BEGIN
			PRINT 'User Not Found';
			RETURN -1;
		END;
	DELETE from Users
		where id = @id;
		RETURN 0;
END
GO
exec DeleteUser 5

select * from Users;
