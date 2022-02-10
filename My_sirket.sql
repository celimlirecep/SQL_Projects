USE Sirket

CREATE TABLE tblDepartmanlar(
	ID int IDENTITY(1,1) NOT NULL,
	DepartmanIsmi varchar(15) NOT NULL,
	PRIMARY KEY(ID)
)

CREATE TABLE tblUnvanlar(
ID int IDENTITY(1,1) NOT NULL,
UnvanAdi varchar(15)
PRIMARY KEY(ID),
)

CREATE TABLE tblIller(
PlakaNo int IDENTITY(1,1) NOT NULL,
Ilismi varchar(15) NOT NULL,
PRIMARY KEY(PlakaNo),
)

CREATE TABLE tblIlceler(
ID int IDENTITY(1,1) NOT NULL,
Ilce varchar(15) NOT NULL,
HangiIL int NOT NULL,
PRIMARY KEY(ID),
FOREIGN KEY (HangiIL) REFERENCES tblIller(PlakaNo)
)

CREATE TABLE tblProjeler(
ID int IDENTITY(1,1) NOT NULL,
ProjeAdi varchar(30) NOT NULL,
BAaslamaTarihi date NOT NULL,
PlanlananBitisTarihi date NOT NULL,
PRIMARY KEY(ID),
)

CREATE TABLE tbLPersonel(
ID int IDENTITY(1,1) NOT NULL,
PersonelIsmi varchar(15) NOT NULL,
PersonelSoyIsmi varchar(15) NOT NULL,
Cinsiyet char(1) NOT NULL,
DogumTarihi date NOT NULL,
DogumYeriID int NOT NULL,
IseBaslamaTarihi date NOT NULL,
DepartmanID  int NOT NULL,
UnvanlarID int NOT NULL,
Maas decimal(10,2),
PRIMARY KEY(ID),
FOREIGN KEY (DepartmanID) REFERENCES tblDepartmanlar(ID),
FOREIGN KEY   (UnvanlarID) REFERENCES tblUnvanlar(ID),
FOREIGN KEY   (DogumYeriID) REFERENCES tblIlceler(ID)
)

CREATE TABLE tblGorevlendirme(
ID int IDENTITY(1,1) NOT NULL,
ProjeAdi int NOT NULL,
Personel int NOT NULL,
PRIMARY KEY(ID),
FOREIGN KEY  (ProjeAdi) REFERENCES tblProjeler(ID),
FOREIGN KEY  (Personel) REFERENCES tblPersonel(ID),
)
