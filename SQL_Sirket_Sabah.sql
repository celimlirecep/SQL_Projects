USE SirketSabah

--Departman Tablosu
CREATE TABLE tblDepartman(
	ID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Ad VARCHAR(30) UNIQUE NOT NULL
)

--Departman tablosu veri girisi
INSERT INTO tblDepartman
VALUES ('Kalite'),('Yonetim'),('Ar-ge'),('Teknik')

-- Unvanlar Tablosu
CREATE TABLE tblUnvanlar(
	ID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Ad VARCHAR(30) UNIQUE NOT NULL
)
--Unvanlar veri girisi

INSERT INTO tblUnvanlar
VALUES ('muhendis'),('IK uzmani'),('Teknisyen')

--Iller tablosu

CREATE TABLE tblIller(
	ID CHAR(2) NOT NULL,
	Ad VARCHAR(30) UNIQUE NOT NULL,
	PRIMARY KEY(ID)
)
--Iller Tablosuna veri girisi

INSERT INTO tblIller
VALUES ('06','ANKARA'),('34','ISTANBUL'),('35','IZMIR'),('58','SIVAS')

--Ilceler tablosu

CREATE TABLE tblIlce(
	ID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Ad VARCHAR(30) NOT NULL,
	IlID CHAR(2) REFERENCES tblIller(ID) NOT NULL,
	--FOREIGN KEY (IlID) REFERENCES tblIller(ID)	
)
--tblIlce veri girisi

INSERT INTO tblIlce
VALUES	('CANKAYA','06'),('YENIMAHALLE','06'),('POLATLI','06'),
		('BEYLIKDUZU','34'),('BAKIRKOY','34'),('BESIKTAS','34'),
		('KARSIYAKA','35'),('KONAK','35'),('CESME','35')

		

--Projeler Tablosu

CREATE TABLE tblProjeler(
ID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
Ad  VARCHAR(40) UNIQUE NOT NULL,
BaslamaTarihi DATE NULL,
PlanlananBitisTarihi DATE NULL,
)

INSERT INTO tblProjeler
VALUES	('YESIL DUNYA','2022.3.5','2022.11.10'),
		('GUVENLI AG',NULL,NULL),
		('MUTLU SEHÝRLER','2022.4.4',NULL),
		('AKILLI EVLER',NULL,'2022.6.12')

--Personel Tablosu

CREATE TABLE tblPersonel(
		ID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
		Ad VARCHAR(30) NOT NULL,
		Soyad VARCHAR(30) NOT NULL,
		Cinsiyet CHAR(1) NOT NULL,
		DogumTarihi DATE NOT NULL,
		DogumYeri INT REFERENCES tblIlce(ID) NOT NULL,
		IseBaslamaTarihi DATE,
		DepartmanID INT REFERENCES tblDepartman(ID) not null,
		UnvanID INT REFERENCES tblUnvanlar(ID) NOT NULL,
		Maas DECIMAL(10,2) NOT NULL,
)

--tblPersonel veri girisi
INSERT INTO tblPersonel
VALUES--('RECEP','CELIMLI','E','1998.11.11',2,'2022.5.6',1,1,32100),
--	    ('AHMET','EKINCI','E','1995.10.12',3,'2022.4.6',2,2,12500),
--	    ('SEYMA','KUCUR','K','2000.5.8',7,'2022.5.6',3,3,18500),
		('Demet','ÇOLAK','K','1982.05.05',5,'2005.06.17',3,3,405),
		('Evrim','ÇITAK','K','1987.12.05',1,'2000.01.12',2,1,30),
		('Figen','ESMER','K','1982.10.22',4,'1998.05.07',1,2,35),
		('Galip','TANAR','E','1983.02.28',9,'1997.05.07',1,2,35),
		('Emir','YANIK','E','1975.05.07',2,'2010.07.17',2,2,45),
		('Ilgýn','ACI','E','1974.05.01',2,'2000.08.18',3,2,40),
		('Ýskender','TAÞ','E','1974.07.02',7,'1995.09.05',4,1,40),
		('Jale','CAN','K','1976.09.18',    5,'1998.10.12',2,2,45),
		('Kamil','ALBAYRAK','E','1976.08.19',9,'2000.11.25',1,2,30),
		('Leman','HASKIRIÞ','K','1978.09.20',6,'1999.10.27',1,2,35),
		('Meltem','UYSAL','K','1985.08.04',6,'2000.05.27',1,2,300),
		('Necati','UYSAL','E','1990.12.01',4,'2000.03.06',2,1,30),
		('Osman','UYSAL','E','1982.02.15',6,'1995.05.12',4,3,30),
		('Ömer','BUZDAÐ','E','1980.10.30',5,'2001.08.10',1,2,40),
		('Perihan','KANAT','K','1980.10.28',4,'2001.07.11',4,1,30),
		('Ramiz','ÇAKIR','E','1981.11.19',7,'2001.07.30',4,3,30),
		('Sertaç','KÖSEDAÐ','E','1981.12.20',9,'2002.12.20',3,2,30),
		('Þefik','ÇAPANOÐLU','E','1982.02.20',6,'1998.05.25',3,3,30),
		('Taner','BOZOKLU','E','1983.07.21',5,'2005.09.05',1,2,30),
		('Utku','DUMAN','E','1975.06.13',6,'2005.03.05',1,3,30),
		('Ümit','ÞÝRÝN','E','1978.04.02',7,'1998.04.04',2,2,35),
		('Veysel','ERTÜZÜN','E','1980.07.03',3,'2002.07.18',4,3,35),
		('Yakup','GÖKÇE','E','1975.06.18',2,'2002.03.25',4,3,35),
		('Zeliha','CANÝÞ','K','1978.03.03',5,'2005.08.13',1,3,40)

CREATE TABLE tblGorevlendirmeler(
ID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
ProjeID INT REFERENCES  tblProjeler(ID) NOT NULL,
PersonelID INT  REFERENCES tblPersonel(ID) NOT NULL
CONSTRAINT ProjePersonelTekil UNIQUE (ProjeID,PersonelID)
)

--TBLGOEVLERNDÝRMELER VERÝ GÝRÝSÝ

INSERT INTO tblGorevlendirmeler
VALUES (1,3),(1,5),(1,7),(1,8),(1,11),
	   (2,1),(2,3),(2,10),(2,13),(2,12),
	   (3,4),(3,9),(3,15),(3,19),(3,21),
	   (4,2),(4,8),(4,10),(4,20),(4,27)

-- PERSONEL ADÝ SOYADÝ DOGUMYERÝ
SELECT Ad,Soyad,IlceAdi FROM viwCalýsanBilgileri
WHERE IlceAdi='Bakýrkoy'

SELECT Ad,SoyAd,IlAdi,IlceAdi FROM viwCalýsanBilgileri
WHERE IlAdi='Istanbul' and IlceAdi='bakýrkoy'


--SELECT DISTINCT Ad FROM viwCalýsanBilgileri

-- ad ysanan yer proje adi
USE 
SELECT [PROJE ADI],ÝL FROM viwProjePersonel
WHERE ÝL='ISTANBUL'

SELECT COUNT(dogumYeri) from  tblPersonel
where dogumYeri=4 or dogumYeri=5 or dogumYeri= 6
