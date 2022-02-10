USE Sirket
SELECT *
FROM tblIl INNER JOIN tblIlce ON tblIl.ID=tblIlce.IlID
--********************************T�M TABLO B�RLEST�R YAZ
SELECT *
FROM tblIlce INNER JOIN tblIl ON tblIl.ID=tblIlce.IlID
--************************* TABLO BASLIKLARINI B�RLEST�RMEK
USE Sirket10
SELECT tblPersonel.Ad +' '+ tblPersonel.Soyad AS 'Ad Soyad',tblDepartman.DepartmanAd
FROM tblPersonel INNER JOIN tblDepartman
	ON tblPersonel.DepartmanID= tblDepartman.ID

--************************* PERSONEL KAC NUMARAL� PROJE VER�LM�S
SELECT tblPersonel.Ad+' '+tblPersonel.Soyad, tblGorevlendirme.ProjeID 
FROM tblGorevlendirme INNER JOIN tblPersonel ON tblGorevlendirme.PersonelID=tblPersonel.ID
ORDER BY Ad
--WHERE projeID='2'
--********************************
USE Sirket10
SELECT tblPersonel.Ad+' '+tblPersonel.Soyad, tblProje.ProjeAd
FROM tblGorevlendirme 
INNER JOIN tblPersonel ON tblGorevlendirme.PersonelID=tblPersonel.ID 
INNER JOIN tblProje ON tblProje.ID= tblGorevlendirme.ProjeID
ORDER BY Ad

--�STANBULDA YASAYAN PERSONEL SAYISI
SELECT COUNT(tblPersonel.ID) AS ' personel Sayisi' FROM tblPersonel INNER JOIN tblIlce ON tblpersonel.IlceID=tblIlce.ID 
INNER JOIN tblIl ON tblIl.ID=tblIlce.IlID
WHERE tbl�l.IlAd='�stanbul'

--il sayisi kac kisi
USE Sirket10
SELECT tblIl.ILad,
COUNT(tblPersonel.ID) AS ' personel Sayisi'
FROM tblPersonel 
INNER JOIN tblIlce ON tblpersonel.IlceID=tblIlce.ID 
INNER JOIN tblIl ON tblIl.ID=tblIlce.IlID
GROUP BY tbLIl.IlAd
--C�NS�YETE G�RE MAA� TOPLAMLAR�

USE Sirket10
SELECT tblpersonel.Cinsiyet ,SUM(tblpersonel.maas)from tblPersonel
GROUP BY tblpersonel.Cinsiyet

--G�venli alan projesindeki erkek modeli
USE Sirket10
SELECT * FROM tblPersonel INNER JOIN tblGorevlendirme ON tblPersonel.ID=tblgorevlendirme.PersonelID
INNER JOIN tblProje ON tblGorevlendirme.ProjeID=TBLProje.ID 
WHERE tblProje.ProjeAd='G�venli alan' and tblPersonel.Cinsiyet='E'

--ak�ll� robot projesinde yer alan personelden istanbul ve ankarada ya�ayan kad�nlar�n ad� soyad�n� 
--yasad�g� �ehri ve proje ad�n� 

SELECT tblPersonel.AD,
+' '+ tblPersonel.SoyAd,tblProje.ProjeAd, tblPersonel.cinsiyet from tblpersonel 
INNER JOIN tblgorevlendirme ON tblgorevlendirme.PersonelID=tblPersonel.ID
INNER JOIN tblProje ON tblProje.ID=tblGorevlendirme.ProjeID
INNER JOIN tblILce ON tblILce.ID=tblPersonel.IlceID
INNER JOIN TBL�l ON TBLIL.ID=TBLILCE.ILID
WHERE (tblIl.�lad='istanbul' or tblIl.�lad='ankara') 
and tblPersonel.cinsiyet='K'
and tblProje.ProjeAd='ak�ll� robot'

--SOLDAK� VE SA�DAK�NE G�RE T�M TABLOLARI ALIR D��ER TARAFI BO� OLSA B�LE
USE Sirket10
SELECT TBLIL.ILAD,TBLILCE.ILCEAD
FROM tblIlce RIGHT JOIN tblIl  ON tblIlce.IlID=tblIl.ID

