USE Web_Creat_Deneme
/*CREATE TABLE tbl_kurslar(
		ID int NOT NULL,
		KUSLAR varchar(20) NOT NULL
		PRIMARY KEY(ID)
)
CREATE TABLE tbl_siniflar(
		ID int NOT NULL,
		ISIM varchar(20) NOT NULL,
		CINSIYET varchar(1) NULL,
		TC CHAR(11) NOT NULL,
		KursID int NOT NULL,
		PRIMARY KEY(ID),
		FOREIGN KEY(KursID) REFERENCES dbo.tbl_kurslar(ID)
)*/
SELECT tbl_siniflar.ISIM,
		tbl_siniflar.CINSIYET,
		tbl_siniflar.KursID
		FROM	tbl_siniflar