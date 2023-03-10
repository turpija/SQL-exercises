CREATE TABLE Person (
	Id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	DisplayName VARCHAR(30) NOT NULL,
	Username VARCHAR(30) NOT NULL,
	Password VARCHAR(30) NOT NULL,
	Email VARCHAR(50) NOT NULL
);

CREATE TABLE Category (
	Id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	Name VARCHAR (50) NOT NULL
);

CREATE TABLE Expense (
	"Id" UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	"PersonId" UNIQUEIDENTIFIER NOT NULL,
	"CategoryId" UNIQUEIDENTIFIER NOT NULL,
	"Name" VARCHAR(30) NOT NULL,
	"Date" DATE NOT NULL,
	"Description" VARCHAR(100),
	"Cost" DECIMAL(12,2) NOT NULL,
	CONSTRAINT "FK_Expense_Person_PersonId" FOREIGN KEY (PersonId) REFERENCES Person(Id),
	CONSTRAINT "FK_Expense_Category_CategoryId" FOREIGN KEY (CategoryId) REFERENCES Category(Id)
);

DROP TABLE Expense

--insert into

INSERT INTO Person VALUES (NEWID(), 'Ivan', 'ivan','123','ivan@ivan.com');
INSERT INTO Person VALUES (NEWID(), 'Katarina', 'katarina','123','katar@rina.com');

INSERT INTO Category VALUES 
(NEWID(), 'Hrana'),
(NEWID(), 'Auto'),
(NEWID(), 'Kuća'),
(NEWID(), 'Kredit'),
(NEWID(), 'Potrebno'),
(NEWID(), 'Luksuz'),
(NEWID(), 'Režije'),
(NEWID(), 'Benčine');

DECLARE @IvanId VARCHAR(50) = (SELECT Id FROM Person WHERE "Username" = 'ivan');
DECLARE @KatarinaId VARCHAR(50) = (SELECT Id FROM Person WHERE "Username" = 'katarina');
DECLARE @HranaId VARCHAR(50) = (SELECT Id FROM Category WHERE "Name"= 'Hrana');
DECLARE @LuksuzId VARCHAR(50) = (SELECT Id FROM Category WHERE "Name"= 'Luksuz');

INSERT INTO Expense (Id, PersonId, CategoryId, Name, Date,Cost) VALUES 
(NEWID(), @IvanId, @HranaId, 'Konzum','2023-03-10', 31.50),
(NEWID(), @IvanId, @HranaId, 'Lidl','2023-03-15', 7.23),
(NEWID(), @IvanId, @HranaId, 'Konzum','2023-03-21', 13.50),
(NEWID(), @KatarinaId, @HranaId, 'Spar','2023-03-09', 22),
(NEWID(), @IvanId, @LuksuzId, 'Sladoled','2023-03-10', 6),
(NEWID(), @KatarinaId, @LuksuzId, 'Pekara','2023-03-28', 12.10);

INSERT INTO Expense (Id, PersonId, CategoryId, Name, Date,Cost) VALUES 
(NEWID(), @IvanId, @HranaId, 'Konzum','2023-02-12', 43.50),
(NEWID(), @IvanId, @HranaId, 'Lidl','2023-02-14', 17.23),
(NEWID(), @IvanId, @HranaId, 'Konzum','2023-02-20', 3.50),
(NEWID(), @KatarinaId, @HranaId, 'Spar','2023-02-13', 20.28),
(NEWID(), @IvanId, @LuksuzId, 'Sladoled','2023-02-15', 5),
(NEWID(), @KatarinaId, @LuksuzId, 'Pekara','2023-02-18', 2.10);

GO
CREATE OR ALTER FUNCTION ShowCategory (@category VARCHAR(30), @DateStart DATE, @dateEnd DATE)
RETURNS TABLE 
AS RETURN
SELECT Category.Name AS "Category", Person.Username, Expense.Name AS "ExpenseName", Date,Cost FROM Expense
	JOIN Person ON Expense.PersonId = Person.Id
	JOIN Category ON Expense.CategoryId = Category.Id
	WHERE Category.Name = @category AND Expense.Date BETWEEN @DateStart AND @DateEnd;
GO

SELECT * FROM dbo.ShowCategory('Hrana','2023-02-01','2023-03-01');
SELECT * FROM dbo.ShowCategory('Luksuz','2023-03-01','2023-04-01');