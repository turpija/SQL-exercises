CREATE TABLE UserWeb (
	Id UNIQUEIDENTIFIER PRIMARY KEY not null,
	Username VARCHAR(30) not null,
	Email VARCHAR(60) not null
);

CREATE TABLE Saloon (
	Id UNIQUEIDENTIFIER PRIMARY KEY not null,
	Name VARCHAR(50) not null,
	Location VARCHAR(89) not null
);

CREATE TABLE Customer (
	Id UNIQUEIDENTIFIER PRIMARY KEY not null,
	SaloonId UNIQUEIDENTIFIER not null,
	CONSTRAINT "FK_Customer_UserWeb_UserId" FOREIGN KEY (Id) REFERENCES UserWeb(Id),
	CONSTRAINT "FK_Customer_Saloon_SaloonId" FOREIGN KEY (SaloonId) REFERENCES Saloon(Id)
);

CREATE TABLE Service (
	Id UNIQUEIDENTIFIER PRIMARY KEY not null,
	Name VARCHAR(50) not null,
	Price DECIMAL not null
);

CREATE TABLE SaloonService (
	Id UNIQUEIDENTIFIER PRIMARY KEY not null,
	SaloonId UNIQUEIDENTIFIER not null,
	ServiceId UNIQUEIDENTIFIER not null,
	CONSTRAINT "FK_SaloonService_Saloon_SaloonId" FOREIGN KEY (SaloonId) REFERENCES Saloon(Id),
	CONSTRAINT "FK_SaloonService_Service_ServiceId" FOREIGN KEY (ServiceId) REFERENCES Service(Id)
);

DECLARE @id UNIQUEIDENTIFIER;
SET @id = NEWID();

INSERT INTO UserWeb VALUES (@id, 'korisnik1','korisnik1@email.com');
INSERT INTO Saloon VALUES (newid(),'frizerski','osijek');
INSERT INTO Customer VALUES (@id, (SELECT Id FROM Saloon WHERE Name = 'frizerski'));