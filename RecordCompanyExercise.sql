CREATE DATABASE "RecordCompany";

USE "RecordCompany";

CREATE TABLE "Band" (
	"Id" INT NOT NULL PRIMARY KEY,
	"Name" VARCHAR(50) NOT NULL,
);

CREATE TABLE "Album" (
	"Id" INT NOT NULL PRIMARY KEY,
	"Name" VARCHAR(50) NOT NULL,
	"ReleaseYear" INT,
	"BandId" INT NOT NULL,
	CONSTRAINT "FK_Album_Band_BandId" FOREIGN KEY (BandId) REFERENCES Band(Id)
);

CREATE TABLE "Song" (
	"Id" INT NOT NULL PRIMARY KEY,
	"Name" VARCHAR(100) NOT NULL,
	"LengthMinMin" FLOAT NOT NULL,
	"AlbumId" INT NOT NULL,
	CONSTRAINT "FK_Song_Album_AlbumId" FOREIGN KEY (AlbumId) REFERENCES Album(Id)
);




INSERT INTO Band(Id,Name) VALUES (1,'Seventh Wonder');
INSERT INTO Band(Id,Name) VALUES (2,'Metallica');
INSERT INTO Band(Id,Name) VALUES (3,'The Ocean');
INSERT INTO Band(Id,Name) VALUES (4,'Within Temptation');
INSERT INTO Band(Id,Name) VALUES (5,'Death');
INSERT INTO Band(Id,Name) VALUES (6,'Van Canto');
INSERT INTO Band(Id,Name) VALUES (7,'Dream Theater');

INSERT INTO Album(Id,Name,ReleaseYear,BandId) VALUES (1,'Tiara',2018,1);
INSERT INTO Album(Id,Name,ReleaseYear,BandId) VALUES (2,'The Great Escape',2010,1);
INSERT INTO Album(Id,Name,ReleaseYear,BandId) VALUES (3,'Mercy Falls',2008,1);
INSERT INTO Album(Id,Name,ReleaseYear,BandId) VALUES (4,'Master of Puppets',NULL,2);
INSERT INTO Album(Id,Name,ReleaseYear,BandId) VALUES (5,'...And Justice for All',1988,2);
INSERT INTO Album(Id,Name,ReleaseYear,BandId) VALUES (6,'Death Magnetic',2008,2);
INSERT INTO Album(Id,Name,ReleaseYear,BandId) VALUES (7,'Heliocentric',2010,3);
INSERT INTO Album(Id,Name,ReleaseYear,BandId) VALUES (8,'Pelagial',2013,3);
INSERT INTO Album(Id,Name,ReleaseYear,BandId) VALUES (9,'Anthropocentric',2010,3);
INSERT INTO Album(Id,Name,ReleaseYear,BandId) VALUES (10,'Resist',2018,4);
INSERT INTO Album(Id,Name,ReleaseYear,BandId) VALUES (11,'The Unforgiving',2011,4);
INSERT INTO Album(Id,Name,ReleaseYear,BandId) VALUES (12,'Enter',1997,4);
INSERT INTO Album(Id,Name,ReleaseYear,BandId) VALUES (13,'The Sound of Perseverance',1998,5);
INSERT INTO Album(Id,Name,ReleaseYear,BandId) VALUES (14,'IndivIdual Thought Patterns',1993,5);
INSERT INTO Album(Id,Name,ReleaseYear,BandId) VALUES (15,'Human',1991,5);
INSERT INTO Album(Id,Name,ReleaseYear,BandId) VALUES (16,'A Storm to Come',2006,6);
INSERT INTO Album(Id,Name,ReleaseYear,BandId) VALUES (17,'Break the Silence',2011,6);
INSERT INTO Album(Id,Name,ReleaseYear,BandId) VALUES (18,'Tribe of Force',2010,6);

INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (1,'Arrival',1+(30/60),1);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (2,'The Everones',6+(13/60),1);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (3,'Dream Machines',5+(38/60),1);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (4,'Against the Grain',6+(58/60),1);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (5,'Victorious',4+(55/60),1);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (6,'Tiara''s Song (Farewell Pt. 1)',7+(16/60),1);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (7,'Goodnight (Farewell Pt. 2)',7+(10/60),1);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (8,'Beyond Today (Farewell Pt. 3)',5+(06/60),1);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (9,'The Truth',4+(17/60),1);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (10,'By the Light of the Funeral Pyres',3+(54/60),1);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (11,'Damnation Below',6+(44/60),1);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (12,'Procession',0+(45/60),1);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (13,'Exhale',9+(30/60),1);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (14,'Wiseman',5+(42/60),2);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (15,'Alley Cat',6+(06/60),2);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (16,'The Angelmaker',8+(29/60),2);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (17,'King of Whitewater',7+(20/60),2);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (18,'Long Way Home',4+(26/60),2);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (19,'Move on Through',5+(04/60),2);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (20,'The Great Escape',30+(14/60),2);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (21,'A New Beginning',3+(05/60),3);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (22,'There and Back',3+(02/60),3);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (23,'Welcome to Mercy Falls',5+(11/60),3);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (24,'Unbreakable',7+(19/60),3);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (25,'Tears for a Father',1+(58/60),3);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (26,'A Day Away',3+(43/60),3);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (27,'Tears for a Son',1+(42/60),3);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (28,'Paradise',5+(46/60),3);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (29,'Fall in Line',6+(09/60),3);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (30,'Break the Silence',9+(29/60),3);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (31,'HIde and Seek',7+(46/60),3);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (32,'Destiny Calls',6+(18/60),3);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (33,'One Last Goodbye',4+(21/60),3);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (34,'Back in Time',1+(14/60),3);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (35,'The Black Parade',6+(57/60),3);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (36,'Battery',5+(13/60),4);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (37,'Master of Puppets',8+(35/60),4);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (38,'The Thing That Should Not Be',6+(36/60),4);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (39,'Welcome Home (Sanitarium)',6+(27/60),4);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (40,'Disposable Heroes',8+(17/60),4);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (41,'Leper Messiah',5+(40/60),4);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (42,'Orion',8+(27/60),4);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (43,'Damage Inc.',5+(32/60),4);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (44,'Blackened',6+(41/60),5);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (45,'...And Justice for All',9+(47/60),5);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (46,'Eye of the Beholder',6+(30/60),5);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (47,'One',7+(27/60),5);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (48,'The Shortest Straw',6+(36/60),5);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (49,'Harvester of Sorrow',5+(46/60),5);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (50,'The Frayed Ends of Sanity',7+(44/60),5);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (51,'To Live Is to Die',9+(49/60),5);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (52,'Dyers Eve',5+(13/60),5);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (53,'That Was Just Your Life',7+(08/60),6);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (54,'The End of the Line',7+(52/60),6);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (55,'Broken Beat & Scarred',6+(25/60),6);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (56,'The Day That Never Comes',7+(56/60),6);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (57,'All Nightmare Long',7+(58/60),6);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (58,'CyanIde',6+(40/60),6);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (59,'The Unforgiven III',7+(47/60),6);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (60,'The Judas Kiss',8+(01/60),6);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (61,'SuicIde & Redemption',9+(58/60),6);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (62,'My Apocalypse',5+(01/60),6);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (63,'Shamayim',1+(53/60),7);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (64,'Firmament',7+(29/60),7);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (65,'The First Commandment of the Luminaries',6+(47/60),7);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (66,'Ptolemy Was Wrong',6+(28/60),7);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (67,'Metaphysics of the Hangman',5+(41/60),7);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (68,'Catharsis of a Heretic',2+(08/60),7);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (69,'Swallowed by the Earth',4+(59/60),7);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (70,'Epiphany',3+(37/60),7);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (71,'The Origin of Species',7+(23/60),7);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (72,'The Origin of God',4+(33/60),7);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (73,'Epipelagic',1+(12/60),8);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (74,'Mesopelagic: Into the Uncanny',5+(56/60),8);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (75,'Bathyalpelagic I: Impasses',4+(24/60),8);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (76,'Bathyalpelagic II: The Wish in Dreams',3+(18/60),8);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (77,'Bathyalpelagic III: Disequilibrated',4+(27/60),8);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (78,'Abyssopelagic I: Boundless Vasts',3+(27/60),8);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (79,'Abyssopelagic II: Signals of Anxiety',5+(05/60),8);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (80,'Hadopelagic I: Omen of the Deep',1+(07/60),8);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (81,'Hadopelagic II: Let Them Believe',9+(17/60),8);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (82,'Demersal: Cognitive Dissonance',9+(05/60),8);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (83,'Benthic: The Origin of Our Wishes',5+(55/60),8);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (84,'Anthropocentric',9+(24/60),9);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (85,'The Grand Inquisitor I: Karamazov Baseness',5+(02/60),9);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (86,'She Was the Universe',5+(39/60),9);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (87,'For He That Wavereth...',2+(07/60),9);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (88,'The Grand Inquisitor II: Roots & Locusts',6+(33/60),9);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (89,'The Grand Inquisitor III: A Tiny Grain of Faith',1+(56/60),9);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (90,'Sewers of the Soul',3+(44/60),9);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (91,'Wille zum Untergang',6+(03/60),9);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (92,'Heaven TV',5+(04/60),9);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (93,'The Almightiness Contradiction',4+(34/60),9);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (94,'The Reckoning',4+(11/60),10);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (95,'Endless War',4+(09/60),10);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (96,'Raise Your Banner',5+(34/60),10);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (97,'Supernova',5+(34/60),10);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (98,'Holy Ground',4+(10/60),10);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (99,'In Vain',4+(25/60),10);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (100,'Firelight',4+(46/60),10);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (101,'Mad World',4+(57/60),10);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (102,'Mercy Mirror',3+(49/60),10);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (103,'Trophy Hunter',5+(51/60),10);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (104,'Why Not Me',0+(34/60),11);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (105,'Shot in the Dark',5+(02/60),11);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (106,'In the MIddle of the Night',5+(11/60),11);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (107,'Faster',4+(23/60),11);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (108,'Fire and Ice',3+(57/60),11);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (109,'Iron',5+(40/60),11);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (110,'Where Is the Edge',3+(59/60),11);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (111,'Sinéad',4+(23/60),11);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (112,'Lost',5+(14/60),11);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (113,'Murder',4+(16/60),11);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (114,'A Demon''s Fate',5+(30/60),11);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (115,'Stairway to the Skies',5+(32/60),11);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (116,'Restless',6+(08/60),12);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (117,'Enter',7+(15/60),12);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (118,'Pearls of Light',5+(15/60),12);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (119,'Deep Within',4+(30/60),12);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (120,'Gatekeeper',6+(43/60),12);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (121,'Grace',5+(10/60),12);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (122,'Blooded',3+(38/60),12);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (123,'Candles',7+(07/60),12);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (124,'Scavenger of Human Sorrow',6+(56/60),13);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (125,'Bite the Pain',4+(29/60),13);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (126,'Spirit Crusher',6+(47/60),13);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (127,'Story to Tell',6+(34/60),13);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (128,'Flesh and the Power It Holds',8+(26/60),13);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (129,'Voice of the Soul',3+(43/60),13);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (130,'To Forgive Is to Suffer',5+(55/60),13);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (131,'A Moment of Clarity',7+(25/60),13);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (132,'Painkiller',6+(02/60),13);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (133,'Overactive Imagination',3+(30/60),14);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (134,'In Human Form',3+(57/60),14);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (135,'Jealousy',3+(41/60),14);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (136,'Trapped in a Corner',4+(14/60),14);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (137,'Nothing Is Everything',3+(19/60),14);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (138,'Mentally Blind',4+(49/60),14);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (139,'IndivIdual Thought Patterns',4+(01/60),14);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (140,'Destiny',4+(06/60),14);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (141,'Out of Touch',4+(22/60),14);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (142,'The Philosopher',4+(13/60),14);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (143,'Flattening of Emotions',4+(28/60),15);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (144,'SuicIde Machine',4+(23/60),15);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (145,'Together as One',4+(10/60),15);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (146,'Secret Face',4+(39/60),15);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (147,'Lack of Comprehension',3+(43/60),15);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (148,'See Through Dreams',4+(39/60),15);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (149,'Cosmic Sea',4+(27/60),15);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (150,'Vacant Planets',3+(52/60),15);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (151,'Stora Rövardansen',1+(33/60),16);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (152,'King',3+(44/60),16);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (153,'The Mission',4+(18/60),16);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (154,'Lifetime',4+(49/60),16);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (155,'Rain',4+(03/60),16);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (156,'She''s Alive',4+(12/60),16);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (157,'I Stand Alone',4+(44/60),16);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (158,'Starlight',4+(40/60),16);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (159,'Battery',5+(13/60),16);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (160,'If I Die in Battle',4+(46/60),17);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (161,'The Seller of Souls',3+(24/60),17);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (162,'Primo Victoria',3+(44/60),17);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (163,'Dangers in My Head',4+(05/60),17);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (164,'Black Wings of Hate',4+(41/60),17);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (165,'Bed of Nails',3+(37/60),17);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (166,'Spelled in Waters',4+(26/60),17);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (167,'Neuer Wind',3+(21/60),17);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (168,'The Higher Flight',5+(00/60),17);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (169,'Master of the Wind',6+(09/60),17);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (170,'Lost Forever',4+(44/60),18);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (171,'To Sing a Metal Song',3+(24/60),18);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (172,'One to Ten',4+(06/60),18);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (173,'I Am Human',3+(56/60),18);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (174,'My Voice',5+(30/60),18);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (175,'Rebellion',4+(05/60),18);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (176,'Last Night of the Kings',3+(52/60),18);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (177,'Tribe of Force',3+(17/60),18);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (178,'Water Fire Heaven Earth',3+(32/60),18);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (179,'Master of Puppets',8+(23/60),18);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (180,'Magic Taborea',3+(22/60),18);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (181,'Hearted',4+(00/60),18);
INSERT INTO Song(Id,Name,LengthMin,AlbumId) VALUES (182,'Frodo''s Dream',3+(06/60),18);

