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
	CONSTRAINT "FK_Reservation_Customer_CustomerId" FOREIGN KEY (CustomerId) REFERENCES Customer(Id)
	CONSTRAINT "FK_Reservation_Saloon_SaloonId" FOREIGN KEY (SaloonId) REFERENCES Saloon(Id),
	CONSTRAINT "FK_Reservation_Service_ServiceId" FOREIGN KEY (ServiceId) REFERENCES Service(Id),
);

DECLARE @id UNIQUEIDENTIFIER;
SET @id = NEWID();

INSERT INTO UserWeb VALUES (@id, 'korisnik1','korisnik1@email.com');
INSERT INTO Saloon VALUES (newid(),'frizerski','osijek');
INSERT INTO Customer VALUES (@id, (SELECT Id FROM Saloon WHERE Name = 'frizerski'));