CREATE DATABASE "Trgovina";

USE "Trgovina"

CREATE TABLE "Osoba" (
	"Id" INT NOT NULL PRIMARY KEY,
	"OIB" CHAR(11) NOT NULL,
	"Ime" NVARCHAR(30),
	"Mobitel" VARCHAR(10),
	"Email" VARCHAR(50),
	"MjestoStanovanja" VARCHAR(50)
);

ALTER TABLE "Osoba" 
	ADD "StrucnaSprema" VARCHAR(50);

ALTER TABLE "Osoba"
	ADD "Prezime" NVARCHAR(40);

ALTER TABLE "Osoba"
	ALTER COLUMN "Ime" NVARCHAR(42)

ALTER TABLE "Osoba"
	ALTER COLUMN "Prezime" NVARCHAR(42);

CREATE TABLE "Artikl" (
	"Id" INT NOT NULL PRIMARY KEY,
	"Artikl" VARCHAR(50) NOT NULL,
	"MjernaJedinca" VARCHAR(10) NOT NULL,
	"Cijena" FLOAT NOT NULL,
	"PDV" FLOAT NOT NULL
);

CREATE TABLE "Narudzba" (
	"Id" INT NOT NULL PRIMARY KEY,
	"Broj" VARCHAR(30) NOT NULL,
	"Datum" DATETIME NOT NULL,
	"NaruciteljId" INT NOT NULL,
	"ProdavacId" INT NOT NULL 
	CONSTRAINT "FK_Narudzba_Osoba_NaruciteljId" FOREIGN KEY ("NaruciteljId") REFERENCES "Osoba"("Id"),
	CONSTRAINT "FK_Narudzba_Osoba_ProdavacId" FOREIGN KEY ("ProdavacId") REFERENCES "Osoba"("Id")
);

CREATE TABLE "NarudzbaArtikl" (
	"Id" INT NOT NULL PRIMARY KEY,
	"NarudzbaId" INT NOT NULL,
	"ArtiklId" INT NOT NULL,
	"Kolicina" FLOAT NOT NULL
	CONSTRAINT "FK_NarudzbaArtikl_Narudzba_NarudzbaId" FOREIGN KEY ("NarudzbaId") REFERENCES "Narudzba"("Id"),
	CONSTRAINT "FK_NarudzbaArtikl_Artikl_ArtiklId" FOREIGN KEY ("ArtiklId") REFERENCES "Artikl"("Id")
);