CREATE DATABASE "iBei"

CREATE TABLE "User" (
	"Id" UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	"Username" VARCHAR(30) NOT NULL,
	"Password" VARCHAR(30) NOT NULL,
	"Email" VARCHAR(50) NOT NULL,
	"Active" BIT
);

CREATE TABLE "Auction" (
	"Id" UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	"SellerId" UNIQUEIDENTIFIER NOT NULL,
	"Active" BIT,
	"EndTime" DATETIME NOT NULL,
	CONSTRAINT "FK_Auction_User_SellerId" FOREIGN KEY ("SellerId") REFERENCES "User"(Id)
);

CREATE TABLE "Bid" (
	"Id" UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	"UserId" UNIQUEIDENTIFIER NOT NULL,
	"AuctionId" UNIQUEIDENTIFIER NOT NULL,
	"BidPrice" DECIMAL(18,2) NOT NULL,
	"BidTime" DATETIME NOT NULL,
	CONSTRAINT "FK_Bid_User_UserId" FOREIGN KEY ("UserId") REFERENCES "User"("Id"),
	CONSTRAINT "FK_Bid_Auction_AuctionId" FOREIGN KEY ("AuctionId") REFERENCES "Auction"("Id")
);

DROP TABLE "Bid";

CREATE TABLE "Item" (
	"Id" UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	"CategoryId" UNIQUEIDENTIFIER NOT NULL,
	"Name" VARCHAR(50) NOT NULL,
	"Description" TEXT NOT NULL,
	CONSTRAINT "FK_Item_Auction_Id" FOREIGN KEY ("Id") REFERENCES "Auction"("Id")
);

CREATE TABLE "Section" (
	"Id" UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	"Name" VARCHAR(30) NOT NULL
);

CREATE TABLE "Category" (
	"Id" UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	"SectionId" UNIQUEIDENTIFIER NOT NULL,
	"Name" VARCHAR(30) NOT NULL
	CONSTRAINT "FK_Category_Section_SectionId" FOREIGN KEY ("SectionId") REFERENCES "Section"("Id")
);

INSERT INTO "Section" VALUES
(NEWID(), 'Računala'),
(NEWID(), 'Komponente'),
(NEWID(), 'Mobiteli');

INSERT INTO "Category" ("Id","SectionId","Name") VALUES
(NEWID(), (SELECT "Id" FROM "Section" WHERE "Name" = 'Komponente'), 'Monitori'),
(NEWID(), (SELECT "Id" FROM "Section" WHERE "Name" = 'Komponente'), 'Procesori'),
(NEWID(), (SELECT "Id" FROM "Section" WHERE "Name" = 'Komponente'), 'SSD'),
(NEWID(), (SELECT "Id" FROM "Section" WHERE "Name" = 'Komponente'), 'Grafičke kartice'),
(NEWID(), (SELECT "Id" FROM "Section" WHERE "Name" = 'Mobiteli'), 'Stakla'),
(NEWID(), (SELECT "Id" FROM "Section" WHERE "Name" = 'Mobiteli'), 'Kućišta');


declare @brankoId UNIQUEIDENTIFIER SET @brankoId = NEWID();
declare @stanislavId UNIQUEIDENTIFIER SET @stanislavId = NEWID();
declare @juraId UNIQUEIDENTIFIER SET @juraId = NEWID();
declare @maraId UNIQUEIDENTIFIER SET @maraId = NEWID();

INSERT INTO "User" ("Id","Username","Password","Email","Active") VALUES 
(@brankoId, 'branko','k4u56','branko@branko.com',0),
(@stanislavId, 'stanislav','s8d7t','stanislav@stanislav.com',1),
(@juraId, 'jura','jk456g','jura@jura.com',1),
(@maraId, 'mara','cv87t','mara@mara.com',1);


declare @auction1 UNIQUEIDENTIFIER SET @auction1 = NEWID();
INSERT INTO "Auction" VALUES 
(@auction1, @stanislavId, 1, '2023-04-10 20:30:00');
INSERT INTO "Item" VALUES
(@auction1, (SELECT "Id" FROM "Category" WHERE "Name" = 'SSD'),'Samsung 250 GB','Kao novi samo jednom isproban');

declare @auction2 UNIQUEIDENTIFIER SET @auction2 = NEWID();
INSERT INTO "Auction" VALUES 
(@auction2, @juraId, 1, '2023-05-11 20:30:00');
INSERT INTO "Item" VALUES
(@auction2, (SELECT "Id" FROM "Category" WHERE "Name" = 'Stakla'),'Staklo za iphone 22','NOVO s računom!');

declare @auction3 UNIQUEIDENTIFIER SET @auction3 = NEWID();
INSERT INTO "Auction" VALUES 
(@auction3, @juraId, 1, '2023-06-11 20:00:00');
INSERT INTO "Item" VALUES
(@auction3, (SELECT "Id" FROM "Category" WHERE "Name" = 'Kućišta'),'Futrola za iphone SE','Kožna futrola, roza boje s cvjetićima');

INSERT INTO "Bid" VALUES 
(NEWID(),@maraId, @auction3, 34.55, '2023-03-10 20:30:00'),
(NEWID(),@juraId, @auction3, 44.55, '2023-03-10 20:31:00'),
(NEWID(),@maraId, @auction3, 70, '2023-03-10 20:40:00');

INSERT INTO "Bid" VALUES 
(NEWID(),@stanislavId, @auction1, 20, '2023-03-09 15:30:00'),
(NEWID(),@juraId, @auction1, 20.01, '2023-03-09 15:40:00');


INSERT INTO "Bid" VALUES 
(NEWID(),@maraId, @auction1, 25, '2023-03-10 08:08:00'),
(NEWID(),@juraId, @auction1, 25.01, '2023-03-10 09:09:00');


------- let's see the data

-- sve aukcije
GO
CREATE OR ALTER VIEW "SveAukcije" AS
	SELECT i."Name", u."Username", b."BidPrice" FROM "Bid" b
	JOIN "Auction" a ON b."AuctionId" = a."Id"
	JOIN "User" u ON b."UserId" = u."Id"
	JOIN "Item" i ON a."Id" = i."Id"
GO

SELECT * FROM "SveAukcije"


-- trenutne aukcije
SELECT Name, MAX(BidPrice) FROM "SveAukcije"
	GROUP BY Name

	
SELECT c."Name", i."Name", u."Username", b."BidPrice" FROM "Bid" b
	JOIN "Auction" a ON b."AuctionId" = a."Id"
	JOIN "User" u ON b."UserId" = u."Id"
	JOIN "Item" i ON a."Id" = i."Id"
	JOIN "Category" c ON c."Id" = i."CategoryId"

