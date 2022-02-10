USE Sirket
SELECT *
FROM tblIl INNER JOIN tblIlce ON tblIl.ID=tblIlce.IlID
--********************************TÜM TABLO BÝRLESTÝR YAZ
SELECT *
FROM tblIlce INNER JOIN tblIl ON tblIl.ID=tblIlce.IlID
--************************* TABLO BASLIKLARINI BÝRLESTÝRMEK
USE Sirket10
SELECT tblPersonel.Ad +' '+ tblPersonel.Soyad AS 'Ad Soyad',tblDepartman.DepartmanAd
FROM tblPersonel INNER JOIN tblDepartman
	ON tblPersonel.DepartmanID= tblDepartman.ID

--************************* PERSONEL KAC NUMARALÝ PROJE VERÝLMÝS
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

--ÝSTANBULDA YASAYAN PERSONEL SAYISI
SELECT COUNT(tblPersonel.ID) AS ' personel Sayisi' FROM tblPersonel INNER JOIN tblIlce ON tblpersonel.IlceID=tblIlce.ID 
INNER JOIN tblIl ON tblIl.ID=tblIlce.IlID
WHERE tblýl.IlAd='Ýstanbul'

--il sayisi kac kisi
USE Sirket10
SELECT tblIl.ILad,
COUNT(tblPersonel.ID) AS ' personel Sayisi'
FROM tblPersonel 
INNER JOIN tblIlce ON tblpersonel.IlceID=tblIlce.ID 
INNER JOIN tblIl ON tblIl.ID=tblIlce.IlID
GROUP BY tbLIl.IlAd
--CÝNSÝYETE GÖRE MAAÞ TOPLAMLARÝ

USE Sirket10
SELECT tblpersonel.Cinsiyet ,SUM(tblpersonel.maas)from tblPersonel
GROUP BY tblpersonel.Cinsiyet

--Güvenli alan projesindeki erkek modeli
USE Sirket10
SELECT * FROM tblPersonel INNER JOIN tblGorevlendirme ON tblPersonel.ID=tblgorevlendirme.PersonelID
INNER JOIN tblProje ON tblGorevlendirme.ProjeID=TBLProje.ID 
WHERE tblProje.ProjeAd='Güvenli alan' and tblPersonel.Cinsiyet='E'

--akýllý robot projesinde yer alan personelden istanbul ve ankarada yaþayan kadýnlarýn adý soyadýný 
--yasadýgý þehri ve proje adýný 

SELECT tblPersonel.AD,
+' '+ tblPersonel.SoyAd,tblProje.ProjeAd, tblPersonel.cinsiyet from tblpersonel 
INNER JOIN tblgorevlendirme ON tblgorevlendirme.PersonelID=tblPersonel.ID
INNER JOIN tblProje ON tblProje.ID=tblGorevlendirme.ProjeID
INNER JOIN tblILce ON tblILce.ID=tblPersonel.IlceID
INNER JOIN TBLýl ON TBLIL.ID=TBLILCE.ILID
WHERE (tblIl.ýlad='istanbul' or tblIl.ýlad='ankara') 
and tblPersonel.cinsiyet='K'
and tblProje.ProjeAd='akýllý robot'

--SOLDAKÝ VE SAÐDAKÝNE GÖRE TÜM TABLOLARI ALIR DÝÐER TARAFI BOÞ OLSA BÝLE
USE Sirket10
SELECT TBLIL.ILAD,TBLILCE.ILCEAD
FROM tblIlce RIGHT JOIN tblIl  ON tblIlce.IlID=tblIl.ID

--HANGÝ PERSONELE HANGÝ PROJE ATANMIÞ PROJE ATANMASA BÝLE GÖSTER
USE Sirket10
SELECT TBLPERSONEL.AD+' '+tblPersonel.SoyAd AS 'AD SOYAD',TBLproje.ProjeAD 
from tblPersonel LEFT JOIN  tblGorevlendirme 
        ON tblPersonel.ID=tblGorevlendirme.PersonelID  LEFT JOIN tblProje
			ON tblgorevlendirme.ProjeID=tblproje.ID

--USTTEKÝ REVÝZE EDÝLEREL HANGÝ PERSONELE KAC PROJE ATANMIS

USE Sirket10
SELECT TBLPERSONEL.AD+' '+tblPersonel.SoyAd AS 'AD SOYAD', COUNT(tblGorevlendirme.ProjeID) AS 'Proje sayisi'
from tblPersonel LEFT JOIN  tblGorevlendirme 
        ON tblPersonel.ID=tblGorevlendirme.PersonelID  
		GROUP BY tblpersonel.AD,tblPersonel.Soyad

--hangi sehirde hangi projeyi kime atadým,Tüm sehirler gösterilecek
--ÝL PROJE ADÝ PERSONEL AD SOYAD
USE Sirket10
SELECT tblIl.Ilad,tblýlce.ýlcead,tblproje.ProjeAd, tblPersonel.Ad+' '+ tblPersonel.Soyad AS ' AD SOYAD'
FROM tblPersonel INNER JOIN tblgorevlendirme 
	ON tblPersonel.ID=tblGorevlendirme.PersonelID INNER JOIN tblProje
		ON tblproje.ID=tblGorevlendirme.ProjeID RIGHT JOIN tblILce
			ON tblIlce.ID= tblpersonel.IlceID JOIN tblIl 
				ON tblIl.ID=tblýlce.IlID

--Ýstanbuldaki personellerin içinden mutlu genclik projesinde görevli kiþileri ad soyat ve cinsiyetleri ile birlikte listeleyelim

USE Sirket10
SELECT tblpersonel.AD+' '+tblpersonel.SoyAD AS 'Ad SOyad', tblpersonel.cinsiyet,tblproje.ProjeAd
FROM tblpersonel INNER JOIN tblIlce 
	ON tblpersonel.ýlceID=tblIlce.ID INNER JOIN tblýl 
		ON tblýl.ID=tblIlce.IlID INNER JOIN tblgorevlendirme
			ON tblgorevlendirme.PersonelID = tblpersonel.ID INNER JOIN tblProje
				ON tblproje.ID= tblgorevlendirme.ProjeID
WHERE tblproje.ProjeAd='MUTLU GENÇLÝK' AND tblIl.IlAd='istanbul'
--cinsiyete göre proje sayisi
USE Sirket10
SELECT tblpersonel.cinsiyet ,COUNT(tblgorevlendirme.ProjeID) AS ' ADET' 
	FROM tblpersonel INNER JOIN tblIlce 
		ON tblpersonel.ýlceID=tblIlce.ID INNER JOIN tblýl 
			ON tblýl.ID=tblIlce.IlID INNER JOIN tblgorevlendirme
				ON tblgorevlendirme.PersonelID = tblpersonel.ID 
    GROUP BY tblpersonel.cinsiyet

--HANGÝ PROJENÝN KÝME ATANDIGINI GÖRMEK ÝSTÝYORUM - PROJELERÝN HEPSÝ GÖRUNSUN
USE Sirket10
SELECT tblPersonel.Ad+' '+ tblPersonel.Soyad AS ' AD SOYAD',tblGorevlendirme.ProjeID,tblProje.ProjeAd 
FROM tblPersonel RIGHT JOIN tblgorevlendirme 
	ON tblPersonel.ID=tblGorevlendirme.PersonelID RIGHT JOIN tblProje
	ON tblGorevlendirme.ProjeID=tblProje.ID


-- 