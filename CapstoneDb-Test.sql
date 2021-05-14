--3 users (one being rvw/adm, one being rvr, one nothing)
--5 Vendors
--10 Products
--1 Request

use master;
DROP DATABASE if exists PRS;
CREATE DATABASE PRS;
USE PRS;

CREATE TABLE Users (
	Id int primary key identity(1,1),
	Username varchar(30) not null UNIQUE,
	Password varchar(30) not null,
	FirstName varchar(30) not null,
	LastName varchar(30) not null,
	Phone varchar(12) not null,
	Email varchar(255) not null,
	IsReviewer bit not null, 
	IsAdmin bit not null
);


CREATE TABLE Vendors (
	Id int primary key identity(1,1),
	Code varchar(30) not null UNIQUE,
	Name varchar(30) not null,
	Address varchar(30) not null,
	City varchar(30) not null,
	State varchar(2) not null,
	Zip varchar(5) not null,
	Phone varchar(12) not null,
	Email varchar(255) not null,
);


CREATE TABLE Products (
	Id int primary key identity(1,1),
	PartNbr varchar(30) not null UNIQUE,
	Name varchar(30) not null,
	Price decimal(11,2) not null,
	Unit varchar(30) not null,
	PhotoPath varchar(255),
	VendorsId int not null foreign key references Vendors(Id),
);


CREATE TABLE Requests (
	Id int primary key identity(1,1),
	Description varchar(80) not null,
	Justification varchar(80) not null,
	RejectionReason varchar(80),
	DeliveryMode varchar(20) not null DEFAULT('Pickup'),
	Status varchar(10) not null DEFAULT ('NEW'),
	Total decimal(11,2) not null DEFAULT(0),
	UsersId int not null foreign key references Users(Id),
);


CREATE TABLE RequestLines (
	Id int primary key identity(1,1),
	RequestsId int not null foreign key references Requests(Id),
	ProductsId int not null foreign key references Products(Id),
	Quantity int not null DEFAULT(1)
);


INSERT Users
	(Username, Password, FirstName, LastName, Phone, Email, IsReviewer, IsAdmin)
		VALUES 	
			('MRZ','ipitythefool','Zha''Quon','Poindexter','3049328835','zpoindexter@tql.com',1,1),
			('TQL', 'developers', 'Total', 'Quality', '5138312600', 'tql@tql.com', 1, 0),
			('AB', 'Alisters', 'Ace','Baller','5133155135','somebody@tql.com', 0, 0);

INSERT Vendors
	(Code, Name, Address, City, State, Zip, Phone, Email)
		VALUES
			('BET','Bethesda','123 Bethesda Ave.', 'Cincinnati','OH','45211','5135349292','bethesda@bet.com'),
			('UBI','Ubisoft','9 Ubisoft Lane','Cleveland','OH','42123','5139295510','ubisoft@ubi.com'),
			('ACT','Activision','11 Activision Way','Columbus','OH','46612','5138285931','activision@act.com'),
			('IFW','Infinity Ward','62 Infinity Drive','Charlotte','NC','36311','8283020811','infinity@ifw.com'),
			('BUN','Bungie','77 Halo Ave','San Francisco','CA','92840','9449201134','bungie@bun.com');

INSERT Products
	(PartNbr, Name, Price, Unit, VendorsId)
		VALUES 
			('121','Skyrim',59.99, 1, (select id from Vendors where code = 'BET')),
			('122','Oblivion',179.99, 1, (select id from Vendors where code = 'BET')),
			('123','Fallout 3',159.99, 1, (select id from Vendors where code = 'BET')),
			('221','Watch Dogs',5.99, 1, (select id from Vendors where code = 'UBI')),
			('222','Far Cry',59.99, 1, (select id from Vendors where code = 'UBI')),
			('223','Ghost Recon',8.99, 1, (select id from Vendors where code = 'UBI')),
			('321','Spyro',9.99, 1, (select id from Vendors where code = 'ACT')),
			('421','Call of Duty: BO',99.99, 1, (select id from Vendors where code = 'IFW')),
			('422','Call of Duty: MW2',89.99, 1, (select id from Vendors where code = 'IFW')),
			('521','Halo 3',199.99, 1, (select id from Vendors where code = 'UBI'));

INSERT Requests
	(Description, Justification, UsersId)
		VALUES 
			('Birthday gift','Treat yo self', (select Id from Users where FirstName like 'Zha%'));


select * from Users u
	left join Requests r
		on u.Id = r.UsersId
	left join RequestLines rl
		on r.Id = rl.RequestsId
	left join Products p
		on p.Id = rl.ProductsId
	left join Vendors v
		on v.Id = p.VendorsId;
	
select * from Products