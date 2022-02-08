CREATE TABLE tblBolumler(
			ID int NOT NULL,
			Bolum_Ad varchar(30) NULL,
			PRIMARY KEY (ID)

)
CREATE TABLE tblCalisanlar(
			ID int NOT NULL,
			TcNo char(11) NOT NULL,
			AdSoyad varchar(30) NOT NULL,
			Cinsiyet char(1) NOT NULL,
			BolumID int NOT NULL,
			PRIMARY KEY(ID),
			FOREIGN KEY(BolumID) REFERENCES tblBolumler(ID)


)

CREATE TABLE tblUrunler(
		ID int IDENTITY(1,1)  NOT NULL,
		Ismi varchar(20) NOT NULL,
		StokMiktari int NOT NULL,
		Fiyat decimal NOT NULL,
		PRIMARY KEY (ID)

)

