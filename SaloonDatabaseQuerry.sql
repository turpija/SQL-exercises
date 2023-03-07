CREATE TABLE Users (
	id UNIQUEIDENTIFIER PRIMARY KEY not null,
	username VARCHAR(30) not null,
	email VARCHAR(60) not null
);

CREATE TABLE Saloon (
	id UNIQUEIDENTIFIER PRIMARY KEY not null,
	name VARCHAR(50) not null,
	location VARCHAR(89) not null
);

CREATE TABLE Customers (
	id UNIQUEIDENTIFIER PRIMARY KEY not null,
	userId UNIQUEIDENTIFIER not null,
	saloonId UNIQUEIDENTIFIER not null,
	FOREIGN KEY (userId) REFERENCES Users(id),
	FOREIGN KEY (saloonId) REFERENCES Saloon(id)
);

CREATE TABLE SaloonServices (
	id UNIQUEIDENTIFIER PRIMARY KEY not null,
	name VARCHAR(50) not null,
	price DECIMAL not null
);
