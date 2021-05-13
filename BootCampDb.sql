USE master;

CREATE DATABASE BootCampDb;

-- Create Students Table
use BootCampDb;
CREATE TABLE Students (
	Id int primary key identity(1,1), /* ColumnName, DateType (Integer), Determined as PK, starting (at 1, increments of 1)*/
	FirstName nvarchar(30) not null, /* ColumnName, DataType (n= enable Symbolic Characters like Chinese)(Variable)(Character)(30 Character Limit), cannot be null*/
	LastName varchar(30) not null, /* ColumnName, DataType, not allowed to be null*/
	Address varchar(50) not null, /*ColumnName, DataType, not allowed to be null*/
	City varchar(50) not null, /*ColumnName, DataType, not allowed to be null*/
	State char(2) not null, /*ColumnName, DataType (char(2) = has to have 2 characters), not allowed to be null*/
	Zip varchar(10) not null, /*ColumnName, DataType, not allowed to be null*/
	AssessmentScore int not null /*ColumnName, DataType, not allowed to be null*/
);
-- Create Assessments Table
use BootCampDb;
CREATE TABLE Assessments (
	Id int primary key identity(1,1),
	StudentId int not null foreign key references Students(Id), /* ColumnName, DataType, Determined as FK, refers to (TableName(PK Column) */
	Topic varchar(30) not null,
	Score int not null,
);



-- Insert myself as a student
INSERT Students
	(FirstName, LastName, Address, City, State, Zip, AssessmentScore)
		VALUES('Zha''Quon', 'Poindexter', '2101 Lincoln Avenue', 'Saint Albans', 'WV', '25177',82);
-- Insert my Assessment score
INSERT Assessments
	(StudentId, Topic, Score)
		VALUES((select Id from Students where FirstName = 'Zha''Quon'), 'Git and Github', 110);
		
SELECT * from Students s
	join Assessments a
		on s.Id = a.StudentId;