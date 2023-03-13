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

INSERT INTO "Osoba" (Id,Ime,Prezime,OIB,Mobitel,MjestoStanovanja)VALUES 
(1,'Ivan','Horvat','12345678901',null,'Osijek'),
(2,'Ratibor','Vešligaj','32145678901','099123456','Našice'),
(3,'Marko','Čvarko','44445678109','099555456','Beli Manastir'),
(4,'Zlatko','Kokolenković','23245678933','099333444','Donja Špičkovina'),
(5,'Ivo','Patiera','75445678999',null,'Stari Mirkovac');

INSERT INTO "Artikl" VALUES 
(11,'grašak','kg',13.45,13),
(12,'paradajz','kg',7.99,13),
(13,'milka čokolada','kom',22.50,25),
(14,'mlijeko (kozje)','L',9.99,13),
(15,'mlijeko (kravlje)','L',5.30,5),
(16,'tartufi','g',153.66,25);

INSERT INTO "Narudzba" VALUES
(21,201,'2023-02-01 15:45:30',5,1),
(22,202,'2023-02-12 20:15:30',3,1),
(23,301,'2023-01-28 19:45:32',2,4),
(24,302,'2023-02-10 10:45:30',5,4),
(25,303,'2023-02-04 10:12:30',4,2);

INSERT INTO "NarudzbaArtikl" VALUES 
(31,21,14,5),
(32,22,13,1),
(33,23,16,23.2),
(34,24,12,1.885),
(35,25,12,2.3);

--a. Dohvatite sve podatke,
SELECT * FROM "Osoba";

--b. Dohvatite sve podatke, tako da ime i prezime kombinirate u jednom stupcu i imenujte ga s „ime iprezime“
--c. Dohvatite sve podatke iz tablice osoba kojima prezime počinje s slovom P
--d. Dohvatite imena osoba koji nemaju unesen broj mobitela.
--e. Dohvatite sve osobe koje imaju MjestoStanovanja u Osijeku, Našicama ili Vinkovcima.
--f. Dohvati koliko je različitih mjesta stanovanja uneseno u tabliu Osoba.
--g. Dohvati za svaku osobu broj slova u imenu, sve znakove prezimena pretvorite u
--mala slova, svako ime Ivan zamijenite s imenom Leonard i iz mjesta stanovanja dohvatite od--3. znaka sljedećih 5 znakova.