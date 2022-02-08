USE WEB_6_SQL_Refresh

CREATE  TABLE tblBolumler(
		ID int IDENTITY(1,1) NOT NULL,
		Bolum_AD varchar(20) NOT NULL
		PRIMARY KEY(ID)
)
CREATE  TABLE tblCalisanlar(
		ID int IDENTITY(1,1) NOT NULL,
		TCNo char(11) NULL,
		AdSoyad varchar(30) NOT NULL,
		Cinsiyet char(1) NOT NULL,
		BolumID int NOT NULL,
		PRIMARY KEY (ID),
		FOREIGN KEY (BolumID) REFERENCES tblBolumler(ID)
)

CREATE  TABLE tblUrunler(
		ID int IDENTITY(1,1) NOT NULL,
		UrunAdi varchar(20) NOT NULL,
		StokMiktari int NOT NULL,
		SatisFiyati decimal(10,2) NOT NULL,
		AlisFiyati decimal(10,2) NOT NULL,
		PRIMARY KEY (ID),

)

CREATE  TABLE tblSatislar(
		ID int IDENTITY(1,1) NOT NULL,
		UrunID int NOT NULL,
		CalisanID int NOT NULL,
		Adet int NOT NULL,
		SatisBirimFiyati decimal(10,2) NOT NULL,
		SatisTarihi date NOT NULL,
		Musteri char(20) NOT NULL,
		PRIMARY KEY (ID),
		FOREIGN KEY (UrunID) REFERENCES tblUrunler(ID),
		FOREIGN KEY (CalisanID) REFERENCES tblCalisanlar(ID)
)

CREATE  TABLE tblAlislar(
		ID int IDENTITY(1,1) NOT NULL,
		CalisanID int NOT NULL,
		UrunID int NOT NULL,
		Adet int NOT NULL,
		AlisBirimFiyati decimal(10,2) NOT NULL,
		AlisTarihi date NOT NULL,
		Tedarikci char(20) NOT NULL,
		PRIMARY KEY (ID),
		FOREIGN KEY (UrunID) REFERENCES tblUrunler(ID),
		FOREIGN KEY (CalisanID) REFERENCES tblCalisanlar(ID)
)

