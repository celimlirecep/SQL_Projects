USE Web_06_SQL

--SELECT * FROM viewSatislar

--SELECT AdSoyad,Ismi,fiyat FROM viewSatislar
/*
SELECT 
AdSoyad AS[AD SOYAD]

FROM viewSatislar*/


/*SELECT 
AdSoyad AS 'Ad Soyad',
Fiyat* Adet AS 'Tutar'
from viewSatislar*/

/*SELECT AdSoyad,Fiyat, Adet,Musteri 
FROM viewSatislar
WHERE Musteri ='MUSATERi A'*/

/*SELECT AdSoyad,Ismi,adet,Fiyat,Musteri,tarih,
		Adet * Fiyat AS 'TUTAR'
FROM viewSatislar
WHERE Musteri ='MUSATERi A' and (adet*fiyat) >=20000 or Musteri='musateri c' and (adet*fiyat)>=20000*/


--select* from viewSatislar

-- SATISI YAPILAN URUNLER� L�STELE

/*SELECT DISTINCT Ismi FROM viewSatislar
WHERE Musteri='MUSATER� B' */

/*SELECT
	ADSOYAD,
	�SM�,
	ADET,
	MUSTER� FROM viewSatislaR
	order by musteri,adsoyad*/

	/*SELECT ISM� ,COUNT(ADSOYAD) AS 'ADET SAY�S�' FROM V�EWSAT�SLAR
	GROUP BY ISM�
	ORDER BY ISM� */
/*
	SELECT �smi, SUM(ADET*Fiyat) as 'tutar'
	FROM viewSatislar group by �smi*/
	USE Web_06_SQL
	SELECT adsoyad FROM viewSatislar
