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

-- SATISI YAPILAN URUNLERÝ LÝSTELE

/*SELECT DISTINCT Ismi FROM viewSatislar
WHERE Musteri='MUSATERÝ B' */

/*SELECT
	ADSOYAD,
	ýSMÝ,
	ADET,
	MUSTERÝ FROM viewSatislaR
	order by musteri,adsoyad*/

	/*SELECT ISMÝ ,COUNT(ADSOYAD) AS 'ADET SAYÝSÝ' FROM VÝEWSATÝSLAR
	GROUP BY ISMÝ
	ORDER BY ISMÝ */
/*
	SELECT ýsmi, SUM(ADET*Fiyat) as 'tutar'
	FROM viewSatislar group by ýsmi*/
	USE Web_06_SQL
	SELECT adsoyad FROM viewSatislar
