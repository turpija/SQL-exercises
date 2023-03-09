CREATE DATABASE Saloon;

CREATE TABLE Customer (
	Id UNIQUEIDENTIFIER PRIMARY KEY not null,
	Username VARCHAR(30) not null,
	Password VARCHAR(60) not null
);

CREATE TABLE Saloon (
	Id UNIQUEIDENTIFIER PRIMARY KEY not null,
	Name VARCHAR(50) not null,
	Location VARCHAR(89) not null,
	Tel VARCHAR(15) not null
);

CREATE TABLE CustomerProfile (
	Id UNIQUEIDENTIFIER PRIMARY KEY not null,
	FirstName VARCHAR(50) not null,
	LastName VARCHAR(50) not null,
	Email VARCHAR(40) not null,
	Tel VARCHAR(15) not null,
	CONSTRAINT "FK_CustomerProfile_Customer_Id" FOREIGN KEY (Id) REFERENCES Customer(Id),
);

CREATE TABLE Service (
	Id UNIQUEIDENTIFIER PRIMARY KEY not null,
	Name VARCHAR(50) not null,
	Description VARCHAR(200),
	Price DECIMAL not null
);

CREATE TABLE Reservation (
	Id UNIQUEIDENTIFIER PRIMARY KEY not null,
	Appointment DATETIME not null,
	CustomerId UNIQUEIDENTIFIER not null,
	SaloonId UNIQUEIDENTIFIER not null,
	ServiceId UNIQUEIDENTIFIER not null,
	CONSTRAINT "FK_Reservation_Customer_CustomerId" FOREIGN KEY (CustomerId) REFERENCES Customer(Id),
	CONSTRAINT "FK_Reservation_Saloon_SaloonId" FOREIGN KEY (SaloonId) REFERENCES Saloon(Id),
	CONSTRAINT "FK_Reservation_Service_ServiceId" FOREIGN KEY (ServiceId) REFERENCES Service(Id),
);

DECLARE @id UNIQUEIDENTIFIER;
SET @id = NEWID();

INSERT INTO Customer VALUES (@id, 'beskorisnik','x6c7rd');
INSERT INTO CustomerProfile VALUES(@id, 'John','Doe','john@doe.me','099-555-2387');

INSERT INTO Saloon VALUES 
(newid(), 'frizerski', 'osijek','031-222-333'),
(newid(), 'BarberŠop','veliškovci','031-444-555'),
(newid(), 'BeautySaloonForYou', 'Donji Črnkovci', '050-456-678');

INSERT INTO Service (Id,Name,Price) VALUES 
	(newid(), 'šišanje', 6.5),
	(newid(), 'brijanje', 4),
	(newid(), 'pranje kose', 3),
	(newid(), 'bojanje trepavica', 7);


ALTER TABLE Service
	ALTER COLUMN Price decimal(4,2)

UPDATE Service
	SET Price = 4.5
	WHERE Name = 'brijanje';

INSERT INTO Reservation VALUES 
	(newid(), 
	'2023-05-11 20:30:00',
	(SELECT Id FROM Customer WHERE Username = 'beskorisnik'),
	(SELECT Id FROM Saloon WHERE Name = 'BeautySaloonForYou'),
	(SELECT Id FROM Service WHERE Name = 'pranje kose')
	);
	
SELECT Price FROM Service;

SELECT * FROM "Reservation"
	WHERE "SaloonId" = (SELECT "Id" FROM "Saloon" WHERE "Name" = 'BeautySaloonForYou');

-- get all reservations with details
SELECT Reservation.Appointment, Saloon.Name AS "Saloon Name", Customer.Username AS "Customer Username"
	FROM Reservation
	JOIN Saloon ON Reservation.SaloonId = Saloon.Id 
	JOIN Customer ON Reservation.CustomerId = Customer.Id;

-- get number of reservations
SELECT COUNT("Appointment") AS "Number of appointments" 
	FROM "Reservation";

-- get number of appointments for saloon...
SELECT COUNT("Appointment") AS "Number of appointments at BeautySaloonForYou" 
	FROM "Reservation"
	WHERE SaloonId = (SELECT "Id" FROM "Saloon" WHERE "Name" = 'BeautySaloonForYou');

-- get total amount of price from reservation
SELECT SUM("Price") AS "Sum Price of all services Reserved" 
	FROM "Reservation" r
	JOIN "Service" s 
	ON r."ServiceId" = s."Id";

-- get number of appointments per saloon
SELECT s."Name" AS "saloon name", COUNT(s."Name") AS "number of apointments" 
	FROM "Reservation" r
	JOIN "Saloon" s
	ON r."SaloonId" = s."Id"
	GROUP BY s."Name";

-- list all customers and reservations they may have, order by saloon name
SELECT s."Name" AS "Saloon name",
	c."userName" AS "customer username", 
	cp."FirstName" AS "customer FirstName", 
	srv."Name" AS "service"
	FROM "Reservation" r
	JOIN "Customer" c ON r."CustomerId" = c."Id"
	JOIN "CustomerProfile" cp ON c."Id" = cp."Id"
	JOIN "Saloon" s ON r."SaloonId" = s."Id"
	JOIN "Service" srv ON r."ServiceId" = srv."Id"
	ORDER BY s."Name";

-- VIEW sum of services per saloon
GO
CREATE OR ALTER VIEW "SaloonIncomes" AS 
	SELECT s."Name" AS "Saloon", 
		COUNT(sr."Id") AS "Number of appointments", 
		SUM(sr."Price") AS "Total Income from appointments" FROM "Reservation" r
	JOIN "Service" sr ON r."ServiceId" = sr.Id
	JOIN "Saloon" s ON r."SaloonId" = s.Id
	GROUP BY s.Name

-- create function tombola
GO
CREATE OR ALTER FUNCTION "Tombola" (@num int, @rand float)
returns int
AS
BEGIN
return CEILING((@num * @rand))
END;

GO

-- use function tombola
DECLARE @customers INT
SET @customers = (SELECT COUNT(Customer.Username) FROM "Customer");

SELECT dbo.Tombola(@customers,rand())
