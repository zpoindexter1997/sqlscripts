-- Delete Genre from Bands, make it a new Table

/*
-- Creating Database RecordLabelDb under Master
use master;

Create Database RecordLabelDb;
*/

/*
-- Creating Table Bands
Create Table Bands (
	Id int primary key identity(1,1),
	BandName varchar(30) not null,
	Size int not null,
	City varchar(30) not null,
	State varchar(30) not null,
	Genre varchar(30) not null,
);
*/

/*
-- Creating Table Albums
Create Table Albums (
	Id int primary key identity(1,1),
	BandsId int not null foreign key references Bands(Id),
	AlbumName varchar(30) not null,
	Sales int not null,
	Date varchar(30) not null,
);

*/

/*
-- Creating Table Songs
Create Table Songs (
	Id int primary key identity(1,1),
	Song varchar(30) not null,
	Plays int not null,
);
*/

/*
--Create Table Genre
CREATE TABLE Genres (
	Id int primary key identity(1,1),
	AlbumsId int not null foreign key references Albums(Id),
	Genre varchar(15) not null UNIQUE
);
*/

/* 
-- Inserting Bands
Insert Bands 
	(BandName, Size, City, State, Genre)
		VALUES
			('Greggae', 1, 'Cincinnati', 'Ohio', 'Classical')
			('ZCDC', 4, 'Charleston', 'West Virginia', 'Heavy Metal'),
			('Charlie''s Angels', 5, 'Cincinnati', 'Ohio', 'Pop'),
			('Jeffrey West', 1, 'Columbus', 'Ohio', 'Hip Hop'),
			('Sarahdellic', 2, 'Tampa', 'Florida', 'Funk'),
			('John Jon and Johnson', 3, 'Tampa', 'Florida', 'Jazz'),
			('The Mattson 2', 2, 'Cincinnati', 'Ohio', 'Pop'),
			('JONAHHHHH', 1, 'Cincinnati','Ohio','Heavy Metal'),
			('Katelyn at the Disco', 3, 'Denver','Colorado','Heavy Metal');
*/

/* 
-- Inserting Albums
Insert Albums
	(BandsId, AlbumName, Sales, Date)
		VALUES
			((select id from bands where BandName like 'Greg%'), 'Develovibes', 9293012, '2-19-1990');

*/

/*
-- Inserting Songs
Insert Songs
	(AlbumsId, Song, Plays)
		VALUES
			((select id from Albums where AlbumName = 'Develovibes'), 'Git Jiggy', 437345),
			((select id from Albums where AlbumName = 'Develovibes'), 'GitHub and Dance', 863453),
			((select id from Albums where AlbumName = 'Develovibes'), 'SQLater', 347575),
			((select id from Albums where AlbumName = 'Develovibes'), 'Looking C#', 574737),
			((select id from Albums where AlbumName = 'Develovibes'), 'Java Mama', 946763);
			
*/

/*
--Inserting Genres
INSERT Genres
	(Genre)
		VALUES
			('Heavy Metal'),
			('Classical'),
			('Pop'),
			('Jazz'),
			('Rap');
*/

/*
-- Update Genres into Albums
UPDATE Albums set
	GenresId = ((select Id from Genres where Genre = 'Classical'))
		where BandsId = (select Id from Bands where BandName like 'Gre%');

UPDATE Albums set
	GenresId = ((select Id from Genres where Genre = 'Heavy Metal'))
		where BandsId = (select Id from Bands where BandName like 'ZC%');

UPDATE Albums set
	GenresId = ((select Id from Genres where Genre = 'Heavy Metal'))
		where BandsId = (select Id from Bands where BandName like 'JONA%');

UPDATE Albums set
	GenresId = ((select Id from Genres where Genre = 'Heavy Metal'))
		where BandsId = (select Id from Bands where BandName like 'Kat%')

UPDATE Albums set
	GenresId = ((select Id from Genres where Genre = 'Jazz'))
		where BandsId = (select Id from Bands where BandName like 'Joh%');

UPDATE Albums set
	GenresId = ((select Id from Genres where Genre = 'Pop'))
		where BandsId = (select Id from Bands where BandName like 'Cha%' or BandName like 'Sar%' or BandName like 'The Ma%');

UPDATE Albums set
	GenresId = ((select Id from Genres where Genre = 'Rap'))
		where BandsId = (select Id from Bands where BandName like 'Jeff%');

*/

/*
--Alter Bands, removing Genre
ALTER TABLE Genres
DROP COLUMN AlbumsId
*/

/*
--Alter Albums, adding Genres
ALTER TABLE Albums
ADD GenresId int foreign key references Genres(Id)
*/

/*
--Alter Date Datatype to datetime format
ALTER TABLE Albums
ALTER COLUMN Date datetime not null 
*/


-- View All Tables
select * from bands b
	left join Albums a
		on b.Id = a.BandsId
	left join Songs s
		on a.Id = s.AlbumsId
	left join Genres g
		on a.GenresId = g.Id

select * from Genres

