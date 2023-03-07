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
	UserId UNIQUEIDENTIFIER not null,
	SaloonId UNIQUEIDENTIFIER not null,
	FOREIGN KEY (UserId) REFERENCES UserWeb(Id),
	FOREIGN KEY (SaloonId) REFERENCES Saloon(Id)
);

CREATE TABLE SaloonService (
	Id UNIQUEIDENTIFIER PRIMARY KEY not null,
	Name VARCHAR(50) not null,
	Price DECIMAL not null
);
