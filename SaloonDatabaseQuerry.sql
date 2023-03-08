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

INSERT INTO Customer VALUES (@id, 'troll','lolololol');
INSERT INTO CustomerProfile VALUES(@id, 'Gerard','Butler','gerard43@aol.com','099-324-122');

INSERT INTO Saloon VALUES 
(newid(), 'frizerski', 'osijek','031-222-333'),
(newid(), 'BarberŠop','veliškovci','031-444-555'),
(newid(), 'BeautySaloonForYou', 'Donji Črnkovci', '050-456-678');

INSERT INTO Service (Id,Name,Price) VALUES 
	(newid(), 'šišanje', 6.5),
	(newid(), 'brijanje', 4),
	(newid(), 'pranje kose', 3),
	(newid(), 'bojanje trepavica', 7);

INSERT INTO Reservation VALUES 
	(newid(), 
	'2023-05-10 15:00:00',
	(SELECT Id FROM Customer WHERE Username = 'korisnik2'),
	(SELECT Id FROM Saloon WHERE Name = 'BarberŠop'),
	(SELECT Id FROM Service WHERE Name = 'šišanje')
	);
	
SELECT * FROM "Reservation";

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
