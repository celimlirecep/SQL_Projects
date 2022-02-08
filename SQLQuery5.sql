USE Web_06_SQL

CREATE TABLE tblAlislar(
		ID int IDENTITY(1,1) NOT NULL,
		CalisanID int NOT NULL,
		Tedarikci varchar(max) NOT NULL,
		UrunID int NOT NULL,
		Adet int NOT NULL,
		AlisBirimFiyat decimal(10,2) NOT NULL,
		Tarih date NOT NULL,
		PRIMARY KEY(ID),
		FOREIGN KEY(UrunID) REFERENCES tblUrunler(ID),
		FOREIGN KEY(CalisanID) REFERENCES tblCalisanlar(ID)


)
