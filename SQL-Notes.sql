USE master;		--Using Master Database

CREATE DATABASE BootCampDb; --Creating new Database named BootCampDb

-- Create Students Table
use BootCampDb;			--Using BootCampDb Database
CREATE TABLE Students (		--Create a table named Students
	Id int primary key identity(1,1), --ColumnName, DateType (Integer), Determined as PK, starting (at 1, increments of 1)
	FirstName nvarchar(30) not null, --ColumnName, DataType (n= enable Symbolic Characters like Chinese)(Variable)(Character)(30 Character Limit), cannot be null
	LastName varchar(30) not null, --ColumnName, DataType, not allowed to be null
	Address varchar(50) not null, --ColumnName, DataType, not allowed to be null
	City varchar(50) not null, --ColumnName, DataType, not allowed to be null
	State char(2) not null, --ColumnName, DataType (char(2) = has to have 2 characters), not allowed to be null
	Zip varchar(10) not null, --ColumnName, DataType, not allowed to be null
	AssessmentScore int not null --ColumnName, DataType, not allowed to be null
);

-- Create Assessments Table
use BootCampDb;			--Using BootCampDb Database
CREATE TABLE Assessments (		--Create a table named Assessments
	Id int primary key identity(1,1),  --ColumnName, DateType (Integer), Determined as PK, starting (at 1, increments of 1)
	StudentId int not null foreign key references Students(Id), --ColumnName, DataType, not null, Determined as FK, refers to (TableName(PK Column) 
	Topic varchar(30) not null, --ColumnName, DataType, not null
	Score int not null, --ColumnName, DataType, not null
);

-- Create Customers Table
use BootCampDb;			--Using BootCampDb Database
CREATE TABLE Customers (			--Create a table named Customers
	Id int primary key identity(1,1), --ColumnName, DateType (Integer), Determined as PK, starting (at 1, increments of 1)
	Code varchar(10) not null UNIQUE, --ColumnName, DataType, not null, Must be Unique from any other row
	Name varchar(30) not null, --ColumnName, DataType, not null
	Sales decimal(9,2) not null check (Sales >= 0), --ColumnName, DataType (Decimal, 9 digits with 2 after decimal), cannot be null, cannot be less than 0
	Active bit not null DEFAULT(1), --ColumnName, DataType (must be 0 or 1), not null, Default value is 1
	Created datetime not null DEFAULT(getdate()) --ColumnName, DataType (Date & Time), cannot be null, Default value is(get the date/time it was entered automatically
);

-- Insert myself as a student
INSERT Students		--Insert this data into Students table
	(FirstName, LastName, Address, City, State, Zip, AssessmentScore) --(ColumnName1, ColumnName2...)
		VALUES('Zha''Quon', 'Poindexter', '2101 Lincoln Avenue', 'Saint Albans', 'WV', '25177',82); --What I want to enter into (ColumnName1, ColumnName2...)

-- Insert my Assessment score
INSERT Assessments --Insert this data into Assessments table
	(StudentId, Topic, Score) --(ColumnName1, ColumnName2...)
		VALUES((select Id from Students where FirstName = 'Zha''Quon'), 'Git and Github', 110); --What I want to enter into (ColumnName1, ColumnName2...)

--Insert Customers info
INSERT Customers
	(Code, Name, Sales)
		VALUES
			('WM','Walmart',377554.64),
			('OM','Oscar Meyer', 26243.36),
			('GS','GameStop', 23525.49)

INSERT Customers
	(Code, Name, Sales, Active)
		VALUES
			('WG', 'WasteManagement', 25213.45, 0)

--Updating Students
UPDATE Students set --Updating TableName set
	AssessmentScore = 85		--ColumnName = NewValue
		where Firstname = 'Zha''Quon'; --Only where (Boolean)

--Deleting Students
delete from Students --Deleting from TableName
	where FirstName = 'Zha''Quon'; --Where ColumnName (Boolean)


--ALTER Adding to Customers table
ALTER TABLE Customers --Alter -> Table -> TableName
	Add Updated datetime; --Adding column ColumnName, DataType

--ALTER Altering Customers table
ALTER TABLE Customers --Alter -> Table -> TableName
	Alter Column Name varchar(50) not null; --Altering the Column ColumnName, DataType, not null

--ALTER Dropping Updated Column from Customers Table
ALTER TABLE Customers --Alter -> Table -> TableName
	DROP COLUMN Updated; --Delete Column ColumnName

--Declaring Variables for Parameters
DECLARE @MinScore int; --Creating a Variable @(VariableName), Datatype
DECLARE @MaxScore int = 100; --Creating a Variable @(VariableName), Datatype, = Preset NewValue
SET @MinScore = 50; --Setting the Variable @(VariableName) = NewValue

--Converting one DataType into Another 
DECLARE @abc int; --Creating a Variable @(VariableName)
Set @abc = convert(int, '123'); -- Selecting @(VariableName), = Converting(NewDataType(int), OldDataType(string))


--Viewing Students from Parameters Declared
select * from Students
	where AssessmentScore >= @MinScore and AssessmentScore <= @MaxScore --Where ColumnName is >= Variable @(VariableName) and ColumnName is <= Variable @(VariableName) 


























/* 
SQL NOTES
KEY (Line - Concept - Page)
01 - Using Database
05 - Create Table
38 - Insert Data
61 - Updating Data
66 - Deleting Data
71 - Altering/Adding to Table
75 - Altering/Altering Tables
79 - Altering/Dropping Tables
83 - Declaring Variables for Parameters
88 - Converting DataTypes - SQL Pg. 40
93 - Viewing Data from Parameters Declared
*/