CREATE DATABASE "RecordCompany";

USE "RecordCompany";

CREATE TABLE "Band" (
	"Id" UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	"Name" VARCHAR(50) NOT NULL,
);

CREATE TABLE "Album" (
	"Id" UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	"Name" VARCHAR(50) NOT NULL,
	"ReleaseYear" INT,
	"BandId" UNIQUEIDENTIFIER NOT NULL,
	CONSTRAINT "FK_Albums_Band_BandId" FOREIGN KEY (BandId) REFERENCES Band(Id)
);

CREATE TABLE "Song" (
	"Id" UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	"Name" VARCHAR(100) NOT NULL,
	"LengthMin" FLOAT NOT NULL,
	"AlbumId" UNIQUEIDENTIFIER NOT NULL,
	CONSTRAINT "FK_Song_Album_AlbumId" FOREIGN KEY (AlbumId) REFERENCES Album(Id)
);

INSERT INTO "Band" VALUES 
(newid(), 'Metallica'),
(newid(), 'Iron Maiden'),
(newid(), 'Dream Theater');