--HANG� PERSONELE HANG� PROJE ATANMI� PROJE ATANMASA B�LE G�STER
USE Sirket10
SELECT TBLPERSONEL.AD+' '+tblPersonel.SoyAd AS 'AD SOYAD',TBLproje.ProjeAD 
from tblPersonel LEFT JOIN  tblGorevlendirme 
        ON tblPersonel.ID=tblGorevlendirme.PersonelID  LEFT JOIN tblProje
			ON tblgorevlendirme.ProjeID=tblproje.ID

--USTTEK� REV�ZE ED�LEREL HANG� PERSONELE KAC PROJE ATANMIS

USE Sirket10
SELECT TBLPERSONEL.AD+' '+tblPersonel.SoyAd AS 'AD SOYAD', COUNT(tblGorevlendirme.ProjeID) AS 'Proje sayisi'
from tblPersonel LEFT JOIN  tblGorevlendirme 
        ON tblPersonel.ID=tblGorevlendirme.PersonelID  
		GROUP BY tblpersonel.AD,tblPersonel.Soyad

--hangi sehirde hangi projeyi kime atad�m,T�m sehirler g�sterilecek
--�L PROJE AD� PERSONEL AD SOYAD
USE Sirket10
SELECT tblIl.Ilad,tbl�lce.�lcead,tblproje.ProjeAd, tblPersonel.Ad+' '+ tblPersonel.Soyad AS ' AD SOYAD'
FROM tblPersonel INNER JOIN tblgorevlendirme 
	ON tblPersonel.ID=tblGorevlendirme.PersonelID INNER JOIN tblProje
		ON tblproje.ID=tblGorevlendirme.ProjeID RIGHT JOIN tblILce
			ON tblIlce.ID= tblpersonel.IlceID JOIN tblIl 
				ON tblIl.ID=tbl�lce.IlID

--�stanbuldaki personellerin i�inden mutlu genclik projesinde g�revli ki�ileri ad soyat ve cinsiyetleri ile birlikte listeleyelim

USE Sirket10
SELECT tblpersonel.AD+' '+tblpersonel.SoyAD AS 'Ad SOyad', tblpersonel.cinsiyet,tblproje.ProjeAd
FROM tblpersonel INNER JOIN tblIlce 
	ON tblpersonel.�lceID=tblIlce.ID INNER JOIN tbl�l 
		ON tbl�l.ID=tblIlce.IlID INNER JOIN tblgorevlendirme
			ON tblgorevlendirme.PersonelID = tblpersonel.ID INNER JOIN tblProje
				ON tblproje.ID= tblgorevlendirme.ProjeID
WHERE tblproje.ProjeAd='MUTLU GEN�L�K' AND tblIl.IlAd='istanbul'
--cinsiyete g�re proje sayisi
USE Sirket10
SELECT tblpersonel.cinsiyet ,COUNT(tblgorevlendirme.ProjeID) AS ' ADET' 
	FROM tblpersonel INNER JOIN tblIlce 
		ON tblpersonel.�lceID=tblIlce.ID INNER JOIN tbl�l 
			ON tbl�l.ID=tblIlce.IlID INNER JOIN tblgorevlendirme
				ON tblgorevlendirme.PersonelID = tblpersonel.ID 
    GROUP BY tblpersonel.cinsiyet

--HANG� PROJEN�N K�ME ATANDIGINI G�RMEK �ST�YORUM - PROJELER�N HEPS� G�RUNSUN
USE Sirket10
SELECT tblPersonel.Ad+' '+ tblPersonel.Soyad AS ' AD SOYAD',tblGorevlendirme.ProjeID,tblProje.ProjeAd 
FROM tblPersonel RIGHT JOIN tblgorevlendirme 
	ON tblPersonel.ID=tblGorevlendirme.PersonelID RIGHT JOIN tblProje
	ON tblGorevlendirme.ProjeID=tblProje.ID


-- 