USE master;		

CREATE DATABASE BootCampDb;


use BootCampDb;			
CREATE TABLE Students (	
	Id int primary key identity(1,1),
	FirstName nvarchar(30) not null,
	LastName varchar(30) not null,
	Address varchar(50) not null,
	City varchar(50) not null,
	State char(2) not null,
	Zip varchar(10) not null, 
	AssessmentScore int not null 
);


use BootCampDb; 
CREATE TABLE Assessments (
	Id int primary key identity(1,1),
	StudentId int not null foreign key references Students(Id),
	Topic varchar(30) not null,
	Score int not null, 
);


use BootCampDb;			
CREATE TABLE Customers (
	Id int primary key identity(1,1),
	Code varchar(10) not null UNIQUE,
	Name varchar(30) not null, 
	Sales decimal(9,2) not null check (Sales >= 0),
	Active bit not null DEFAULT(1),
	Created datetime not null DEFAULT(getdate()) 
);


INSERT Students		
	(FirstName, LastName, Address, City, State, Zip, AssessmentScore) 
		VALUES('Zha''Quon', 'Poindexter', '2101 Lincoln Avenue', 'Saint Albans', 'WV', '25177',82); 


INSERT Assessments 
	(StudentId, Topic, Score) 
		VALUES((select Id from Students where FirstName = 'Zha''Quon'), 'Git and Github', 110);

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

UPDATE Students set 
	AssessmentScore = 85		
		where Firstname = 'Zha''Quon'; 


delete from Students 
	where FirstName = 'Zha''Quon'; 

select * from Students
	where AssessmentScore >= @MinScore and AssessmentScore <= @MaxScore 