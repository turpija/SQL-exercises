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
	'2023-05-05 17:45:00',
	(SELECT Id FROM Customer WHERE Username = 'poweruser'),
	(SELECT Id FROM Saloon WHERE Name = 'BeautySaloonForYou'),
	(SELECT Id FROM Service WHERE Name = 'pranje kose')
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
SELECT COUNT("Appointment") AS "Number of Reservations" FROM "Reservation";

SELECT COUNT("Appointment") AS "Number of Reservations at BeautySaloonForYou" FROM "Reservation"
	WHERE SaloonId = (SELECT "Id" FROM "Saloon" WHERE "Name" = 'BeautySaloonForYou');
